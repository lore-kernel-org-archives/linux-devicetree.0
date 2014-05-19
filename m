From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Patch v3 0/5] Introduce keystone reset driver
Date: Mon, 19 May 2014 19:47:13 +0200
Message-ID: <5095812.b6DgWAxYzH@wuerfel>
References: <1400495155-11136-1-git-send-email-ivan.khoronzhuk@ti.com>
 <537A1E2C.8040102@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <537A1E2C.8040102@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com, linux@arm.linux.org.uk, linux-doc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, dbaryshkov@gmail.com, rdunlap@infradead.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, olof@lixom.net, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, galak@codeaurora.org, grant.likely@linaro.org, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, dwmw2@infradead.org, w-kwok2@ti.com
List-Id: devicetree@vger.kernel.org

On Monday 19 May 2014 11:07:24 Santosh Shilimkar wrote:
> On Monday 19 May 2014 06:25 AM, Ivan Khoronzhuk wrote:
> > These patches introduce keystone reset driver.
> > 
> > The keystone SoC can be rebooted in several ways. By external reset
> > pin, by soft and by watchdogs. This driver allows software reset and reset
> > by one of the watchdogs. Also added opportunity to set soft/hard reset type.
> > 
> > Based on v3.15-rc5
> > 
> Arnd,
> Can I have have your ack/reviewed-by please since you did gave few comments
> on previous version.

Sorry for not getting back to you earlier on this topic.

> On 04/14/2014 09:44 PM, Arnd Bergmann wrote:
> > On Monday 14 April 2014 20:41:20 Ivan Khoronzhuk wrote:
> >> +Optional properties:
> >> +
> >> +- ti,soft-reset:       Boolean option indicating soft reset.
> >> +                       By default hard reset is used.
> >> +
> >> +- ti,wdt_list:         WDT list that can cause SoC reset.
> >> +                       The list in format: <0>, <2>;
> >> +                       Begins from 0 to 3, as keystone can contain up
> >> +                       to 4 SoC reset watchdogs.
> > 
> > This looks like your binding just describes a subset of the
> > watchdog timer registers. If so, don't do a standalone reset
> 
> The registers are not a subset of watchdog hardware it's SoC specific future
> controlled by SoC specific registers (bootregs and PLL regs).
> 
> For watchog IP setup, the Keystone uses the watchdog driver common with
> other
> SoCs -- davinci_watchdog that is not depend on other SoC settings like
> this driver does.
> 
> The Keystone SoCs have separate registers to tune Keystone2 reset
> functionality
> by configuring Reset multiplexer &  PLL. And it tunes not only watchdog
> usage.
> The keystone SoC can be rebooted in several ways. By external reset pin,
> by soft and
> by watchdogs. This driver allows software reset or reset by one of the
> watchdogs
> (and other settings) independently on watchdog driver settings. This is
> job of reset driver.

It sounds like you use a syscon area in the reset driver. This is not
uncommon, but it means you should probably have a generic node for
the SoC specific registers that contains all of them at once and
exports them as a regmap using the drivers/mfd/syscon.c driver.

	Arnd
