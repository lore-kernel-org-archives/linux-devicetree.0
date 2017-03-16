From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 3/7] arm: dts: dt-bindings: Add Renesas RZ pinctrl header
Date: Thu, 16 Mar 2017 15:03:25 +0000
Message-ID: <SG2PR06MB1165846E7C2AA8133FC166538A260@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
 <1487610788-6939-4-git-send-email-jacopo+renesas@jmondi.org>
 <SG2PR06MB1165A5A95A54365FF5E43FCF8A210@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <38f7c630-d765-da38-dcdc-fed2c853cf36@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <38f7c630-d765-da38-dcdc-fed2c853cf36@jmondi.org>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: jacopo mondi <jacopo@jmondi.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

> > Additionally, according to the RZ/A1 hardware manual:
> >  "When the output buffer is enabled and the PBDCn.PBDCnm bit is 1, the
> >   input buffer is enabled regardless of this register setting."
> >
>=20
> Yes, I used INPUT_EN to drive PBDC..
> My assumption was that "users" would have had to decide when a pin was
> acting as input, when describing it in dts, rather than having to deal
> with the TRM and learn what bidirectional control is and is consequences
> (particularly, that it enables the input buffer).
>=20
> But since I guess this whole driver assumes more detailed knowledge on th=
e
> hardware compared to group-based ones, I think using BI_DIR is fine here

The reality is, I will be providing DT examples and people will just follow
them like they copy/paste the code from my rskrza1-board.c file today.
Of course they still have to look up the 'alternative function' number in t=
he
Hardware manual, but that's in an easy to read table.



> > So in summary, this is how I think things should look in the DT:
> >
> > Example of a 'normal' pin (most of the pins).
> > 		/* P3_0 as TxD2; P3_2 as RxD2 */
> > 		renesas,pins =3D <PIN(3, 0) 6>,
> > 			       <PIN(3, 2) 4>;
>=20
> Just to make sure I'm following you: why RxD2 (P3_2) is not marked as
> BI_DIR?

Because it doesn't have to be. The pin controller itself knows how to set i=
t up
itself as soon as you set the PIPC.

> I would have expected to have the flag specified here, as it
> requires PIBC enabled (and as you said, BI_DIR drives PBDC that enables
> PIBC consequentially)

PIBC (Port Input Buffer Control) is only valid when you are in GPIO input p=
ort
mode (PMCn.PMCnm =3D 0 and PMn.PMnm =3D 1).


The reality is, it would be nice if the controller could magically know how=
 to
set all the pins direction, buffers and such depending on their function, b=
ut
there were some that needed an extra signals to be manually set (whether it=
 makes
sense or not). I guess that's the consequence of mixing-and-matching IP fro=
m
different product lines. Oh well, we just fix it all in software, right?  ;=
)

I'd rather this than the PFC that's in the R-Car....which I think is the re=
sult
of trying to make it smarter and just ended up making it more complicated.


Cheers


Chris
