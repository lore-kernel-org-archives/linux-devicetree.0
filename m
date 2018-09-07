From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 7/9] net: stmmac: dwmac-sun8i: fix OF child-node lookup
Date: Fri, 7 Sep 2018 09:48:30 +0200
Message-ID: <20180907074830.GF1089@localhost>
References: <20180827082153.22537-1-johan@kernel.org>
 <20180827082153.22537-8-johan@kernel.org>
 <20180906200337.GA15390@Red>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180906200337.GA15390@Red>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 06, 2018 at 10:03:37PM +0200, Corentin Labbe wrote:
> On Mon, Aug 27, 2018 at 10:21:51AM +0200, Johan Hovold wrote:
> > Use the new of_get_compatible_child() helper to lookup the mdio-internal
> > child node instead of using of_find_compatible_node(), which searches
> > the entire tree from a given start node and thus can return an unrelated
> > (i.e. non-child) node.
> > 
> > This also addresses a potential use-after-free (e.g. after probe
> > deferral) as the tree-wide helper drops a reference to its first
> > argument (i.e. the mdio-mux node). Fortunately, this was inadvertently
> > balanced by a failure to drop the mdio-mux reference after lookup.
> > 
> > While at it, also fix the related mdio-internal- and phy-node reference
> > leaks.
> > 
> > Fixes: 634db83b8265 ("net: stmmac: dwmac-sun8i: Handle integrated/external MDIOs")
> > Cc: Corentin Labbe <clabbe.montjoie@gmail.com>
> > Cc: Andrew Lunn <andrew@lunn.ch>
> > Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> > Cc: Alexandre Torgue <alexandre.torgue@st.com>
> > Cc: Jose Abreu <joabreu@synopsys.com>
> > Cc: David S. Miller <davem@davemloft.net>
> > Signed-off-by: Johan Hovold <johan@kernel.org>

> Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Thanks for testing.

Johan
