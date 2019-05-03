From: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Subject: Re: [PATCH v4 01/10] of_net: add NVMEM support to of_get_mac_address
Date: Fri, 3 May 2019 17:44:07 +0200
Message-ID: <20190503154407.GE71477@meh.true.cz>
References: <1556893635-18549-1-git-send-email-ynezz@true.cz>
 <1556893635-18549-2-git-send-email-ynezz@true.cz>
 <20190503143643.hhfamnptcuriav4k@flea>
Reply-To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190503143643.hhfamnptcuriav4k@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Alban Bedel <albeu@free.fr>, Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Maxime Ripard <maxime.ripard@bootlin.com> [2019-05-03 16:36:43]:

Hi,

...

> > +	pp = devm_kzalloc(&pdev->dev, sizeof(*pp), GFP_KERNEL);
> > +	if (!pp)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	pp->name = "nvmem-mac-address";
> > +	pp->length = ETH_ALEN;
> > +	pp->value = devm_kmemdup(&pdev->dev, mac, ETH_ALEN, GFP_KERNEL);
> > +	if (!pp->value) {
> > +		ret = -ENOMEM;
> > +		goto free;
> > +	}
> > +
> > +	ret = of_add_property(np, pp);
> > +	if (ret)
> > +		goto free;
> > +
> > +	return pp->value;
> 
> I'm not sure why you need to do that allocation here, and why you need
> to modify the DT?

I was asked about that in v2[0] already, so just copy&pasting relevant part of
my response here:

 I've just carried it over from v1 ("of_net: add mtd-mac-address support to
 of_get_mac_address()")[1] as nobody objected about this so far.

 Honestly I don't know if it's necessary to have it, but so far address,
 mac-address and local-mac-address properties provide this DT nodes, so I've
 simply thought, that it would be good to have it for MAC address from NVMEM as
 well in order to stay consistent.

 [...]

0. https://patchwork.ozlabs.org/patch/1092248/#2164089
1. https://patchwork.ozlabs.org/patch/1086628/

> can't you just return the mac address directly since it's what the
> of_get_mac_address caller will expect anyway?

I don't need this stuff, I can remove it, please just tell me what is
appropriate and I'm going to do that.

-- ynezz
