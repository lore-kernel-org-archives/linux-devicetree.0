From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 3/2] brcmfmac: use wiphy_read_of_freq_limits to respect
 extra limits
Date: Tue, 3 Jan 2017 15:24:11 +0100
Message-ID: <CACna6rxUuwoL=df-Q=Awi-MmUKrHHJfKkcMn=76sAxaG6_2LPg@mail.gmail.com>
References: <20170103110340.23249-1-zajec5@gmail.com> <20170103110340.23249-3-zajec5@gmail.com>
 <d306c928-3725-f9d3-e3c5-e75a1849bd8b@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d306c928-3725-f9d3-e3c5-e75a1849bd8b-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arend Van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 3 January 2017 at 14:29, Arend Van Spriel
<arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> What is with the patch numbering, ie. 3/2?

It's my small trick related to the "This patch should probably go
through wireless-driver-next" ;) I wanted to make it clear that only 2
patches are strictly targeted for the mac80211-next tree.


> On 3-1-2017 12:03, Rafa=C5=82 Mi=C5=82ecki wrote:
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>
>> There are some devices (e.g. Netgear R8000 home router) with one chipset
>> model used for different radios, some of them limited to subbands. NVRAM
>> entries don't contain any extra info on such limitations and firmware
>> reports full list of channels to us. We need to store extra limitation
>> info on DT to support such devices properly.
>>
>> This patch adds check for channel being disabled with orig_flags which
>> is how this wiphy helper works.
>
> this is the first mention about the wiphy helper. Probably need
> statement here that call to wiphy_read_of_freq_limits() was added in
> this patch which applies the extra limitation info read from DT.

OK, I'll improve this description.


>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>> ---
>> This patch should probably go through wireless-driver-next, I'm sending
>> it just as a proof of concept. It was succesfully tested on SmartRG
>> SR400ac with BCM43602.
>>
>> V4: Respect IEEE80211_CHAN_DISABLED in orig_flags
>> ---
>>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c=
 b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
>> index ccae3bb..f95e316 100644
>> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
>> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
>> @@ -5886,6 +5886,9 @@ static int brcmf_construct_chaninfo(struct brcmf_c=
fg80211_info *cfg,
>>                                                      band->band);
>>               channel[index].hw_value =3D ch.control_ch_num;
>>
>> +             if (channel->orig_flags & IEEE80211_CHAN_DISABLED)
>> +                     continue;
>> +
>>               /* assuming the chanspecs order is HT20,
>>                * HT40 upper, HT40 lower, and VHT80.
>>                */
>> @@ -6477,6 +6480,7 @@ static int brcmf_setup_wiphy(struct wiphy *wiphy, =
struct brcmf_if *ifp)
>>                       wiphy->bands[NL80211_BAND_5GHZ] =3D band;
>>               }
>>       }
>> +     wiphy_read_of_freq_limits(wiphy);
>
> The return value is ignored, which I suppose is fine. So does the
> function need a return value at all? Is there a scenario where the DT
> info *must* be supplied?

To be honest, I can't decide. Right now I don't see a point of
checking that function result (as you noticed, it should never be
required). If no one objects, I'll try switching that function to
void.

--=20
Rafa=C5=82
