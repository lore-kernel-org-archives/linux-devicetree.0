From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] doc: usb: ci-hdrc-usb2: add property
 over-current-active-high
Date: Wed, 20 Jul 2016 14:10:08 -0500
Message-ID: <20160720191007.GA12271@rob-hp-laptop>
References: <1469001762-15015-1-git-send-email-jun.li@nxp.com>
 <1469001762-15015-2-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1469001762-15015-2-git-send-email-jun.li-3arQi8VN3Tc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
Cc: peter.chen-3arQi8VN3Tc@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 20, 2016 at 04:02:41PM +0800, Li Jun wrote:
> Adding over-current-active-high to indicate the over current flag
> is high active as typically we use active low for over current
> polarity.
> 
> Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
