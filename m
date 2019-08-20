From: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 02/49] ath11k: add Kconfig
Date: Tue, 20 Aug 2019 18:52:49 +0200
Message-ID: <f5af5ff4-63d6-6b94-6c04-8436f955985a@phrozen.org>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <1566316095-27507-3-git-send-email-kvalo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1566316095-27507-3-git-send-email-kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 20/08/2019 17:47, Kalle Valo wrote:
> ---
>   drivers/net/wireless/ath/ath11k/Kconfig | 34 +++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
> new file mode 100644
> index 000000000000..26bf98fa648e
> --- /dev/null
> +++ b/drivers/net/wireless/ath/ath11k/Kconfig
> @@ -0,0 +1,34 @@
> +config ATH11K
> +        tristate "Qualcomm Technologies 802.11ax chipset support"
> +        depends on MAC80211 && HAS_DMA

    ^^ space vs tab here

     John

> +	depends on REMOTEPROC
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	select ATH_COMMON
> +	select QCOM_QMI_HELPERS
> +        help
> +          This module adds support for Qualcomm Technologies 802.11ax family of
> +	  chipsets.
> +
> +          If you choose to build a module, it'll be called ath11k.
> +
