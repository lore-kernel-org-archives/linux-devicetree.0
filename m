From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: sunxi: Add pinctrl driver for Allwinner SoCs
Date: Mon, 07 Jan 2013 16:50:42 +0100
Message-ID: <50EAEED2.8020003@free-electrons.com>
References: <1355948295-19680-1-git-send-email-maxime.ripard@free-electrons.com>
 <1355948295-19680-2-git-send-email-maxime.ripard@free-electrons.com>
 <CACRpkdYpnfWmo15vtUsvPobhFO3_wvYgaa04Mpa6QjWx2h+ezA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdYpnfWmo15vtUsvPobhFO3_wvYgaa04Mpa6QjWx2h+ezA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alejandro Mery <amery-7FTFmhZxc5Q@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Linus,

Le 07/01/2013 00:46, Linus Walleij a =E9crit :
> On Wed, Dec 19, 2012 at 9:18 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> =

>> The Allwinner SoCs have an IP module that handle both the muxing and the
>> GPIOs.
> =

> Sorry for very slow review :-( :-(

That's fine, at that time of the year, I wasn't expecting a fast review
anyway :)

>>  include/linux/pinctrl/pinconf-generic.h            |    1 +
> =

> Can you break this into a separate patch and rebase it?
> =

> It does not apply anymore after v3.8...

Ah, yes, of course... Will do.

>> diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pin=
ctrl/pinconf-generic.h
>> index 4f0abb9..5f5968d 100644
>> --- a/include/linux/pinctrl/pinconf-generic.h
>> +++ b/include/linux/pinctrl/pinconf-generic.h
>> @@ -74,6 +74,7 @@ enum pin_config_param {
>>         PIN_CONFIG_DRIVE_PUSH_PULL,
>>         PIN_CONFIG_DRIVE_OPEN_DRAIN,
>>         PIN_CONFIG_DRIVE_OPEN_SOURCE,
>> +       PIN_CONFIG_DRIVE_CURRENT,
>>         PIN_CONFIG_INPUT_SCHMITT,
>>         PIN_CONFIG_INPUT_DEBOUNCE,
>>         PIN_CONFIG_POWER_SOURCE,
> =

> Above the definitions there is some kerneldoc and that is where this has =
to be
> defined.
> =

> You also have to defines what the argument to this parameter is.
> =

> I think it should be renamed PIN_CONFIG_DRIVE_STRENGTH and the
> argument should be the number of drivers stages.
> =

> These things are constructed with totem-pole-like outputs and the number
> of totempoles define the drive strength, usually it will be something like
> =

> 1 =3D 2mA
> 2 =3D 4mA
> 3 =3D 6mA
> 4 =3D 8mA
> =

> or similar, as you see 2 mA for each added driver stage. The driver can
> convert to any internal representation...

Ok, I will do it.

Do you have other comments on the driver that I should wait for before
sending a v3?

Thanks,
Maxime

-- =

Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
