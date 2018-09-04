From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 6/9] net: bcmgenet: fix OF child-node lookup
Date: Tue, 4 Sep 2018 14:56:24 +0200
Message-ID: <20180904125624.GS28861@localhost>
References: <20180827082153.22537-1-johan@kernel.org>
 <20180827082153.22537-7-johan@kernel.org>
 <683bdf11-a662-d17e-8bc5-b3cfd238e463@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <683bdf11-a662-d17e-8bc5-b3cfd238e463@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 30, 2018 at 05:47:33PM -0700, Florian Fainelli wrote:
> On 08/27/2018 01:21 AM, Johan Hovold wrote:
> > Use the new of_get_compatible_child() helper to lookup the mdio child
> > node instead of using of_find_compatible_node(), which searches the
> > entire tree from a given start node and thus can return an unrelated
> > (i.e. non-child) node.
> > 
> > This also addresses a potential use-after-free (e.g. after probe
> > deferral) as the tree-wide helper drops a reference to its first
> > argument (i.e. the node of the device being probed).
> > 
> > Fixes: aa09677cba42 ("net: bcmgenet: add MDIO routines")
> > Cc: stable <stable@vger.kernel.org>     # 3.15
> > Cc: Florian Fainelli <f.fainelli@gmail.com>
> > Cc: David S. Miller <davem@davemloft.net>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> 
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks for reviewing.

Rob's gotten the helper into -rc2:

	36156f9241cb of: add helper to lookup compatible child node

so feel free to pick this one up directly to whichever net tree you
prefer. I've been able to trigger crashes after probe deferrals due to
the use-after-free, but this seems unlikely to be exploitable.

Thanks,
Johan
