From: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH/RFT v2 02/17] ARM: davinci: da8xx: Add CFGCHIP syscon
 platform declaration.
Date: Tue, 25 Oct 2016 11:37:18 +0200
Message-ID: <CAKXjFTOVuWRL+yuk6sARa2PAd6j-V4Ej5AmPGz7F7JXKidvJrg@mail.gmail.com>
References: <20161024164634.4330-1-ahaslam@baylibre.com> <20161024164634.4330-3-ahaslam@baylibre.com>
 <7f9efe9d-0912-e10a-3e45-24c5d2b455ab@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7f9efe9d-0912-e10a-3e45-24c5d2b455ab-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sergei Shtylyov <sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sekar,

On Tue, Oct 25, 2016 at 10:10 AM, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org> wrote:
> On Monday 24 October 2016 10:16 PM, ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org wrote:
>> From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>>
>> The CFGCHIP registers are used by a number of devices, so using a syscon
>> device to share them. The first consumer of this will by the phy-da8xx-usb
>> driver.
>>
>> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>> [Axel: minor fix: change id to -1]
>
> Can you please clarify this change? There could be other syscon devices
> on the chip for other common registers. Why use the singular device-id?
>

in the case of non DT boot, the phy driver is looking for "syscon" :

d_phy->regmap = syscon_regmap_lookup_by_pdevname("syscon");

if we register the syscon driver with id = 0, the actual name of the syscon
device will be "syscon.0" and the phy driver will fail to probe, because
the strncmp match in the syscon driver (syscon_match_pdevname)
will fail.

should i change the phy driver instead?


Regards,
Axel.



>> Signed-off-by: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>
> Thanks,
> Sekhar
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
