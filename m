From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5] ARM: dts: imx53-tx53: Fix 'ethernet-phy@0' node with
 unit name and no reg property
Date: Thu, 16 Nov 2017 15:36:05 +0800
Message-ID: <20171116073604.GB25384@dragon>
References: <1509031514-30602-1-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1509031514-30602-1-git-send-email-marco.franchi-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 26, 2017 at 01:25:14PM -0200, Marco Franchi wrote:
> The following build warning is seen with W=1:
> 
> Warning (unit_address_vs_reg): Node /soc/aips@60000000/ethernet@63fec000/ethernet-phy@0 has a unit name, but no reg property
> 
> Fix this warning by adding reg property from such node and, consequently, 
> includes a mdio node into the fec node, with the 'address-cells' and 
> 'size-cells' to avoid these other following warnings:
> 
> Warning (reg_format): "reg" property in /soc/aips@60000000/ethernet@63fec000/ethernet-phy@0 has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> Warning (avoid_default_addr_size): Relying on default #address-cells value for /soc/aips@60000000/ethernet@63fec000/ethernet-phy@0
> Warning (avoid_default_addr_size): Relying on default #size-cells value for /soc/aips@60000000/ethernet@63fec000/ethernet-phy@0
> 
> Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
