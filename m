From: Arend Van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH V4 3/2] brcmfmac: use wiphy_read_of_freq_limits to respect
 extra limits
Date: Tue, 3 Jan 2017 14:29:59 +0100
Message-ID: <d306c928-3725-f9d3-e3c5-e75a1849bd8b@broadcom.com>
References: <20170103110340.23249-1-zajec5@gmail.com>
 <20170103110340.23249-3-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170103110340.23249-3-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

What is with the patch numbering, ie. 3/2?

On 3-1-2017 12:03, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> 
> There are some devices (e.g. Netgear R8000 home router) with one chipset
> model used for different radios, some of them limited to subbands. NVRAM
> entries don't contain any extra info on such limitations and firmware
> reports full list of channels to us. We need to store extra limitation
> info on DT to support such devices properly.
> 
> This patch adds check for channel being disabled with orig_flags which
> is how this wiphy helper works.

this is the first mention about the wiphy helper. Probably need
statement here that call to wiphy_read_of_freq_limits() was added in
this patch which applies the extra limitation info read from DT.

> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---
> This patch should probably go through wireless-driver-next, I'm sending
> it just as a proof of concept. It was succesfully tested on SmartRG
> SR400ac with BCM43602.
> 
> V4: Respect IEEE80211_CHAN_DISABLED in orig_flags
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> index ccae3bb..f95e316 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> @@ -5886,6 +5886,9 @@ static int brcmf_construct_chaninfo(struct brcmf_cfg80211_info *cfg,
>  						       band->band);
>  		channel[index].hw_value = ch.control_ch_num;
>  
> +		if (channel->orig_flags & IEEE80211_CHAN_DISABLED)
> +			continue;
> +
>  		/* assuming the chanspecs order is HT20,
>  		 * HT40 upper, HT40 lower, and VHT80.
>  		 */
> @@ -6477,6 +6480,7 @@ static int brcmf_setup_wiphy(struct wiphy *wiphy, struct brcmf_if *ifp)
>  			wiphy->bands[NL80211_BAND_5GHZ] = band;
>  		}
>  	}
> +	wiphy_read_of_freq_limits(wiphy);

The return value is ignored, which I suppose is fine. So does the
function need a return value at all? Is there a scenario where the DT
info *must* be supplied?

Regards,
Arend
