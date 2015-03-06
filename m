From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] pinctrl: dt: at91: new binding
Date: Fri, 6 Mar 2015 18:07:08 +0100
Message-ID: <20150306170708.GR3989@piout.net>
References: <1424943294-8805-1-git-send-email-plagnioj@jcrosoft.com>
 <54F9C2FE.8060804@atmel.com>
 <AB034DC5-9E4C-4883-BBF0-B93B438C7A54@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AB034DC5-9E4C-4883-BBF0-B93B438C7A54-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Nicolas FERRE <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/03/2015 at 00:49:55 +0800, Jean-Christophe PLAGNIOL-VILLARD wrote=
 :
> >=20
> > Sorry but NACK.
> >=20
> > I don't want to manage another flavor of the pinmux biding with no =
real
> > benefit. I would have been good if we had it from day-1. Now it's t=
oo late.
>=20
> yes we do, we catch but a compiling time instead of RUNTIME which is =
critical
>=20
> so I=E2=80=99ll pass on the NACK
>=20

If you are changing the binding, how about doing it right this time and
completely drop the current mess?

> >=20
> > Moreover, splitting a binding definition if you have a function giv=
en by
> > multiple banks can be weird and not well understood in regard to ou=
r
> > current group+function definition scheme (Cf. your last example).
> >=20
>=20
> Others already do so and this is not complex at all
>=20

--=20
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
