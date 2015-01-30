From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH][v4] power/fsl: add MDIO dt binding for FMan
Date: Thu, 29 Jan 2015 18:54:09 -0600
Message-ID: <1422579249.10544.140.camel@freescale.com>
References: <1422446064-3901-1-git-send-email-shh.xie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422446064-3901-1-git-send-email-shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Emilian.Medve-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2015-01-28 at 19:54 +0800, shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> +- interrupts
> +		Usage: required
> +		Value type: <prop-encoded-array>
> +		Definition: Event interrupt of external MDIO controller.

What if this MDIO controller is not "external"?  Should Usage say
"required for external MDIO"?

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
