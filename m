From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 31/49] ath11k: add mac.c
Date: Tue, 27 Aug 2019 19:27:17 +0200
Message-ID: <87sgpmikne.fsf@toke.dk>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org> <1566316095-27507-32-git-send-email-kvalo@codeaurora.org> <8736hvu6e6.fsf@toke.dk> <ac6e7dbbd53e7ba9e82e49baca22b73c@codeaurora.org> <875zmqsudn.fsf@toke.dk> <14737343f1925a771ddd8dadf0f2b5a3@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <14737343f1925a771ddd8dadf0f2b5a3-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vasanthakumar Thiagarajan <vthiagar-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Vasanthakumar Thiagarajan <vthiagar-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> writes:

> On 2019-08-21 15:38, Toke Høiland-Jørgensen wrote:
>> Vasanthakumar Thiagarajan <vthiagar-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> writes:
>> 
>>> On 2019-08-20 22:21, Toke Høiland-Jørgensen wrote:
>>>> [... snip ... ]
>>>> 
>>>>> +static const struct ieee80211_ops ath11k_ops = {
>>>>> +	.tx				= ath11k_mac_op_tx,
>>>> 
>>>> No wake_tx_queue? :(
>>> 
>>> Yes, packet queueing is handled in firmware. This makes sense
>>> especially when we enable 802.11 encap offload support where most of
>>> the data path processing in mac80211 will be skipped and packet is
>>> given to driver/firmware in 802.3 format itself. Then firmware would
>>> take care of all the classification, queueing and encapsulation
>>> operations.
>> 
>> Well, so does ath10k, and yet we still saw a significant improvement by
>> moving queueing back into the host where it can be handled by the
>> FQ-CoDel-enabled queueing structure.
>> 
>
> Sure, we could probably try that with ath11k as well at some point when 
> we have a baseline with HE support.

Well, rather than retrofit change things later, why not start out with a
wake_tx_queue-based driver?

-Toke
