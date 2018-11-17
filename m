From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v6 3/3] arm64: dts: allwinner: a64: enable sound on Pinebook
Date: Sun, 18 Nov 2018 00:02:04 +0800
Message-ID: <CAGb2v65vDRTUDo894nXvOi8xEkMzeymbU=OQjdyY-Eh38T7F+A@mail.gmail.com>
References: <20181108063929.29720-1-anarsoul@gmail.com> <20181108063929.29720-4-anarsoul@gmail.com>
 <CAGb2v65zb4rXJJv018AfDC-YQgAAmahmQ=-Bb5CyU3kA6wBAqg@mail.gmail.com> <CA+E=qVegv61NgF4peK=Bz2RDvjCUX+M_njrpC4Ph+Jv+r2KFgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+E=qVegv61NgF4peK=Bz2RDvjCUX+M_njrpC4Ph+Jv+r2KFgg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 15, 2018 at 1:48 PM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>
> On Wed, Nov 7, 2018 at 11:30 PM Chen-Yu Tsai <wens@csie.org> wrote:
> > > +
> > > +       speaker_amp: speaker_amp {
> > > +               compatible = "simple-audio-amplifier";
> > > +               enable-gpios = <&pio 7 7 GPIO_ACTIVE_HIGH>; /* PH7 */
> >
> > You might want to add a sound-name-prefix property. See
> >
> >     Documentation/devicetree/bindings/sound/name-prefix.txt
> >
> > Also this should have a reference to its power supply regulator.
>
> You're right, it should reference its power supply which should be a
> fixed regulator controlled via GPIO from AXP803.
>
> Unfortunately there's no AXP803 GPIO support yet and
> simple-audio-amplifier doesn't have regulator property.
>
> I have no time (and interest) to work on it in near future, so if
> anyone wants to pick it up - feel free to do so.

Understood. I can try to pick it up when I have some extra time.

On the other hand, I tried this series on my Pine64 and (with
the necessary device tree changes) on my Bananapi M64. While
audio played (did not stall), no audio was actually coming out
of the headphones I had plugged in. I made sure that all needed
mixer controls were enabled, and the DAPM graph read all green
from the DAI to the Headphone jack.

Any ideas?


Regards
ChenYu
