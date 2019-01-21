MIME-Version: 1.0
Date: Mon, 21 Jan 2019 10:25:08 -0600
References: <20181222155520.8156-1-shc_work@mail.ru>
	<20190103205925.GA7342@bogus>
	<1547641582.37733941@f484.i.mail.ru>
In-Reply-To: <1547641582.37733941@f484.i.mail.ru>
Message-ID: <CAL_Jsq+1LRJTtVeH7p9g8XeefxdsdALJHr6PMqE0BJXXbQN=mA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: input: Update documentation for clps711x-keypad
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jan 16, 2019 at 6:26 AM Alexander Shiyan <shc_work@mail.ru> wrote:
>
> >=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3,  3 =D1=8F=D0=BD=D0=B2=D0=B0=
=D1=80=D1=8F 2019, 23:59 +03:00 =D0=BE=D1=82 Rob Herring <robh@kernel.org>:
> >
> >On Sat, Dec 22, 2018 at 06:55:20PM +0300, Alexander Shiyan wrote:
> >> Since the driver switched to using the syscon_regmap_lookup_by_phandle=
()
> >> function, we need to specify the phandle for the driver. This patch
> >> updates the driver binding documentation for these changes.
> ...
> >> diff --git a/Documentation/devicetree/bindings/input/clps711x-keypad.t=
xt b/Documentation/devicetree/bindings/input/clps711x-keypad.txt
> >> index 3eed881..aebedc3 100644
> >> --- a/Documentation/devicetree/bindings/input/clps711x-keypad.txt
> >> +++ b/Documentation/devicetree/bindings/input/clps711x-keypad.txt
> >> @@ -6,6 +6,7 @@ Required Properties:
> >>  - poll-interval: Poll interval time in milliseconds.
> >>  - linux,keymap:  The definition can be found at
> >>                   bindings/input/matrix-keymap.txt.
> >> +- syscon:        Phandle that points to the CPU syscon1 node.
> >
> >What does this provide? If the keypad registers are a sub-block of the
> >syscon1, then you should make this node a child node.
>
> Syscon does not populate child devices.

I don't have any context of what syscon1 looks like. Maybe it needs
simple-mfd or a driver for the syscon.

Rob
