From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH v5 1/3] mfd: devicetree: bindings: Add Qualcomm RPM DT
 binding
Date: Thu, 14 Aug 2014 17:04:05 -0700
Message-ID: <20140815000403.GA7070@sonymobile.com>
References: <1407796988-25872-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1407796988-25872-2-git-send-email-bjorn.andersson@sonymobile.com>
 <AF6050C7-EF40-4865-9E41-B730FEF59D6C@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AF6050C7-EF40-4865-9E41-B730FEF59D6C@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Andy Gross <agross@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@linaro.org>, Josh Cartwright <joshc@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue 12 Aug 10:43 PDT 2014, Kumar Gala wrote:

>=20
> On Aug 11, 2014, at 5:43 PM, Bjorn Andersson <Bjorn.Andersson@sonymob=
ile.com> wrote:
>=20
[...]
> > diff --git a/Documentation/devicetree/bindings/mfd/qcom,rpm.txt b/D=
ocumentation/devicetree/bindings/mfd/qcom,rpm.txt
[...]
> > +- reg:
> > +     Usage: required
> > +     Value type: <prop-encoded-array>
> > +     Definition: two entries specifying the physical address and s=
ize of the
> > +                 RPM's message ram
>=20
> I=92m a little confused here, by =91two entries=92 do you mean two va=
lues or really two regions? < A B > or < A B C D >?
>=20

Hmm, I agree with you, but I'm not sure what the definition of an entry=
 is in
this context and looking around at other bindings makes me wonder even =
more.

How about we reduce the confusion by dropping the beginning and letting=
 it be
"the physical address and size of..."?

> > +
[...]
> > +
> > +- qcom,ipc:
> > +     Usage: required
> > +     Value type: <prop-encoded-array>
> > +     Definition: three entries specifying:
> > +                 - phandle to a syscon node representing the apcs =
registers
> > +                 - u32 representing offset to the register within =
the syscon
> > +                 - u32 representing the ipc bit within the registe=
r
>=20
> Can we clarify that this is ipc from Apps (or ARM processors to RPM)
>=20

Makes sense

> > +
> > +
> > +=3D SUBDEVICES
>=20
> These should not be children of RPM, but in an RPM container outside =
of the SoC node with some phandle reference (if needed) to the RPM.  Th=
e reason is there isn=92t really a technical means to translate from th=
e SoC / MMIO bus address space to the RPM address space that these node=
s live in.
>=20

I don't agree with this; the regulators, clocks and bus-scalers aren't
components on their own but just parts of the RPM. Your argument indica=
tes that
every pmic, i2c, spi... block got this wrong, I think we should better =
follow
the pattern defined by the rest of these.

One thing that I think should be fixed though is to rename "SUBDEVICES"=
 to
"SUBNODES" as "devices" is an implementation detail in my solution.

> Also, the binding specs should be split out into their own files.
>=20

Not according to Rob Herring:
https://lkml.org/lkml/2014/3/10/567

> > +
> > +The RPM exposes resources to its subnodes. The below bindings spec=
ify the set
> > +of valid subnodes that can operate on these resources.
> > +
> > +=3D=3D Switch-mode Power Supply regulator
> > +
[...]
> > +- reg:
> > +     Usage: required
> > +     Value type: <u32>
> > +     Definition: resource as defined in <dt-bindings/mfd/qcom,rpm.=
h>
> > +
>=20
> Can we spec what subset of values in qcom,rpm.h are actually valid?
>=20

Yes, sorry about not improving this part.

[...]
> > +- qcom,switch-mode-frequency:
> > +     Usage: required
> > +     Value type: <u32>
> > +     Definition: Frequency (Hz) of the switch-mode power supply;
> > +                 must be one of:
> > +                 19200000, 9600000, 6400000, 4800000, 3840000, 320=
0000,
> > +                 2740000, 2400000, 2130000, 1920000, 1750000, 1600=
000,
> > +                 1480000, 1370000, 1280000, 1200000
> > +
> > +- qcom,force-mode-none:
>=20
> I think I asked this last time I took a look at this, but can we have=
 multiple force-mode=92s set?  If no, maybe this should be an enum inst=
ead.
>=20

No, they are mutually exclusive. I just like the boolean representation
instead, but I can change it to an enum and provide some constants in t=
he
header file.

Looking through msm-3.4 almost everything seems to be using force mode =
"none",
with a few uses of "auto". So if we turn it into an enum then we could =
specify
"none" in the platform dtsi (or don't specifying anything?) and only ha=
ve to
override it in the very few places it needs to be anything else.

> > +     Usage: optional (default if no other qcom,force-mode is speci=
fied)
> > +     Value type: <empty>
> > +     Defintion: indicates that the regulator should not be forced =
to any
> > +                particular mode
> > +
> > +- qcom,force-mode-lpm:
> > +     Usage: optional
> > +     Value type: <empty>
> > +     Definition: indicates that the regulator should be forced to =
operate in
> > +                 low-power-mode
> > +
> > +- qcom,force-mode-auto:
> > +     Usage: optional (only available for 8960/8064)
>=20
> can we say only available for "qcom,rpm-msm8960=94, "qcom,rpm-apq8064=
"
>=20

Indeed.

> > +     Value type: <empty>
> > +     Definition: indicates that the regulator should be automatica=
lly pick
> > +                 operating mode
> > +
> > +- qcom,force-mode-hpm:
> > +     Usage: optional (only available for 8960/8064)
>=20
> can we say only available for "qcom,rpm-msm8960=94, "qcom,rpm-apq8064=
"
>=20

Indeed.

> > +     Value type: <empty>
> > +     Definition: indicates that the regulator should be forced to =
operate in
> > +                 high-power-mode
> > +
> > +- qcom,force-mode-bypass: (only for 8960/8064)
> > +     Usage: optional (only available for 8960/8064)
>=20
> can we say only available for "qcom,rpm-msm8960=94, "qcom,rpm-apq8064=
"
>=20

Indeed.

>=20
> > +     Value type: <empty>
> > +     Definition: indicates that the regulator should be forced to =
operate in
> > +                 bypass mode
> > +
> > +- qcom,power-mode-hysteretic:
> > +     Usage: optional
> > +     Value type: <empty>
> > +     Definition: indicates that the power supply should operate in=
 hysteretic
> > +                 mode (defaults to qcom,power-mode-pwm if not spec=
ified)
> > +
> > +- qcom,power-mode-pwm:
> > +     Usage: optional
> > +     Value type: <empty>
> > +     Definition: indicates that the power supply should operate in=
 pwm mode
>=20
> If we default to pwm mode w/o any property why do we need 2 things he=
re.  Seems like existence of (or lack there of) qcom,power-mode-hystere=
tic says how to set the power-mode
>=20

You're right, that's cleaner.

> > +
> > +Standard regulator bindings are used inside switch mode power supp=
ly subnodes.
> > +Check Documentation/devicetree/bindings/regulator/regulator.txt fo=
r more
> > +details.
> > +

Same answers goes for the other subnodes.


Thanks for the feedback!

Regards,
Bjorn
