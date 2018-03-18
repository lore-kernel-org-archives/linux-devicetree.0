From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 1/2] brcmfmac: add new dt entries for SG SDIO settings
Date: Sun, 18 Mar 2018 21:01:26 +0100
Message-ID: <20180318200126.GQ1188@lunn.ch>
References: <20180318184101.26951-1-alexey.roslyakov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180318184101.26951-1-alexey.roslyakov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexey Roslyakov <alexey.roslyakov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, franky.lin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, hante.meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org, wright.feng-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, brcm80211-dev-list.pdl-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, brcm80211-dev-list-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> +	if (of_property_read_u16(np, "brcm,sd-head-align", &align) == 0)
> +		sdio->sd_head_align = align;

Hi Alexey

I think you can make this:

	of_property_read_u16(np, "brcm,sd-head-align", &sdio->sd_head_align);

of_property_read_u16() should not touch the destination variable if
the properties does not exist, or if there is an error.

    Andrew
