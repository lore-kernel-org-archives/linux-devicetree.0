From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: Olimex A64-OLinuXino: enable
 eMMC.
Date: Thu, 27 Sep 2018 10:17:11 +0200
Message-ID: <20180927081711.llmwnvpu73loe5iv@flea>
References: <20180919141815.18737-1-rodrigo@tjader.xyz>
 <20180921142811.h5jraemk565alh3i@flea>
 <CAG7TQgE_KU_cK_4E+NG8Qcw-QB2=C6YoqBYR2svmWxywFyySCw@mail.gmail.com>
 <20180925090139.qbu6tqav5oth7zkw@flea>
 <CAG7TQgFTsR4pf4jAcWMFoOmiP7AXYqjts60RP2kuJGU44AcQJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAG7TQgFTsR4pf4jAcWMFoOmiP7AXYqjts60RP2kuJGU44AcQJQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rodrigo =?utf-8?B?RXh0ZXJja8O2dHRlciBUasOkZGVy?= <rodrigo@tjader.xyz>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 25, 2018 at 02:47:59PM -0300, Rodrigo Exterckötter Tjäder wrote:
> On Tue, Sep 25, 2018 at 6:01 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > We can't really do that, unfortunately. If the device tree name was to
> > change for a given board, we'd break all the build systems, boot
> > scripts and distros out there.
> 
> What if we keep the device tree for the version without WiFi and eMMC
> with the current name and create new device trees for the other two
> versions?

Wifi and Bluetooth should be dealt with with overlays in this case,
and since the eMMC is already enabled, then there's nothing to do, I
guess.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
