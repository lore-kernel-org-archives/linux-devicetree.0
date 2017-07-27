From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 0/3] arm64: dts: renesas: r8a7795: salvator-xs: enable
 usb 2.0 channel 3
Date: Thu, 27 Jul 2017 17:20:47 +0200
Message-ID: <20170727152047.GI16143@verge.net.au>
References: <1501068660-4032-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501068660-4032-1-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 26, 2017 at 08:30:57PM +0900, Yoshihiro Shimoda wrote:
> This patch is based on the renesas-drivers.git /
> renesas-drivers-2017-07-18-v4.13-rc1 tag and
> "pinctrl: sh-pfc: r8a7795: add usb2.0 on R-Car H3 ES2.0" patch set and
> "arm64: dts: renesas: r8a7795: add usb2.0 for R-Car H3 ES2.0" patch set.
> 
> Yoshihiro Shimoda (3):
>   arm64: dts: renesas: r8a7795: salvator-xs: enable usb2_phy ch3
>   arm64: dts: renesas: r8a7795: salvator-xs: enable USB 2.0 channel 3
>   arm64: dts: renesas: r8a7795: salvator-xs: enable HSUSB channel 3

Hi Shimoda-san,

I am marking these patches as deferred pending an Ack from Geert
on the pfc changes. I assume that will not happen until after he comes
back from holiday's. Let me know if that is going to be a problem.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
