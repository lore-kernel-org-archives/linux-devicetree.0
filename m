From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/3] ARM: dts: vf-colibri: remove regulator container
 node
Date: Thu, 18 Feb 2016 22:23:07 +0800
Message-ID: <20160218142307.GA6756@tiger>
References: <1455752460-2770-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455752460-2770-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 17, 2016 at 03:40:58PM -0800, Stefan Agner wrote:
> Drop the fake simple-bus container 'regulators' and put the
> regulators directly under the root node. This also makes the
> artificial 'reg' properties superfluous. While at it, remove
> the unnecessary regulator-always-on property and name the
> regulators according to schematics.
> 
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
> Changes since v2:
> - remove regulator-always-on
> 
> Changes since v1:
> - rename regulators according to schematics
> - drop sys prefix

Okay.  Replaced v1 with v3.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
