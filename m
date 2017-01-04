From: Arend Van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH V6 4/3] brcmfmac: use wiphy_read_of_freq_limits to respect
 extra limits
Date: Wed, 4 Jan 2017 21:07:29 +0100
Message-ID: <3fc87224-7f08-e365-7bbb-a4b8b5746e4f@broadcom.com>
References: <20170104175832.25996-1-zajec5@gmail.com>
 <20170104175832.25996-4-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170104175832.25996-4-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 4-1-2017 18:58, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> 
> There are some devices (e.g. Netgear R8000 home router) with one chipset
> model used for different radios, some of them limited to subbands. NVRAM
> entries don't contain any extra info on such limitations and firmware
> reports full list of channels to us. We need to store extra limitation
> info in DT to support such devices properly.
> 
> Now there is a cfg80211 helper for reading such info use it in brcmfmac.
> This patch adds check for channel being disabled with orig_flags which
> is how this wiphy helper and wiphy_register work.
> 
> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---
> This patch should probably go through wireless-driver-next which is why
> it got weird number 4/3. I'm sending it just as a proof of concept.
> It was succesfully tested on SmartRG SR400ac with BCM43602.
> 
> V4: Respect IEEE80211_CHAN_DISABLED in orig_flags
> V5: Update commit message
> V6: Call wiphy_read_of_freq_limits after brcmf_setup_wiphybands to make it work
>     with helper setting "flags" instead of "orig_flags".
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> index ccae3bb..a008ba5 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> @@ -5886,6 +5886,9 @@ static int brcmf_construct_chaninfo(struct brcmf_cfg80211_info *cfg,
>  						       band->band);
>  		channel[index].hw_value = ch.control_ch_num;
>  
> +		if (channel->orig_flags & IEEE80211_CHAN_DISABLED)
> +			continue;
> +

So to be clear this is still needed for subsequent calls to
brcmf_setup_wiphybands(). The subsequent calls are done from the
regulatory notifier. So I think we have an issue with this approach. Say
the device comes up with US. That would set DISABLED flags for channels
12 to 14. With a country update to PL we would want to enable channels
12 and 13, right? The orig_flags are copied from the initial flags
during wiphy_register() so it seems we will skip enabling 12 and 13. I
think we should remove the check above and call
wiphy_read_of_freq_limits() as a last step within
brcmf_setup_wiphybands(). It means it is called every time, but it
safeguards that the limits in DT are always applied.

Regards,
Arend

>  		/* assuming the chanspecs order is HT20,
>  		 * HT40 upper, HT40 lower, and VHT80.
>  		 */
> @@ -6478,7 +6481,11 @@ static int brcmf_setup_wiphy(struct wiphy *wiphy, struct brcmf_if *ifp)
>  		}
>  	}
>  	err = brcmf_setup_wiphybands(wiphy);
> -	return err;
> +	if (err)
> +		return err;
> +	wiphy_read_of_freq_limits(wiphy);
> +
> +	return 0;
>  }
>  
>  static s32 brcmf_config_dongle(struct brcmf_cfg80211_info *cfg)
> 
