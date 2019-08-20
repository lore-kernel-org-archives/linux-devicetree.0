From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [PATCH 08/49] ath11k: add core.c
Date: Tue, 20 Aug 2019 22:32:45 +0200
Message-ID: <0c526ce00e6e1c7731c990515e7438230efb55af.camel@sipsolutions.net>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
         <1566316095-27507-9-git-send-email-kvalo@codeaurora.org>
         (sfid-20190820_175156_803421_4FF79584)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1566316095-27507-9-git-send-email-kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> (sfid-20190820_175156_803421_4FF79584)
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


> +module_param_named(debug_mask, ath11k_debug_mask, uint, 0644);
> +
> +MODULE_PARM_DESC(debug_mask, "Debugging mask");
> +
> +static const struct ath11k_hw_params ath11k_hw_params = {
> +			.name = "ipq8074",

indentation here seems a bit too much

> +MODULE_LICENSE("Dual BSD/GPL");

All your files state "ISC", shouldn't that be reflected here?

johannes
