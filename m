From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] pinctrl: dt: at91: new binding
Date: Fri, 6 Mar 2015 19:23:45 +0100
Message-ID: <20150306192345.1262cc94@bbrezillon>
References: <1424943294-8805-1-git-send-email-plagnioj@jcrosoft.com>
	<54F9C2FE.8060804@atmel.com>
	<AB034DC5-9E4C-4883-BBF0-B93B438C7A54@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AB034DC5-9E4C-4883-BBF0-B93B438C7A54-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Nicolas FERRE <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jean-Christophe,

On Sat, 7 Mar 2015 00:49:55 +0800
Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:

>=20
> > On Mar 6, 2015, at 11:08 PM, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org=
> wrote:
> >=20
> > Le 26/02/2015 10:34, Jean-Christophe PLAGNIOL-VILLARD a =C3=A9crit =
:
> >> Today if we want to disable a pio bank we may will siliently break=
 pinctrl
> >> configuration in the DT. This will be detected only at runtime.
> >>=20
> >> So move the pinctrl configuration to the bank instead of the bus.
> >> This allow to detect pinctrl issue at DT compiling time when disab=
le a bank.
> >>=20
> >> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft=
=2Ecom>
> >> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >> ---
> >> .../bindings/pinctrl/atmel,at91-pinctrl.txt        | 66 ++++++++++=
++++++++++++
> >> 1 file changed, 66 insertions(+)
> >>=20
> >> diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-=
pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinc=
trl.txt
> >> index b7a93e8..78355ee 100644
> >> --- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl=
=2Etxt
> >> +++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl=
=2Etxt
> >> @@ -148,3 +148,69 @@ dbgu: serial@fffff200 {
> >> 	pinctrl-0 =3D <&pinctrl_dbgu>;
> >> 	status =3D "disabled";
> >> };
> >> +
> >> +II) New Bindings per PIO Block
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

Tell me, how can you pass on a NACK coming from the at91 maintainer
(which is also your co-maintainer) when you modify bindings of an at91
driver ?
Please let's try to be constructive here, so that we can find an
acceptable solution.

>=20
> >=20
> > Moreover, splitting a binding definition if you have a function giv=
en by
> > multiple banks can be weird and not well understood in regard to ou=
r
> > current group+function definition scheme (Cf. your last example).
> >=20

I don't think it's a good idea either: you'll have to split pinconf
definitions and that definitely doesn't improve readability.

>=20
> Others already do so and this is not complex at all

Could you point out these bindings (and real examples please).

Best Regards,

Boris


--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
