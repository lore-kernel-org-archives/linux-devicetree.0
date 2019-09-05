From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 31/49] ath11k: add mac.c
Date: Thu, 05 Sep 2019 14:24:11 +0300
Message-ID: <878sr3nfz8.fsf@kamboji.qca.qualcomm.com>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
        <1566316095-27507-32-git-send-email-kvalo@codeaurora.org>
        <4076919b34cad119eb4146025f587285ef40e37c.camel@sipsolutions.net>
        <ee38dc5e80097d0ebc186f81b2f11d37@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ee38dc5e80097d0ebc186f81b2f11d37-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> (Vasanthakumar
        Thiagarajan's message of "Fri, 23 Aug 2019 17:45:41 +0530")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vasanthakumar Thiagarajan <vthiagar-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Vasanthakumar Thiagarajan <vthiagar-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> writes:

> On 2019-08-21 02:16, Johannes Berg wrote:
>> On Tue, 2019-08-20 at 18:47 +0300, Kalle Valo wrote:
>>
>>> +static int ath11k_mac_op_config(struct ieee80211_hw *hw, u32 changed)
>>> +{
>>> +	struct ath11k *ar = hw->priv;
>>> +	int ret = 0;
>>> +
>>> +	/* mac80211 requires this op to be present and that's why
>>> +	 * there's an empty function, this can be extended when
>>> +	 * required.
>>> +	 */
>>
>> Well, oops. Maybe it shouldn't be required?
>
> I think we require this for some configuration handling. The comment
> is to be updated with proper information. We'll address that.

The way I'm understanding Johannes' comment is that maybe we should
change mac80211 to require this op to be present. Should be easy to fix
in mac80211, right?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
