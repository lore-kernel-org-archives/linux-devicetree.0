From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH 1/2] pinctrl: change function behavior for per
 pin muxing controllers
Date: Tue, 30 Jun 2015 11:17:37 +0200
Message-ID: <55925EB1.1030500@atmel.com>
References: <1433948699-19800-1-git-send-email-ludovic.desroches@atmel.com> <1433948699-19800-2-git-send-email-ludovic.desroches@atmel.com> <557EF60D.8020007@wwwdotorg.org> <20150617123816.GB12295@odux.rfo.atmel.com> <5581988C.50000@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5581988C.50000-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 17/06/2015 17:55, Stephen Warren a =E9crit :
> On 06/17/2015 06:38 AM, Ludovic Desroches wrote:

[..]

>> I have sent patches months ago trying to improve things by having
>> something more flexible. I don't think I introduce too big changes.
>> The only answers I got were from people thinking that pinctrl framew=
ork
>> conception is not good to fit all kind of controllers. I re-sent the
>> patch series to gain more expose and have no  answer...
>=20
> I don't see anything in your description which implies pinctrl isn't=20
> perfectly suitable for your HW.

We are not talking about suitability, we are talking about some little
changes to the generic part, just to have more accurate information and
a little bit more flexibility with our controller.

We read the drivers that Stephen pointed out and it seems that it even
doesn't use the whole generic part of the pinconf. Moreover, we do thin=
k
that the statement "one pin" =3D=3D "one group" leads to a loss of
information and ease of use.
We are not talking about the use of defines, tables, macros to reach an
usable pinctrl: let's say that we have different views.

> Note that I'm on vacation for a couple weeks soon, and I don't expect=
 to=20
> follow this conversation during that time. Ultimately, LinusW owns th=
e=20
> pinctrl subsystem, and you need to convince him of any changes.

Okay, so we are back at the same situation we had ended up with several
months ago:

- no agreement on 3 points:
1/ ways to use groups in generic pinctrl
2/ ways to describe a comprehensive configuration in device tree
3/ readability of a sysfs information

- no way out on the generic pinctrl little changes that Ludovic propose=
d
as Linus W. never gave his point of view (RFC posts on April the 2nd).

Ludovic explained at length our point of view and gave detailed
technical arguments. We don't intend to convince you, we just would lik=
e
the harmless modifications to be integrated.

As we preferred to give a chance to the generic pinconf/pinctrl for our
use by adding a little bit of flexibility, we are now in a situation
where we are nearly obliged to give up this approach and write a new
driver without the use of the generic facilities: what a pity!
We lost several months of useless work to match what we thought the
maintainer would prefer.

So Linus, do you confirm that we won't go further with this approach?

We are pretty disappointed by the way this interaction with the pinctrl
sub-system went.

Best regards,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
