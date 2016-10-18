From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 04/19] MAINTAINERS: Remove phy-stih41x-usb.c entry from
 STi arch
Date: Tue, 18 Oct 2016 09:50:13 +0200
Message-ID: <4108140b-ac27-42e6-8c25-d65caff70e12@st.com>
References: <1473859677-9231-1-git-send-email-peter.griffin@linaro.org>
 <1473859677-9231-5-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473859677-9231-5-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi

On 09/14/2016 03:27 PM, Peter Griffin wrote:
> Remove this driver as the IP is only found on STiH415/6
> silicon, and support for these SoC's is being removed
> from the kernel.
> 
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: <kishon-l0cyMroinI0@public.gmane.org>

Acked-by: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>

Applied on sti-dt-for-4.10 branch

Thanks 

> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 12c271c..6a278b9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1755,7 +1755,6 @@ F:	drivers/media/platform/sti/c8sectpfe/
>  F:	drivers/mmc/host/sdhci-st.c
>  F:	drivers/phy/phy-miphy28lp.c
>  F:	drivers/phy/phy-stih407-usb.c
> -F:	drivers/phy/phy-stih41x-usb.c
>  F:	drivers/pinctrl/pinctrl-st.c
>  F:	drivers/remoteproc/st_remoteproc.c
>  F:	drivers/reset/sti/
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
