From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/3] Add ZTE zx-irdec remote control driver
Date: Fri, 18 Aug 2017 20:54:20 +0800
Message-ID: <20170818125418.GM7608@dragon>
References: <1501420993-21977-1-git-send-email-shawnguo@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501420993-21977-1-git-send-email-shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Young <sean-hENCXIMQXOg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Baoyou Xie <xie.baoyou-i+zz7BTLltu8dxfXipz/DA@public.gmane.org>, Xin Zhou <zhou.xin8-i+zz7BTLltu8dxfXipz/DA@public.gmane.org>, Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 30, 2017 at 09:23:10PM +0800, Shawn Guo wrote:
> From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> The series adds dt-bindings and remote control driver for IRDEC block
> found on ZTE ZX family SoCs.
> 
> Changes for v2:
>  - Add one patch to move generic NEC scancode composing and protocol
>    type detection code from ir_nec_decode() into an inline shared
>    function, which can be reused by zx-irdec driver.
> 
> Shawn Guo (3):
>   rc: ir-nec-decoder: move scancode composing code into a shared
>     function
>   dt-bindings: add bindings document for zx-irdec
>   rc: add zx-irdec remote control driver

Hi Sean,

We are getting close to 4.14 merge window.  Can we get this into -next
for a bit exposure, if you are fine with the patches?

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
