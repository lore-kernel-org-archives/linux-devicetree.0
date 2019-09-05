From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 08/49] ath11k: add core.c
Date: Thu, 05 Sep 2019 14:37:09 +0300
Message-ID: <874l1rnfdm.fsf@kamboji.qca.qualcomm.com>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
        <1566316095-27507-9-git-send-email-kvalo@codeaurora.org>
        <0c526ce00e6e1c7731c990515e7438230efb55af.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0c526ce00e6e1c7731c990515e7438230efb55af.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
        (Johannes Berg's message of "Tue, 20 Aug 2019 22:32:45 +0200")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> writes:

>> +module_param_named(debug_mask, ath11k_debug_mask, uint, 0644);
>> +
>> +MODULE_PARM_DESC(debug_mask, "Debugging mask");
>> +
>> +static const struct ath11k_hw_params ath11k_hw_params = {
>> +			.name = "ipq8074",
>
> indentation here seems a bit too much
>
>> +MODULE_LICENSE("Dual BSD/GPL");
>
> All your files state "ISC", shouldn't that be reflected here?

The MODULE_LICENSE() macro doesn't accept anything else. AFAIK all ISC
drivers use this.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
