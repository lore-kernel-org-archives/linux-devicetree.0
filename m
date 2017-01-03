From: Arend Van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH V4 2/2] cfg80211: support ieee80211-freq-limit DT property
Date: Tue, 3 Jan 2017 13:10:27 +0100
Message-ID: <a67789ba-3346-6e10-89c2-2df419a80910@broadcom.com>
References: <20170103110340.23249-1-zajec5@gmail.com>
 <20170103110340.23249-2-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170103110340.23249-2-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 3-1-2017 12:03, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> 
> This patch adds a helper for reading that new property and applying
> limitations or supported channels specified this way.
> It may be useful for specifying single band devices or devices that
> support only some part of the whole band. It's common that tri-band
> routers have separated radios for lower and higher part of 5 GHz band.
> 
> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---
> V2: Put main code in core.c as it isn't strictly part of regulatory - pointed
>     by Arend.
>     Update to support ieee80211-freq-limit (new property).
> V3: Introduce separated wiphy_read_of_freq_limits function.
>     Add extra sanity checks for DT data.
>     Move code back to reg.c as suggested by Johannes.
> V4: Move code to of.c
>     Use one helper called at init time (no runtime hooks)
>     Modify orig_flags
> ---
>  include/net/cfg80211.h |  26 ++++++++++
>  net/wireless/Makefile  |   1 +
>  net/wireless/of.c      | 137 +++++++++++++++++++++++++++++++++++++++++++++++++
>  net/wireless/reg.c     |   4 +-
>  net/wireless/reg.h     |   2 +
>  5 files changed, 168 insertions(+), 2 deletions(-)
>  create mode 100644 net/wireless/of.c
> 
> diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
> index ca2ac1c..d7723a8 100644
> --- a/include/net/cfg80211.h
> +++ b/include/net/cfg80211.h
> @@ -311,6 +311,32 @@ struct ieee80211_supported_band {
>  	struct ieee80211_sta_vht_cap vht_cap;
>  };
>  
> +/**
> + * wiphy_read_of_freq_limits - read frequency limits from device tree
> + *
> + * @wiphy: the wireless device to get extra limits for
> + *
> + * Some devices may have extra limitations specified in DT. This may be useful
> + * for chipsets that normally support more bands but are limited due to board
> + * design (e.g. by antennas or extermal power amplifier).
> + *
> + * This function reads info from DT and uses it to *modify* channels (disable
> + * unavailable ones). It's usually a *bad* idea to use it in drivers with
> + * shared channel data as DT limitations are device specific.
> + *
> + * As this function access device node it has to be called after set_wiphy_dev.

You are aware that you need to modify this description with earlier
patch "cfg80211: allow passing struct device in the wiphy_new call",
right? :-p

> + * It also modifies channels so they have to be set first.
> + */
> +#ifdef CONFIG_OF
> +int wiphy_read_of_freq_limits(struct wiphy *wiphy);
> +#else /* CONFIG_OF */
> +static inline int wiphy_read_of_freq_limits(struct wiphy *wiphy)
> +{
> +	return 0;
> +}
> +#endif /* !CONFIG_OF */
> +
> +

[...]

> diff --git a/net/wireless/reg.c b/net/wireless/reg.c
> index 5dbac37..bda0e9e 100644
> --- a/net/wireless/reg.c
> +++ b/net/wireless/reg.c
> @@ -748,8 +748,8 @@ static bool is_valid_rd(const struct ieee80211_regdomain *rd)
>  	return true;
>  }
>  
> -static bool reg_does_bw_fit(const struct ieee80211_freq_range *freq_range,
> -			    u32 center_freq_khz, u32 bw_khz)
> +bool reg_does_bw_fit(const struct ieee80211_freq_range *freq_range,
> +		     u32 center_freq_khz, u32 bw_khz)
>  {
>  	u32 start_freq_khz, end_freq_khz;

would it be more appropriate to move this function to util.c?

Regards,
Arend
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
