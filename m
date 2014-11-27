From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 1/2] dt: bindings: add ath10k wireless device
Date: Thu, 27 Nov 2014 13:28:45 +0100
Message-ID: <3202372.2AaH3c4qv1@wuerfel>
References: <20141127120727.17546.61202.stgit@potku.adurom.net> <20141127120856.17546.32014.stgit@potku.adurom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141127120856.17546.32014.stgit-5n+v4hRq/7bEFBQscRVz1g@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Cc: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, toshik-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 27 November 2014 14:08:56 Kalle Valo wrote:
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> new file mode 100644
> index 000000000000..edefc26c6204
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -0,0 +1,30 @@
> +* Qualcomm Atheros ath10k wireless devices
> +
> +For ath10k devices the calibration data can be provided through Device
> +Tree. The node is a child node of the PCI controller.
> +
> +Required properties:
> +-compatible : Should be "qcom,ath10k"
> +
> +Optional properties:
> +- qcom,ath10k-calibration-data : calibration data as an array, the
> +                                length can vary between hw versions
> +

Does the device always have a valid mac address in hardware? If not,
how about listing that as well using the mac-address property?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
