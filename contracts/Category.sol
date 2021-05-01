pragma solidity >=0.7.0 <0.8.0;
pragma experimental ABIEncoderV2;
import "./Offer.sol";

contract PTMCategories {
    struct category {
        string name;
        address offer_contract;
    }

    struct Job {
        address offer_contract;
        uint256 id;
    }

    category[] public categories;
    uint256 public total_categories;
    mapping(address => address[]) public client_orders;
    mapping(address => address[]) public service_provider_orders;
    mapping(address => Job[]) public posted_gigs;

    function create(string memory name) public {
        PTMOffers ptm_offer = new PTMOffers();

        ptm_offer.setCategory(name);

        category memory cat = category(name, address(ptm_offer));

        categories.push(cat);

        total_categories++;
    }

    function getAllCategpries() public view returns (category[] memory) {
        return categories;
    }

    function addNewUserGig(
        address user,
        address gig,
        uint256 id
    ) public {
        posted_gigs[user].push(Job(gig, id));
    }

    function getUserGigs(address user) public view returns (Job[] memory) {
        return posted_gigs[user];
    }

    function addNewClientOrder(address client_adr, address orderContract)
        public
    {
        client_orders[client_adr].push(orderContract);
    }

    function addNewServiceProviderOrder(
        address service_provider_adr,
        address orderContract
    ) public {
        service_provider_orders[service_provider_adr].push(orderContract);
    }

    function getClientOrders(address client_adr)
        public
        view
        returns (address[] memory)
    {
        return client_orders[client_adr];
    }

    function getServiceProviderOrders(address serviceProvider_adr)
        public
        view
        returns (address[] memory)
    {
        return service_provider_orders[serviceProvider_adr];
    }
}
