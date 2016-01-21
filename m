From: Alban <albeu@free.fr>
Subject: Re: [RFC 1/4] WIP: MIPS: ath79: make ar933x clks more
 devicetree-friendly
Date: Thu, 21 Jan 2016 09:12:17 +0100
Message-ID: <20160121091217.379b6239@tock>
References: <1453074987-3356-1-git-send-email-antonynpavlov@gmail.com>
        <1453074987-3356-2-git-send-email-antonynpavlov@gmail.com>
        <20160118205725.0a16be8e@tock>
        <20160121031215.250b826347fd9c179b031288@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20160121031215.250b826347fd9c179b031288@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Antony Pavlov <antonynpavlov@gmail.com>
Cc: Aban Bedel <albeu@free.fr>, linux-mips@linux-mips.org, Yegor Yefremov <yegorslists@googlemail.com>, Gabor Juhos <juhosg@openwrt.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 21 Jan 2016 03:12:15 +0300
Antony Pavlov <antonynpavlov@gmail.com> wrote:

> On Mon, 18 Jan 2016 20:57:25 +0100
> Alban <albeu@free.fr> wrote:
> 
> > On Mon, 18 Jan 2016 02:56:24 +0300
> > Antony Pavlov <antonynpavlov@gmail.com> wrote:
> > 
> > > At the moment ar933x of-enabled drivers use use clock names
> > > (e.g. "uart" or "ahb") to get clk descriptor.
> > > On the other hand
> > > Documentation/devicetree/bindings/clock/clock-bindings.txt states
> > > that the 'clocks' property is required for passing clk to clock
> > > consumers.
> > 
> > This patch is not need, you should set the clock-names property in
> > the relevant device nodes instead.
> 
> This patch is needed for AR9331!
> 
> In ar933x_clocks_init() we have
> 
>         ath79_add_sys_clkdev("ref", ref_rate);
>         clks[0] = ath79_add_sys_clkdev("cpu", cpu_rate);
>         clks[1] = ath79_add_sys_clkdev("ddr", ddr_rate);
>         clks[2] = ath79_add_sys_clkdev("ahb", ahb_rate);
> 
>         clk_add_alias("wdt", NULL, "ahb", NULL);
>         clk_add_alias("uart", NULL, "ref", NULL);
> 
> "uart" is an alias for "ref". But "ref" is not visible via device tree!
> 
> I see this error message on ar933x-uart start:
>  
>      ERROR: could not get clock /ahb/apb/uart@18020000:uart(0)

The ref clock should be defined in the board DTS, I now see that it is
missing in yours. What you need to do is to define the clock-names
property in the Soc DTS, that allow the names lookup to work. Then in
the board DTS you can define the clock property to connect it to the
proper parent. 

I'm also working on supporting the QCA9558 and the clock tree is similar.
See https://github.com/AlbanBedel/linux/commit/d6c8f8adfce08972c6
as example.

Alban
