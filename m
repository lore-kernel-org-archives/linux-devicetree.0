From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v10 2/7] ARM: hi3xxx: add board support with device tree
Date: Wed, 16 Oct 2013 09:27:27 +0200
Message-ID: <201310160927.27412.arnd@arndb.de>
References: <1381828577-27998-1-git-send-email-haojian.zhuang@linaro.org>
 <CAD6h2NRvCdfNef_q=6JyNvv2ZsObmwmh=wgcKu=j6RokE3-sFg@mail.gmail.com>
 <CAD6h2NQ4fT7ycmxh+iLiBx4+u6+QB-H98309cRJLtRO3LGCbJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAD6h2NQ4fT7ycmxh+iLiBx4+u6+QB-H98309cRJLtRO3LGCbJg@mail.gmail.com>
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

On Wednesday 16 October 2013, Haojian Zhuang wrote:
> Oh, no. I shouldn't extend the static mapping table to the entire range.
> 
> Most of the registers only need to map once in the probe() function
> of the driver. Whether it's using static mapping or dynamic mapping,
> there's no difference.

There is a small difference in that having a megabyte-sized mapping will
reduce the number of TLB entries required for I/O access, which can
improve performance slightly. Other platforms do it for this reason.

>  The sysctrl register bank is used in both clock & platform
> driver. Each clock node contains reg property, it needs to be parsed
> by of_iomap(). Hotplug & SMP platform driver needs to parse sysctrl
> register bank also. If I don't choose the static IO mapping for sysctrl
> register bank, I have to define some global variable to store the
> virtual address mapping. Or I have to cost lots of redundant virtual
> address space for the same IO mapping.

It's a small cost, but your approach makes sense, just make sure
you have a comment in the map_io code explaining it.

> So I'll only keep the static IO mapping for sysctrl.

I'd still choose the larger mapping, but I'll leave the decision to you.

	Arnd
