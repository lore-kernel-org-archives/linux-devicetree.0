Return-Path: <SRS0=Fy5c=QS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from verein.lst.de ([213.95.11.211]:55998 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726045AbfBKLMr (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 11 Feb 2019 06:12:47 -0500
Date: Mon, 11 Feb 2019 12:12:45 +0100
From: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH RFC] arm64: dts: allwinner: a64: teres-i: Enable audio
Message-ID: <20190211111245.GA18147@lst.de>
Reply-To: 20190201113743.10058-1-harald@ccbib.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
To: Harald Geyer <harald@ccbib.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, info@olimex.com, Mark Brown <broonie@kernel.org>, ibu@radempa.de, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>


> hpvcc-supply vs. cpvdd-supply:
> On the A64 manual the pin is called CPVDD and the binding documents
> requires a cpvdd-supply property. However in the actual driver and
> devicetrees so far hpvcc-supply is used. This is a very new binding,
> so we have the luxury to decide either way, I think. Any input from
> the devicetree maintainers would be appreciated.

I don't really have a strong opinion here, besides settling this ASAP,
to minimise confusion.

> debug console multiplexing:
> Olimex have a userspace script that controls gpio PL9 during boot,
> to select between HP and serial console. I guess this is not acceptable
> for mainline.

> The best solution I can see is to switch the HP jack from serial console
> to audio once the audio drivers load. With this people can still capture
> the bootlogs but everybody gets audio once the system is up and
> switching back to console output is as simple as unloading the audio
> drivers.

IMO it is really not the audio driver's business to mess with this switch.
You could argue as well that the serial driver should get a flag to claim
the HP jack, which would be similarily unjustified.

My solution is to confine this choice inside U-Boot:
in sun50i-a64-teres-i-u-boot.dtsi I put

/ {
        leds {
                compatible = "gpio-leds";
                /* Not really a LED, but the least intrusive workaround */
                audioconsole {
                        label = "teres-i:audio:console";
                        gpio = <&r_pio 0 9 GPIO_ACTIVE_LOW>; /* PL9 */
                        default-state = "on";
                };
        };
[...]

and place a "gpio set PL9;" somewhere in the bootcmd_* logic. Otherwise there's
a *lot* of chirping on the right ear during boot ;-)
The switch is for early boot debugging, so it's best to have U-Boot enable it
when required, and keep it off by default.

> Testing:
> I don't have a headset with combo connector, so I could only test the
> headphones output, but not the headset mic. If somebody happens to
> have a TERES-I and a suitable headset, testing this would be nice.

The pinout required is the "CTIA" one, *not* OMTP (standards are great...) see
https://source.android.com/devices/accessories/headset/plug-headset-spec#mechanical

I do have a compatible headset, but was neither able to record from the HS mic
nor from the internal mic, so I have to try harder, I guess ;-) I could hear
both mics when choosing the mixer as output source though. Mute and boost
worked for both mics, in alsamixer.  Kernel is 4.20.6, so ca0412a05756cd0b
is missing; which shouldn't make a difference in this respect, right?

	Torsten
