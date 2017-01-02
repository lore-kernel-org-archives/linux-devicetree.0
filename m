From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [PATCH V2 1/3] cfg80211: allow passing struct device in the
 wiphy_new call
Date: Mon, 02 Jan 2017 14:38:18 +0100
Message-ID: <1483364298.21014.3.camel@sipsolutions.net>
References: <20170102132747.3491-1-zajec5@gmail.com>
         (sfid-20170102_142831_033140_A7AF3467)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170102132747.3491-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (sfid-20170102_142831_033140_A7AF3467)
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> --- a/include/net/cfg80211.h
> +++ b/include/net/cfg80211.h
> @@ -3730,8 +3730,8 @@ static inline const char *wiphy_name(const
> struct wiphy *wiphy)
>   * Return: A pointer to the new wiphy. This pointer must be
>   * assigned to each netdev's ieee80211_ptr for proper operation.
>   */
> -struct wiphy *wiphy_new_nm(const struct cfg80211_ops *ops, int
> sizeof_priv,
> -			   const char *requested_name);
> +struct wiphy *wiphy_new_nm(struct device *dev, const struct
> cfg80211_ops *ops,
> +			   int sizeof_priv, const char
> *requested_name);

This is obviously missing documentation updates.

>   */
> -static inline struct wiphy *wiphy_new(const struct cfg80211_ops
> *ops,
> +static inline struct wiphy *wiphy_new(struct device *dev,
> +				      const struct cfg80211_ops
> *ops,

Ditto.

It looks like you practically removed all users of set_wiphy_dev(), why
not do that completely and remove that entirely?

johannes
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
