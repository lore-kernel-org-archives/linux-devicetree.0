From: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>
Subject: Re: Reference voltages for ADC channels
Date: Fri, 12 Jul 2013 15:14:25 +0200
Message-ID: <51E00131.7080909@digi.com>
References: <51DA588A.5050609@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51DA588A.5050609-i7dp0qKlBMg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: "fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On 07/08/2013 08:13 AM, Hector Palacios wrote:
> Greetings,
>
> The other day at linux-iio-u79uwXL29TY76Z2rM5mHXA-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org we=
 discussed the
> possibility of having ADC channels voltage references moved to the DT=
 [1].
>
> In Freescale's i.MX28 and i.MX23, at least, the CPU has 16 ADC channe=
ls some of which
> are dedicated to measure internal stuff, like CPU temperature and vol=
tages. Some
> channels have different fixed divisors and so different reference vol=
tages.
> These reference voltages (in mV) are needed to calculate the scale to=
 show through the
> sysfs IIO interface, so that a user can easily compute the real measu=
red voltage out
> of the sampled data.
>
> The proposed DT entry also appears at [1].
> We would love to here opinions about it.
>
> [1] http://www.spinics.net/lists/linux-iio/msg08973.html

Any opinion about the suggestion of moving ADC reference voltages into =
the device tree?

Thanks
--=20
H=E9ctor Palacios
