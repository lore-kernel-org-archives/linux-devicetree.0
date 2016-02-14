From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/1 v3] ARM: dts: imx6dlq-wandboard-revb1.dts: use unique
 model id
Date: Sun, 14 Feb 2016 15:02:39 +0800
Message-ID: <20160214070239.GI6756@tiger>
References: <56B7E06B.2060701@gmx.de>
 <1454892908-26975-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1454892908-26975-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Robert Nelson <robertcnelson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, George Joseph <george.joseph-H+B1fhQ+CpcEVd8bySq3Wg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Fabio Estevam <fabio.estevam-vgrsnd+bvIE@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 08, 2016 at 01:55:08AM +0100, Heinrich Schuchardt wrote:
> Downstream packages like Debian flash-kernel use
> /proc/device-tree/model
> to determine which dtb file to install.
> 
> Hence each dts in the Linux kernel should provide a unique model
> identifier.
> 
> Commit 8536239e371f ("ARM: dts: Restructure imx6qdl-wandboard.dtsi for new
> rev C1 board.")' created new files imx6dl-wandboard-revb1.dts and
> imx6q-wandboard-revb1.dts but used the same model identifier as in
> imx6dl-wandboard.dts and imx6q-wandboard.dts.
> 
> This patch provides unique model identifiers for revision B1 of
> the Wandboard Dual and Wandbaord Quad.
> 
> The patch leaves imx6dl-wandboard.dts and imx6q-wandboard.dts unchanged
> because it is not foreseeable if the same dts will valid for future
> board revisions or not. Furthermore we should avoid unnecessary
> changes.
> 
> v3:
> 	update imx6dl-wandboard-revb1.dts
> 
> v2:
> 	correct name of referenced Debian package
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
