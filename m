From: Vasanthakumar Thiagarajan <vthiagar-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 31/49] ath11k: add mac.c
Date: Tue, 27 Aug 2019 16:21:40 +0530
Message-ID: <1da054e86da63423a5e58c22c2c79d79@codeaurora.org>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <1566316095-27507-32-git-send-email-kvalo@codeaurora.org>
 <c37a9fc4-aa74-a333-a67c-cce66ad78ec0@green-communications.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c37a9fc4-aa74-a333-a67c-cce66ad78ec0-HoVSR7jCO9Dxoq/u1CTanTkwo1WHXZZs@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Cavallari <Nicolas.Cavallari-HoVSR7jCO9Dxoq/u1CTanTkwo1WHXZZs@public.gmane.org>
Cc: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2019-08-23 20:32, Nicolas Cavallari wrote:
> On 20/08/2019 17:47, Kalle Valo wrote:
>> +	ar->hw->wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION) |
>> +					 BIT(NL80211_IFTYPE_AP) |
>> +					 BIT(NL80211_IFTYPE_MESH_POINT);
> 
> [...]
> 
>> +	ar->hw->wiphy->flags |= WIPHY_FLAG_IBSS_RSN;
> 
> so IBSS-RSN is supported without IBSS support ?

Sure. IBSS-RSN is not relevant when IBSS is not supported, I guess.
We'll take care of this. Thanks.

Vasanth
