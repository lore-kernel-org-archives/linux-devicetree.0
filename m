From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] Documentation: fsl-quadspi: Add fsl, ls1043a-qspi
 compatible string
Date: Mon, 18 Apr 2016 10:16:06 +0800
Message-ID: <20160418021606.GT28903@tiger>
References: <1460542107-45807-1-git-send-email-yao.yuan@freescale.com>
 <1460542107-45807-2-git-send-email-yao.yuan@freescale.com>
 <20160414161206.GA9978@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160414161206.GA9978@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Yuan Yao <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, leoyang.li-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuan Yao <yao.yuan-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 14, 2016 at 11:12:06AM -0500, Rob Herring wrote:
> On Wed, Apr 13, 2016 at 06:08:26PM +0800, Yuan Yao wrote:
> > From: Yuan Yao <yao.yuan-3arQi8VN3Tc@public.gmane.org>
> > 
> > new compatible string: "fsl,ls1043a-qspi".
> > 
> > Signed-off-by: Yuan Yao <yao.yuan-3arQi8VN3Tc@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> There's a typo in the compatible string in the subject. Otherwise,
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Fixed the typo (the space in the middle of compatible string), and
applied both patches.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
