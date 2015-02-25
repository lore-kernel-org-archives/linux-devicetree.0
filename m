From: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 RESEND 1/4] dt-bindings: Add vendor prefix for
 Raspberry Pi
Date: Wed, 25 Feb 2015 14:20:20 +0000
Message-ID: <20150225142020.GK21323@x1>
References: <1422555050-28509-1-git-send-email-stefan.wahren@i2se.com>
 <1422555050-28509-2-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1422555050-28509-2-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 29 Jan 2015, Stefan Wahren wrote:

> Since the prefix is already in use, we need to add it in the
> vendor list.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> ---
>  .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>  1 file changed, 1 insertion(+)

Applied, with Rob's Ack.

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 5d2251a..0546f73 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -136,6 +136,7 @@ radxa	Radxa
>  raidsonic	RaidSonic Technology GmbH
>  ralink	Mediatek/Ralink Technology Corp.
>  ramtron	Ramtron International
> +raspberrypi	Raspberry Pi Foundation
>  realtek Realtek Semiconductor Corp.
>  renesas	Renesas Electronics Corporation
>  ricoh	Ricoh Co. Ltd.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
