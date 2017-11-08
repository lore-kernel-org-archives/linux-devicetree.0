From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] [net-next?] of: add of_property_read_variable_* dummy
 helpers
Date: Wed, 08 Nov 2017 13:36:02 +0900 (KST)
Message-ID: <20171108.133602.1192972972086140265.davem@davemloft.net>
References: <20171106132627.150459-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171106132627.150459-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de
Cc: vivien.didelot@savoirfairelinux.com, robh+dt@kernel.org, frowand.list@gmail.com, netdev@vger.kernel.org, sakari.ailus@linux.intel.com, grant.likely@secretlab.ca, rafael.j.wysocki@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>
Date: Mon,  6 Nov 2017 14:26:10 +0100

> Commit a67e9472da42 ("of: Add array read functions with min/max size
> limits") added a new interface for reading variable-length arrays from
> DT properties. One user was added in dsa recently and this causes a
> build error because that code can be built with CONFIG_OF disabled:
> 
> net/dsa/dsa2.c: In function 'dsa_switch_parse_member_of':
> net/dsa/dsa2.c:678:7: error: implicit declaration of function 'of_property_read_variable_u32_array'; did you mean 'of_property_read_u32_array'? [-Werror=implicit-function-declaration]
> 
> This adds a dummy functions for of_property_read_variable_u32_array()
> and a few others that had been missing here. I decided to move
> of_property_read_string() and of_property_read_string_helper() in the
> process to make it easier to compare the two sets of function prototypes
> to make sure they match.
> 
> Fixes: 975e6e32215e ("net: dsa: rework switch parsing")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thanks Arnd.
