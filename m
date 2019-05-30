From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] arm: dts: vexpress-v2p-ca15_a7: disable NOR flash node
 by default
Date: Thu, 30 May 2019 12:01:45 +0100
Message-ID: <20190530110145.GA20028@e107155-lin>
References: <20190530091139.11643-1-sudeep.holla@arm.com>
 <CACRpkdZZkfRPTH1h1EOC=YWt7tdqbOp3hpfFou8thsUf8_EqSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZZkfRPTH1h1EOC=YWt7tdqbOp3hpfFou8thsUf8_EqSA@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 30, 2019 at 12:50:12PM +0200, Linus Walleij wrote:
> On Thu, May 30, 2019 at 11:11 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> 
> > Accessing the NOR flash memory from the kernel will disrupt CPU sleep/
> > idles states and CPU hotplugging. We need to disable this DT node by
> > default. Setups that want to access the flash can modify this entry to
> > enable the flash again but also ensuring to disable CPU idle states and
> > CPU hotplug.
> >
> > The platform firmware assumes the flash is always in read mode while
> > Linux kernel driver leaves NOR flash in "read id" mode after
> > initialization. If it gets used actively, it can be in some other state.
> >
> > So far we had not seen this issue as the NOR flash drivers in kernel
> > were not enabled by default. However it was enable in multi_v7 config by
> > Commit 5f068190cc10 ("ARM: multi_v7_defconfig: Enable support for CFI NOR FLASH")
> >
> > So, let's mark the NOR flash disabled so that the platform can boot
> > again. This based on:
> > Commit 980bbff018f6 ("ARM64: juno: disable NOR flash node by default")
> >
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>

Thanks.

> It's a bit sad that this cannot be easily fixed (I don't know if it can even
> be fixed with firmware updates?), it's kind of useful to be able to
> update the flash from within Linux, as that mimics what pretty much
> every IoT device (such as routers) is doing and would be nince for
> an OpenWrt port.
>

IMO, it issue with partitioning of the system. Basically these traditional
NOR flash don't support partitions at hardware level so that one accessed
by firmware/secure side is protected from another accessed from non-secure.

I like the eMMC boot partitions in that ways as these are hardware
partitions and the device state is separate for these.

Also, ideally firmware/secure side should just restrict themselves to
Secure ROM, but as a record we consistently ensure firmware on SROM is
busted and use non-secure ROM/NOR Flash as bypass :) which then makes
it tricky to deal with such scenarios in Linux. Hope we fill have some
system with everything working *one day* :D

--
Regards,
Sudeep
