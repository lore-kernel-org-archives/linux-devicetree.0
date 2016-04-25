From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] Documentation: bindings: fix palmas-rtc documentation
Date: Mon, 25 Apr 2016 08:46:02 -0500
Message-ID: <20160425134602.GA6020@rob-hp-laptop>
References: <ac069bc32d31b6c6bf6ad7e136e021b5e296deca.1461254594.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ac069bc32d31b6c6bf6ad7e136e021b5e296deca.1461254594.git.hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, letux-kernel-S0jZdbWzriLCfDggNXIi3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 21, 2016 at 06:03:15PM +0200, H. Nikolaus Schaller wrote:
> change 100mA -> 100uA
> 
> Signed-off-by: H. Nikolaus Schaller <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/rtc/rtc-palmas.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-palmas.txt b/Documentation/devicetree/bindings/rtc/rtc-palmas.txt
> index adbccc0..eb1c7fd 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc-palmas.txt
> +++ b/Documentation/devicetree/bindings/rtc/rtc-palmas.txt
> @@ -15,9 +15,9 @@ Optional properties:
>  	battery is chargeable or not. If charging battery then driver can
>  	enable the charging.
>  - ti,backup-battery-charge-high-current: Enable high current charging in
> -	backup battery. Device supports the < 100mA and > 100mA charging.
> -	The high current will be > 100mA. Absence of this property will
> -	charge battery to lower current i.e. < 100mA.
> +	backup battery. Device supports the < 100uA and > 100uA charging.
> +	The high current will be > 100uA. Absence of this property will
> +	charge battery to lower current i.e. < 100uA.
>  
>  Example:
>  	palmas: tps65913@58 {
> -- 
> 2.7.3
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
