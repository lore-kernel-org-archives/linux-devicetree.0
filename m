From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH v10 2/3] power-domain: rockchip: add power doamin driver
Date: Thu, 13 Nov 2014 12:24:47 -0800
Message-ID: <7hh9y2c0hc.fsf@deeprootsystems.com>
References: <1415690392-9278-1-git-send-email-caesar.wang@rock-chips.com>
	<1415690392-9278-3-git-send-email-caesar.wang@rock-chips.com>
	<7h7fz1of0m.fsf@deeprootsystems.com> <11419951.x8p1Z4vKjh@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <11419951.x8p1Z4vKjh@diego> ("Heiko =?utf-8?Q?St=C3=BCbner=22?=
 =?utf-8?Q?'s?= message of "Wed,
	12 Nov 2014 01:10:28 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Caesar Wang <caesar.wang@rock-chips.com>, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, dianders@chromium.org, linux-rockchip@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, fzf@rock-chips.com, cf@rock-chips.com, Jack Dai <jack.dai@rock-chips.com>, "jinkun.hong" <jinkun.hong@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Heiko St=C3=BCbner <heiko@sntech.de> writes:

> Am Dienstag, 11. November 2014, 08:53:13 schrieb Kevin Hilman:
>> Caesar Wang <caesar.wang@rock-chips.com> writes:
>> > In order to meet high performance and low power requirements, a po=
wer
>> > management unit is designed or saving power when RK3288 in low pow=
er mode.
>> > The RK3288 PMU is dedicated for managing the power ot the whole ch=
ip.
>> >=20
>> > Signed-off-by: Jack Dai <jack.dai@rock-chips.com>
>> > Signed-off-by: jinkun.hong <jinkun.hong@rock-chips.com>
>> > Signed-off-by: Caesar Wang <caesar.wang@rock-chips.com>
>> >=20
>> > ---
>> >=20
>> > Changes in v10:
>> >     - this switches over domain infos to use masks instead of reco=
mputing
>> >    =20
>> >       them each time and also gets rid of custom domain translator=
 and
>> >       uses standard onecell on.
>> >=20
>> > Changes in v9:
>> >     - fix v8 changes as follows:
>> >     - This reconciles the v2 and v7 code so that we power domain h=
ave
>> >    =20
>> >       lists of clocks they toggle on and off during power transiti=
ons and
>> >       independently from power domains clocks we attach clocks to =
devices
>> >       comprising power domain and prepare them so they are turn on=
 and off
>> >       by runtime PM.
>>=20
>> I still don't like having lists of clocks in the power-domain DT.
>>=20
>> DT is supposed to describe the hardware, and clocks are properties o=
f
>> devices, not power-domains, so the DT description should follow from=
 that.
>
> on the policy side one could argue that if the clock needs to be enab=
led to=20
> achieve sucessful domain state-changes, that it is also a property of=
 the=20
> domain itself in addition to the device.

You could, but from a hardware perspective, the clock is a property of
the device.

> And on the pratical side we don't have drivers nor bindings for a big=
 part of=20
> the domain users - and this will probably be true for quite some time=
=2E This of=20
> course makes it very impractical (or impossible) to collect the clock=
s for=20
> parts like the gpu (mali), hevc, vcodec (video encoder/decoder), rga =
(2d=20
> stuff), iep, isp.

This doesn't sound impossible at all.

You have to collect the clocks anyways.  The only debate is whether to
list them in the device node or the power-domain node. =20

Even for devices without drivers, you just need a minimal node in the D=
T if
which lists the clocks and has a phandle to the parent power domain.

Sounds rather simple to me, and since the DT is supposed to describe th=
e
hardware, doing it this way makes looking at the DT actually help
understand the hardware.

Kevin
