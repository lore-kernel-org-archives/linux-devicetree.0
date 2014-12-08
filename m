From: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: Re: [PATCH v4 0/2] ath10k: device tree support
Date: Mon, 8 Dec 2014 17:33:40 +0200
Message-ID: <878uii17hn.fsf@kamboji.qca.qualcomm.com>
References: <20141127120727.17546.61202.stgit@potku.adurom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141127120727.17546.61202.stgit-5n+v4hRq/7bEFBQscRVz1g@public.gmane.org> (Kalle Valo's
	message of "Thu, 27 Nov 2014 14:08:47 +0200")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, toshik-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org> writes:

> here's providing ath10k calibration data via device tree support which
> Toshi and me have been working on. Please review.
>
> Device tree maintainers: please review the bindings document
> carefully, this is the first time I have written one.
>
> v4:
>
> * use correct devicetree mailing list address
>
> v3:
>
> * add a debug message to ath10k
>
> * write bindings file
>
> * use ar->dev.of_node instead of pci_device_to_OF_node()
>
> v2:
>
> * fixed a bug that returns an uninitialized value if the node is not
>   found
>
> ---
>
> Kalle Valo (1):
>       dt: bindings: add ath10k wireless device
>
> Toshi Kikuchi (1):
>       ath10k: read calibration data from Device Tree

Both patches applied. Thanks Toshi.

-- 
Kalle Valo
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
