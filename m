From: Paul Osmialowski <pawelo@king.net.pl>
Subject: Re: [PATCH 7/9] arm: twr-k70f120m: IOMUX driver for Kinetis SoC
Date: Tue, 8 Sep 2015 10:04:19 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1509080953390.31192@localhost.localdomain>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
 <1435094387-20146-8-git-send-email-pawelo@king.net.pl>
 <CACRpkdYHBt7YJWM3Bg8ENfw7uL4fuENqW+g8YaO+P6UPBCX4HQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdYHBt7YJWM3Bg8ENfw7uL4fuENqW+g8YaO+P6UPBCX4HQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Stefan Agner <stefan@agner.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jiri Slaby <jslaby@suse.cz>, linux-clk@vger.kernel.org, Kees Cook <keescook@chromium.org>, Russell King <linux@arm.linux.org.uk>, Nicolas Pitre <nico@linaro.org>, Magnus Damm <damm+renesas@opensource.se>, Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>, Dave Martin <Dave.Martin@arm.com>, Guenter Roeck <linux@roeck-us.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Paul Osmialowski <pawelo@king.net.pl>, Sascha Hauer <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jingchang Lu <jingchang.lu@freescale.com>, Hao
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Tue, 14 Jul 2015, Linus Walleij wrote:

> OK...
> 
> I want Shawn and Sascha to look at this as they worked with
> other Freescale pin controllers. Especially I want to know if this
> is a sibling to the other Freescale controllers or a separate hardware.
> 
> If it is *not* a sibling I will *insist* that it use more generic pin
> control bindings and move away from the older Freescale-specific
> stuff.

No one answered me about that. However, I looked at other Freescale 
pinctrl drivers and realised that no one of them (IMX, IMX1, MXS) is 
similar to what I need to do for Kinetis, also positions of configuration 
bits differ significantly.

> 
> There exist generic pin config bindings, see
> Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> 
> I suggest to to function+group paring and then use generic pin config
> with this driver unless it is a very close sibling to the existing Freescale
> pin controllers.
> 
> Hint: if it is a sibling, it should share code with them.
> 
> There are several drivers doing generic pin control/pin config in the kernel
> tree.
> 

I tried to analyze few of the drivers (e.g. zynq family) and can't find 
how can I assing clock gate (clock device) to each port (PORTA, PORTB, 
PORTC,...) which is required for Kinetis. Is generic pin control capable 
to express that requirement or is it a time to desing my own pinctrl 
driver (maybe somewhat improved than the one I presented so far)?

This pinctrl component is somwehat critical part of BSP. Until it is not 
sorted, I don't see a point in releasing what was developed so far.

Best regards,
Paul
