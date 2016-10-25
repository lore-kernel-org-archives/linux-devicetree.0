From: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH/RFT v2 12/17] USB: ochi-da8xx: Use a regulator for vbus/overcurrent
Date: Tue, 25 Oct 2016 12:52:23 +0200
Message-ID: <CAKXjFTNb3TRFRtrJoWKomETkzv1o5XhjSj54z-dFdZUi3oAFsA@mail.gmail.com>
References: <20161024164634.4330-1-ahaslam@baylibre.com> <20161024164634.4330-13-ahaslam@baylibre.com>
 <d7e2b356-4874-fdc1-c505-70e57e3908de@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d7e2b356-4874-fdc1-c505-70e57e3908de-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sergei Shtylyov <sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 25, 2016 at 12:43 PM, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org> wrote:
> On Monday 24 October 2016 10:16 PM, ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org wrote:
>> From: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>
>> Currently, the da8xx ohci driver uses a set of gpios and callbacks in
>> board files to handle vbus and overcurrent irqs form the power supply.
>> However, this does not play nice when moving to a DT based boot were
>> we wont have board files.
>>
>> Instead of requesting and handling the gpio, use the regulator framework
>> to take care of enabling and disabling vbus power. This has the benefit
>> that we dont need to pass any more platform data to the driver:
>>
>> These will be handled by the regulator framework:
>> set_power   ->  regulator_enable/regulator_disable
>> get_power   ->  regulator_is_enabled
>> get_oci     ->  regulator_get_mode
>> ocic_notify ->  regulator notification
>>
>> We can keep the default potpgt and use the regulator start delay instead:
>> potpgt      -> regulator startup delay time
>>
>> The hawk board does not have a GPIO/OVERCURRENT gpio to control vbus,
>> (they should not have been decleared/reserved) so, just remove those
>> definitions from the hwk board file.
>>
>> Signed-off-by: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>> ---
>>  arch/arm/mach-davinci/board-da830-evm.c     |  97 ++++++++----------------
>>  arch/arm/mach-davinci/board-omapl138-hawk.c |  96 +-----------------------
>>  arch/arm/mach-davinci/include/mach/da8xx.h  |   2 +-
>>  arch/arm/mach-davinci/usb-da8xx.c           |   3 +-
>>  drivers/usb/host/ohci-da8xx.c               | 111 ++++++++++++++++++----------
>>  include/linux/platform_data/usb-davinci.h   |  19 -----
>>  6 files changed, 105 insertions(+), 223 deletions(-)
>
> Can you separate out the driver enhancement from the platform
> (mach-davinci) changes? They need to go through different trees.
>

Ok, i will do that,  (it might require intermediate code to have
the driver working on each patch)

> Thanks,
> Sekhar
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
