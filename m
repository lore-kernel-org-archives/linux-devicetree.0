From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] [net-next?] of: add of_property_read_variable_* dummy helpers
Date: Mon, 6 Nov 2017 08:31:52 -0600
Message-ID: <CAL_Jsq+uKzL94=+s+RYSQb2PH6tc1ji2ZLEoySBPezgsmLCiBw@mail.gmail.com>
References: <20171106132627.150459-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171106132627.150459-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, "David S . Miller" <davem@davemloft.net>, Frank Rowand <frowand.list@gmail.com>, netdev <netdev@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Grant Likely <grant.likely@secretlab.ca>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 6, 2017 at 7:26 AM, Arnd Bergmann <arnd@arndb.de> wrote:
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
> ---
> DT maintainers: there is currently a build break in the net-next tree
> (from branch "dsa-parsing-stage") because of this, I think the best
> way forward would be to get an Ack for this patch to get picked up
> through the netdev trees.

Fine by me.

> ---
>  include/linux/of.h | 62 +++++++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 50 insertions(+), 12 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
