From: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH RFC] arm64: dts: allwinner: a64: teres-i: Enable audio
Date: Sun, 17 Feb 2019 12:30:05 +0100
Message-ID: <20190217123005.6684abf9@blackhole.lan>
References: <20190211153945.e34fpwkuk67l7lc6@flea>
 <E1gtHJj-0000iY-G8@stardust.g4.wien.funkfeuer.at>
 <20190212083850.7genwc6ipnxtl7eo@flea>
 <E1gtUZn-0000NW-MA@stardust.g4.wien.funkfeuer.at>
 <20190212100929.iqsxu443qrkl6myf@flea>
 <E1gtds8-0000NB-Re@stardust.g4.wien.funkfeuer.at>
 <20190213094442.da2dy6d5bb527nft@flea>
 <E1gtsx9-0000RP-08@stardust.g4.wien.funkfeuer.at>
 <20190213155311.ovkpim3lxwyvuhhj@flea>
 <E1gu4dx-0000Sy-2B@stardust.g4.wien.funkfeuer.at>
 <20190215142029.GB32618@lst.de>
 <E1gv6rh-0000Km-U8@stardust.g4.wien.funkfeuer.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1gv6rh-0000Km-U8@stardust.g4.wien.funkfeuer.at>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Harald Geyer <harald@ccbib.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, info@olimex.com, Maxime Ripard <maxime.ripard@bootlin.com>, Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, ibu@radempa.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, 16 Feb 2019 21:47:13 +0100
Harald Geyer <harald@ccbib.org> wrote:
> Torsten Duwe writes:

> > I consider the whole console
> > mux GPIO an U-Boot hack, and would put it into
> > sun50i-a64-teres-i-u-boot.dtsi. (As a LED, see above :-)
> 
> The thing is, one of the quite strict rules in kernel development is:
> Never break userspace. That means: If we provide a way to userspace to
> do something (ie switch between debug and audio), we are expected to
> keep it around forever.

No, that rule applies to mechanisms, not configuration. It's not a
problem if a device disappears completely, especially when it's
optional. For clarity's sake, imagine to drop a .dtbo on the fdt that
disables or removes it, after U-Boot has set it.

> > Would you care to submit a patch version without that GPIO handled?
> > I think it's very useful and has the potential to be agreed upon.
> 
> That would enable audio from the internal speakers but select debug
> output on the HP jack by default.

The kernel driver will use whatever the boot preset is; and a
production U-Boot should set that to audio.

> I would be okay with that, despite
> still thinking that audio on the head phones should be the default.

Yes, for production use. For kernel debugging, hack it in U-Boot.
The audio driver should be the last to care.

Imagine you are debugging a boot problem on the serial console and all
of a sudden it stops working just because the audio driver kicks in!

Should any driver ever be in control of that GPIO, it must not be
audio, IMO.

	Torsten
