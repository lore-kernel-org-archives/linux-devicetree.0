From: Nicolas Cavallari <Nicolas.Cavallari-HoVSR7jCO9Dxoq/u1CTanTkwo1WHXZZs@public.gmane.org>
Subject: Re: [PATCH 31/49] ath11k: add mac.c
Date: Fri, 23 Aug 2019 17:02:53 +0200
Message-ID: <c37a9fc4-aa74-a333-a67c-cce66ad78ec0@green-communications.fr>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <1566316095-27507-32-git-send-email-kvalo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1566316095-27507-32-git-send-email-kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: fr
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 20/08/2019 17:47, Kalle Valo wrote:
> +	ar->hw->wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION) |
> +					 BIT(NL80211_IFTYPE_AP) |
> +					 BIT(NL80211_IFTYPE_MESH_POINT);

[...]

> +	ar->hw->wiphy->flags |= WIPHY_FLAG_IBSS_RSN;

so IBSS-RSN is supported without IBSS support ?
