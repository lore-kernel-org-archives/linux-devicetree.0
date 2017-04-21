From: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/2 v4] video: fbdev: imxfb: support AUS mode
Date: Fri, 21 Apr 2017 16:49:43 +0200
Message-ID: <8077683.5av1QGK6yz@amdc3058>
References: <1488193030-13064-1-git-send-email-martin@kaiser.cx>
 <CGME20170421102953epcas5p20a57e27742e4d0d7df27e9e0e7ef8dfd@epcas5p2.samsung.com>
 <1492770549-7347-1-git-send-email-martin@kaiser.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1492770549-7347-1-git-send-email-martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Kaiser <martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday, April 21, 2017 12:29:08 PM Martin Kaiser wrote:
> Some displays require setting AUS mode in the LDCD AUS Mode Control
> Register to work with the imxfb driver. Like the value of the Panel
> Configuration Register, the AUS mode setting depends on the display
> mode.
> 
> Allow setting AUS mode from the device tree by adding a boolean
> property. Make this property optional to keep the DT ABI stable.
> AUS mode can be set only on imx21 and compatible chipsets.
> 
> Signed-off-by: Martin Kaiser <martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>

Patch queued for 4.12, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
