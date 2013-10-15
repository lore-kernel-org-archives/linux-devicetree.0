From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v10 2/7] ARM: hi3xxx: add board support with device tree
Date: Tue, 15 Oct 2013 20:06:38 +0200
Message-ID: <201310152006.38824.arnd@arndb.de>
References: <1381828577-27998-1-git-send-email-haojian.zhuang@linaro.org>
 <201310151500.36959.arnd@arndb.de>
 <CAD6h2NR6umVpgYM2t2pwrwP8-Jk-e3Kfng-7oymPJ44cNmuk-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAD6h2NR6umVpgYM2t2pwrwP8-Jk-e3Kfng-7oymPJ44cNmuk-w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Shaojie Sun <shaojie.sun@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>, Patch Tracking <patches@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@linaro.org>, John Stultz <john.stultz@linaro.org>, Olof Johansson <olof@lixom.net>, Mike Turquette <mturquette@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 15 October 2013, Haojian Zhuang wrote:
> On 15 October 2013 21:00, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Tuesday 15 October 2013, Haojian Zhuang wrote:
> >>
> >> Add board support with device tree for Hisilicon Hi3620 SoC platform.
> >>
> >> Changelog:
> >> v10:
> >> 1. Add .map_io() & debug_ll_io_init() back. Since debug_ll_io_init() is
> >> only called if .map_io() isn't assigned. Use .map_io() to setup static
> >> IO mapping that is used in clock driver.
> >>
> >
> > This seems like a step in the wrong direction. Why would you want to use
> > a static I/O mapping in the clock driver?
> >
> 
> Because Stephen & Kevin asked me to use unit address in DTS file. They
> also require me to use reg property to present real hardware address
> in DTS file.

Ah, so it's just an optimization, not required to make the clock driver
work, I misread that. Can you add a comment near the hi3620_io_desc
definition and verify that it still works without it?

I would also recommend to extend that static mapping to the entire
0xfc800000-0xfcbfffff range, or whatever you can use to get the most
I/O devices with a small number of TLB entries.

	Arnd
