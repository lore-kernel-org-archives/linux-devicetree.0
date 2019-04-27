From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/4] of_net: Add NVMEM support to of_get_mac_address
Date: Sat, 27 Apr 2019 18:28:23 +0200
Message-ID: <20190427162823.GA9816@lunn.ch>
References: <1556320002-26213-1-git-send-email-ynezz@true.cz>
 <1556320002-26213-2-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556320002-26213-2-git-send-email-ynezz@true.cz>
Sender: netdev-owner@vger.kernel.org
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Alban Bedel <albeu@free.fr>, Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>
List-Id: devicetree@vger.kernel.org

>  /**
> - * Search the device tree for the best MAC address to use.  'mac-address' is
> - * checked first, because that is supposed to contain to "most recent" MAC
> - * address. If that isn't set, then 'local-mac-address' is checked next,
> - * because that is the default address.  If that isn't set, then the obsolete
> - * 'address' is checked, just in case we're using an old device tree.
> + * Search the device tree for the best MAC address to use. Check NVME first as
> + * it should contain the proper MAC address, then 'mac-address' is checked
> + * next, because that is supposed to contain to "most recent" MAC address. If
> + * that isn't set, then 'local-mac-address' is checked next, because that is
> + * the default address.  If that isn't set, then the obsolete 'address' is
> + * checked, just in case we're using an old device tree.

Hi Petr

I'm not sure this is the correct order. I would actually put NVMEM
after mac-address and local-mac-address. These are well established
and used. We don't want to break existing boards with a new
property. By putting NVMEM later, in order to make it used, any
existing mac-address and local-mac-address need to be removed, making
the developers actually think about what they are doing.

	Andrew
