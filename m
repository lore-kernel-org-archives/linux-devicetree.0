From: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv1 0/2] Convert rx51-battery to IIO API and add DT support
Date: Wed, 26 Feb 2014 08:40:54 +0100
Message-ID: <CAHYPw2EeEnDn2FUYSMWbywprmhJmcRRyaTPn1YZK0xPvuiJQFw@mail.gmail.com>
References: <1393375569-21751-1-git-send-email-sre@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393375569-21751-1-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ivajlo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi!

2014-02-26 1:46 GMT+01:00 Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>:
> Hi,
>
> This is PATCHv1 for converting rx51-battery to the IIO API
> and adding DT support. The patchset compiles and has been
> tested on my Nokia N900. It depends on another patchset
> converting twl4030-madc to the IIO API:
>
> https://lkml.org/lkml/2014/2/25/627
>
> -- Sebastian
>
> Sebastian Reichel (2):
>   rx51_battery: convert to iio consumer
>   Documentation: DT: Document rx51-battery binding
>
>  .../devicetree/bindings/power/rx51-battery.txt     | 25 ++++++++
>  drivers/power/rx51_battery.c                       | 68 ++++++++++++=
++--------
>  2 files changed, 70 insertions(+), 23 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/power/rx51-batt=
ery.txt
>
> --
> 1.8.5.3
>

Thanks for patch!

I would like to ask other kernel developers what do you think about
moving ADC channel numbers from rx51_battery.ko driver code to DT.
Driver rx51_battery.ko is platform specific for Nokia RX-51 (N900) so
it is usefull only for this one device.

Before this patch all driver data (look-up tables, adc channel
numbers, etc...) were in driver code. Now after this patch adc channel
numbers were moved to DT. What do you think? It is better to have all
data in one place (driver code) or some in DT and some in driver code?

=46or me it does not make sense to move these numbers to DT, because
driver is rx51 device specific and chaning it in DT does not make
sense. And I think it is better to have add driver data in one place
and not in two...

Sebastian already wrote me that this is normal to have numbers in DT
and other code in driver. But I think that driver which can be used
only in one device (so specified only in one DT file) does not need to
have configuration (via DT or board files).

Or do you think that driver specified only for one device needs to
have ADC numbers configuration via DT?

--=20
Pali Roh=C3=A1r
pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
