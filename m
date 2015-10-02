From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] gpio:pca953x: add mechanism to simulate open drain outputs
Date: Fri, 2 Oct 2015 05:01:54 -0700
Message-ID: <CACRpkdbLihw_1piTeaMcMekido-yra7kZiZjqih=0UrJ8-Y2xQ@mail.gmail.com>
References: <cover.1443031678.git.hns@goldelico.com>
	<1B9C7F91-0025-4C1D-95AD-FD5A4B0B4176@goldelico.com>
	<CACRpkdYYGn71Z_pgtBpk5nwknDZ1VyRam9Fj=JDkNyt4KCWFmQ@mail.gmail.com>
	<FEB50554-2A45-4B3C-A896-EBF723AB3572@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <FEB50554-2A45-4B3C-A896-EBF723AB3572-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, eric miao <eric.miao-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Grazvydas Ignotas <notaz-in7WBhxDdJqvTmjiLVyRpw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 24, 2015 at 11:49 PM, H. Nikolaus Schaller
<hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org> wrote:
> [Me]
>> I understand the approach, but this is the wrong way to do it.
>> Instead of indicating that a pin on the pin controller should be
>> open drain, the *consumer* specifying its gpios =3D <....> should
>> do this.
>
> On a second thought I am no longer sure if that is the right approach=
=2E
>
> A gpio is for input and output of =E2=80=9C0=E2=80=9D and =E2=80=9C1=E2=
=80=9D values. And a gpio consumer
> can control if the output should be active or inactive and input.
>
> How the output is physically represented (totem-pole or single-ended,
> high power, low power etc.) is not a property of the gpio itself and
> there is IMHO no need for the consumer to be able to define (or chang=
e)
> it.

As it is today we already have support for open drain/collector in the
GPIO subsystem, as open drain pins should not be actively driven
to 1 and open source pins not actively driven to 0, instead set as
input for each of these use cases.
(See drivers/gpio/gpiolib.c, grep for OPEN_DRAIN)

> On SoC with integrated gpio controllers it is very common to have
> pinmux definitions completely separated from the gpio controller
> properties. But the gpio consumer can connect to pinctrl settings
> to describe that the pin should have certain physical properties.
>
> There, it is common to be able to enable/disable pull-up/downs as
> well.

So this is up to the driver to implement today, but last week
Tony Lindgren and Grygorii Strashko approached me to add flags
for this into the GPIO subsystem as well.

We already have a few GPIO drivers cross-calling
pinctrl_request_gpio()
pinctrl_free_gpio()
pinctrl_gpio_direction_input()
pinctrl_gpio_direction_output()

So we can very well add a
pinctrl_gpio_set_config() to set up pulls, open drain/source,
drive strength etc if it makes sense.

> So turning a totem-pole output (as it is available in the tca6424)
> into an open-drain output is sort of turning off the pull-up transist=
or.
> I.e. comparable to a pinmux setting.
>
> So such controllers should get the option to define pinctrl.

Yes and Tony/Grygorii want to do that from the GPIO consumer
side.

> Some chips might have special control registers for doing that
> while others need the trick to switch between input and output
> mode but that is driver implementation detail.
>
> But I am not sure if this has other implications.

We will hash it out as we go along, but I see no immediate
blocker for this.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
