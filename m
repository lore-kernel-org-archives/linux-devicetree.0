From: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH v2 4/6] dt: bindings: add mt7621-pll dt binding
 documentation
Date: Sun, 18 Aug 2019 18:07:40 +0800
Message-ID: <CAJsYDVJ4uo-Ke159C2Xmed6A5vCjB7J6JuD+woPF+gY9cLct+w@mail.gmail.com>
References: <20190724022310.28010-1-gch981213@gmail.com>
 <20190724022310.28010-5-gch981213@gmail.com>
 <20190813155143.GA19830@bogus>
 <CAJsYDVKnf4M8jyVOyotRxs=SsHqjex_q60AwkX=QAPK33ivw-Q@mail.gmail.com>
 <2d48f4a4-7d30-547b-21ee-6aadabe7d7c3@gmx.net>
 <CAJsYDVLq1-U_AngA4=YKHS_L=zurhLse9XwQ0Rzup9BdXfri-w@mail.gmail.com>
 <6b6ee744-61d3-8848-19e7-0a301fe4d1b3@rempel-privat.de>
 <CAJsYDVLLPa07wUg2EoeJww9XSJYgX_kBu-oGiv7n+zejUc877w@mail.gmail.com>
 <fb39803d-d303-f259-d78d-9f8b1fc7dde3@rempel-privat.de>
 <CAJsYDVK9Yj02WxNFo7iEP3aJn+j5MqzCtLrmgsz=4zWnfQ4VOw@mail.gmail.com>
 <6426d4d2-9961-83f2-d3bc-5834ff36b40d@rempel-privat.de>
 <CAJsYDVKW9-7ityUn83NXcQYmqJi_t-VSV8F0c+BA14_w+poPkA@mail.gmail.com>
 <CAJsYDVJnQyOXHKWztoE72KKnMinJL+1AZGy_CvTT6oOs5m5U2w@mail.gmail.com>
 <c8551d99-7296-c621-1b56-017910f28400@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <c8551d99-7296-c621-1b56-017910f28400@rempel-privat.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, James Hogan <jhogan@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, open list <linux-kernel@vger.kernel.org>, Paul Fertser <fercerpav@gmail.com>, Paul Burton <paul.burton@mips.com>, Weijie Gao <hackpascal@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Crispin <john@phrozen.org>, NeilBrown <neil@brown.name>, Mark Rutland <mark.rutland@arm.com>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi!

On Sun, Aug 18, 2019 at 5:51 PM Oleksij Rempel <linux@rempel-privat.de> wrote:
>
> lets see more code:
> drivers/staging/mt7621-mmc/sd.c
> /* clock source for host: global */
> #if defined(CONFIG_SOC_MT7620)
> static u32 hclks[] = {48000000}; /* +/- by chhung */
> #elif defined(CONFIG_SOC_MT7621)
> static u32 hclks[] = {50000000}; /* +/- by chhung */
> #endif
>
> hm.. 50Mhz again. Feels like APB clock.
>
> ./drivers/staging/mt7621-dts/mt7621.dtsi
>         cpuclock: cpuclock@0 {
>                 #clock-cells = <0>;
>                 compatible = "fixed-clock";
>
>                 /* FIXME: there should be way to detect this */
>                 clock-frequency = <880000000>;
>         };
>
> Your driver is trying to cover cpuclock
>
>         sysclock: sysclock@0 {
>                 #clock-cells = <0>;
>                 compatible = "fixed-clock";
>
>                 /* This is normally 1/4 of cpuclock */
>                 clock-frequency = <220000000>;
>         };
>
> and most probably system clock alias "bus clock", most probably AHB.

This sysclock was the 50MHz clock in OpenWrt. It's set as "bus clock"
upstream by an incorrect commit.
As already stated in previous reply: I'm not going to make assumption
about clock plan using OpenWrt's device tree because it already
contains several mistakes on clocks. Since the upstream device tree
comes from there, I don't trust it either. You might want to check out
patch 6/6 in this series where the original author of this commit in
openwrt fixed some clocks and I ported it here.

> [...]
> > This debate goes nowhere. I've clarified the situation and made my
> > point. Of course I can't read through the ancient and heavily hacked
> > vendor kernel to figure out a clock plan myself.
>
> Ok, I provided you some productive technical hints how it should be
> done. I don't think mt7620 has better documentation then mt7621 and even
> in this case it was possible to make more or less good driver.

It does. A clock plan for mt7620 is available in MT7620 Programming
Guide, Page 14.

Regards,
Chuanhong Guo
