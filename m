From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx: ventana: remove container node from
 iomuxc nodes
Date: Fri, 13 Oct 2017 11:11:31 +0800
Message-ID: <20171013031129.GB8833@dragon>
References: <1505765461-12977-1-git-send-email-tharvey@gateworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1505765461-12977-1-git-send-email-tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 18, 2017 at 01:11:01PM -0700, Tim Harvey wrote:
> The container node in the iomuxc node is no longer necessary and causes
> pinctl errors on the Ventana boards with analog video capture
> since aa12693e4156adafdef80a8bd134123a6419621b:
> 
> pinctrl core: initialized pinctrl subsystem
> imx6q-pinctrl 20e0000.iomuxc: no groups defined in /soc/aips-bus@02000000/iomuxc@020e0000/adv7180grp
> imx6q-pinctrl 20e0000.iomuxc: no groups defined in /soc/aips-bus@02000000/iomuxc@020e0000/ipu2_csi1grp
> imx6q-pinctrl 20e0000.iomuxc: initialized IMX pinctrl driver
> imx6q-pinctrl 20e0000.iomuxc: function 'iomuxc' not supported
> imx6q-pinctrl 20e0000.iomuxc: invalid function iomuxc in map table
> imx6q-pinctrl 20e0000.iomuxc: function 'iomuxc' not supported
> imx6q-pinctrl 20e0000.iomuxc: invalid function iomuxc in map table
> 
> Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
