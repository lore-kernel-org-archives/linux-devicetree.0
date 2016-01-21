From: Alban <albeu-GANU6spQydw@public.gmane.org>
Subject: Re: [RFC 1/4] WIP: MIPS: ath79: make ar933x clks more
 devicetree-friendly
Date: Thu, 21 Jan 2016 12:03:20 +0100
Message-ID: <20160121120320.217c8a03@tock>
References: <1453074987-3356-1-git-send-email-antonynpavlov@gmail.com>
	<1453074987-3356-2-git-send-email-antonynpavlov@gmail.com>
	<20160118205725.0a16be8e@tock>
	<20160121031215.250b826347fd9c179b031288@gmail.com>
	<20160121091217.379b6239@tock>
	<20160121131711.a7315d3ca6233e50ec824544@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160121131711.a7315d3ca6233e50ec824544-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Aban Bedel <albeu-GANU6spQydw@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 21 Jan 2016 13:17:11 +0300
Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Thu, 21 Jan 2016 09:12:17 +0100
> Alban <albeu-GANU6spQydw@public.gmane.org> wrote:
> 
> > On Thu, 21 Jan 2016 03:12:15 +0300
> > Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > 
> > > On Mon, 18 Jan 2016 20:57:25 +0100
> > > Alban <albeu-GANU6spQydw@public.gmane.org> wrote:
> > > 
> > > > On Mon, 18 Jan 2016 02:56:24 +0300
> > > > Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > > 
> > > > > At the moment ar933x of-enabled drivers use use clock names
> > > > > (e.g. "uart" or "ahb") to get clk descriptor.
> > > > > On the other hand
> > > > > Documentation/devicetree/bindings/clock/clock-bindings.txt states
> > > > > that the 'clocks' property is required for passing clk to clock
> > > > > consumers.
> > > > 
> > > > This patch is not need, you should set the clock-names property in
> > > > the relevant device nodes instead.
> > > 
> > > This patch is needed for AR9331!
> > > 
> > > In ar933x_clocks_init() we have
> > > 
> > >         ath79_add_sys_clkdev("ref", ref_rate);
> > >         clks[0] = ath79_add_sys_clkdev("cpu", cpu_rate);
> > >         clks[1] = ath79_add_sys_clkdev("ddr", ddr_rate);
> > >         clks[2] = ath79_add_sys_clkdev("ahb", ahb_rate);
> > > 
> > >         clk_add_alias("wdt", NULL, "ahb", NULL);
> > >         clk_add_alias("uart", NULL, "ref", NULL);
> > > 
> > > "uart" is an alias for "ref". But "ref" is not visible via device tree!
> > > 
> > > I see this error message on ar933x-uart start:
> > >  
> > >      ERROR: could not get clock /ahb/apb/uart@18020000:uart(0)
> > 
> > The ref clock should be defined in the board DTS, I now see that it is
> > missing in yours. What you need to do is to define the clock-names
> > property in the Soc DTS, that allow the names lookup to work. Then in
> > the board DTS you can define the clock property to connect it to the
> > proper parent. 
> > 
> > I'm also working on supporting the QCA9558 and the clock tree is similar.
> > See https://github.com/AlbanBedel/linux/commit/d6c8f8adfce08972c6
> > as example.
> 
> Current ath79 clock.c code does not read ref clock from devicetree!
> So you can set any clock rate value in board DTS but it will has no effect
> on the real clk calculation.

Yes, the ath79 clock is broken in this respect, however the uart driver
isn't and it will use the clock it receive. The fixed oscillator works
fine on QCA9558 which also use the ref clock for the uart.

> A more reasonable solution is used for CI20 board.
> In arch/mips/boot/dts/ingenic/jz4780.dtsi we have
> 
> 	ext: ext {
> 		compatible = "fixed-clock";
> 		#clock-cells = <0>;
> 	};
> 
> ...
> 
> 	cgu: jz4780-cgu@10000000 {
> 		compatible = "ingenic,jz4780-cgu";
> 		reg = <0x10000000 0x100>;
> 
> 		clocks = <&ext>, <&rtc>;
> 		clock-names = "ext", "rtc";
> 
> 		#clock-cells = <1>;
> 	};
> 
> 
> In arch/mips/boot/dts/ingenic/ci20.dts we have
> 
> &ext {
> 	clock-frequency = <48000000>;
> };
> 
> At last drivers/clk/ingenic/jz4780-cgu.c registers this "ext" clock
> as a parent of most other subordianate clocks. So there is no magic
> frequency constants in drivers/clk/ingenic!
> 
> In arch/mips/ath79/clocks.c we have a very different situation:
> the reference clock frequences are already hardcoded in C-code so there is
> no need to mention them in devicetree files.

No, we need to fix the code to only use the hard coded values for the
legacy platforms.

Alban
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
