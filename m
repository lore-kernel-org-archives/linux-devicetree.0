From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 0/2] arm64: dts: r8a7796: add USB-DMAC and HSUSB device
 nodes
Date: Fri, 4 Aug 2017 13:00:27 +0200
Message-ID: <20170804110026.GB9178@verge.net.au>
References: <1501763357-26075-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501763357-26075-1-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 03, 2017 at 09:29:15PM +0900, Yoshihiro Shimoda wrote:
> This patch is based on the renesas.git / renesas-devel-20170731v2-v4.13-rc3 tag.
> 
> For usb-dmac, we should wait for the following patch (even if we don't apply
> the patch, the usb-dmac driver can be probed correctly though.)
>  https://patchwork.kernel.org/patch/9876639/
> 
> For hsusb, we need the "arm64: dts: r8a7796: add usb host device nodes" patch
> set for using usb2_phy0.

Thanks, I am marking this series as deferred pending acceptance of
the dependencies of "arm64: dts: r8a7796: add usb host device nodes".
Please repost this series or otherwise ping me once those
dependencies are in place.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
