From: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH v2] ARM: CSR: Adding CSR SiRFprimaII board support
Date: Fri, 1 Jul 2011 08:04:06 +0800
Message-ID: <BANLkTinkHcuXuWpCxq3tnU_10trPTjDucg@mail.gmail.com>
References: <1309231954-23260-1-git-send-email-bs14@csr.com>
	<201106292329.44447.arnd@arndb.de>
	<BANLkTinfKCMcutMDQ+mpdD4EUy9mCpZs+w@mail.gmail.com>
	<201106301236.25822.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=000325554c4acbf35204a6f6c2cd
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201106301236.25822.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux@arm.linux.org.uk, devicetree-discuss@lists.ozlabs.org, workgroup.linux@csr.com, Grant Likely <grant.likely@secretlab.ca>, weizeng.he@csr.com, Olof Johansson <olof@lixom.net>, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--000325554c4acbf35204a6f6c2cd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2011/6/30 Arnd Bergmann <arnd@arndb.de>:
> On Thursday 30 June 2011, Barry Song wrote:
>
>> > Is this really just one bus with a huge address space, or rather some
>> > nested buses? I'd prefer to have the device tree representation as
>> > close as possible to the actual layout.
>>
>> there are two AXI buses in prima2. AXI-1 connect to memory, AXI-2 is
>> transferred to CSR self-defined IOBUS by CPUIF, then 1 intterupt
>> controller and 9 IO bridges are connected to the IOBUS .
>> The 9 IO bridges are SYSIOBG, PERIIOBG,CPURTCIOBG, UUSIOBG, GRAPHIOBG,
>> MEDIAIOBG, DSPIOBG, DISPIOBG, MEMIOBG. Every iobrg connect to a group
>> of controllers.
>> For example, DISPIOBG connect to VPP and LCD, SYSIOBG connect to CLKC,
>> RSTC, RSC and CPHIFBG, DSPIOBG connect to DSPIF, GPS and DSP.
>> PERIIOBG connect to TIMER, NAND, AUDIO, UART0, UART1, UART2, USP0,
>> USP1, USP2, SPI0, I2C0, I2C1, GPIO, *SYS2PCI* and so on. Then
>> *SYS2PCI* connect to SD.
>>
>> The indendation descible the device hierarchy
>> AXI-1
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Memory
>> AXI-2
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt controller
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IOBG...
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xxxx
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IOBG...
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xxxx
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IOBG...
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xxxx
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IOBG...
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xxxx
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IOBG...
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xxxx
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IOBG...
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYS2PCI
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SD
>>
>> i have get the IC guy Weizeng involved, maybe he can explain better than=
 me :-)
>
> I think it would be good to represent the IOBG devices in the device tree=
 then.
> You don't need to represent AXI-1 because memory is special anyway, and I=
 would
> not bother to list SYS2PCI if the intention of that block was to hide the=
 fact
> that it's PCI behind it. Properly instantiating it as a PCI bridge would =
be
> a lot of work that is probably not worth it.
>
> My usual plea to hardware developers: Please make the registers
> autodiscoverable from software! On an AMBA bus, please use the PrimeCell
> register layout. If you always have an IOBG device behind, they should
> all have the same identifier for that kind of bus bridge.
>
> For the IOBG, it would be ideal to have a similar way of finding and
> configuring the connected hardware, including:
>
> * unique identifier for each distinct IP block
> * revision of that block
> * MMIO ranges and sizes, relative to the bus
> * interrupt numbers, relative to a local interrupt controller
> * location identifier (like PCI bus/device/fn number) that can be
> =C2=A0referred to by other devices
> * clock management for that device
> * power management for that device
>
> If your IODB infrastructure already has this, you should create a new
> bus-type for this in Linux, which will let you detect all devices
> in a consistent manner without having to list them in the device tree.
>
>> > I think the namespace for the compatible values is supposed to start w=
ith
>> > the stock ticker name of the company making the device as a unique
>> > identifier. This means you'd have to use
>> > "csrxf,sirf-intc", "csrxf,sirf-prima2-intc" as the value, instead
>> > of starting with the product name. I don't know exactly how strictly
>> > we apply that rule, but I've taken the devicetree-discuss@lists.ozlabs=
.org
>> > mailing list on Cc, maybe someone can clarify.
>>
>> in fact, SiRF is a company name. it was merged into CSR 4 years ago.
>> Due to history reason, now the SoC names are still headed by sirf.
>> the logo in SiRFprimaII chip is CSR.
>> So the "SiRF" of SiRFprimaII should mean two things: old company name,
>> =C2=A0heritable CPU production-line. Anyway, "csr, sirf-intc" seems to m=
ake
>> more senses than "sirf, intc".
>>
>> could we change "csrxf,sirf-intc", "csrxf,sirf-prima2-intc" to
>> "csr,sirf-intc", "csr,sirf-prima2-intc"?
>
> Not sure how strict we interpret the rules about stock ticker symbols.
> 'CSR' on wallstreet is 'China Security & Surveillance Tech. Inc'. If they
> ever decide to produce embedded Linux machines, we'd get a conflict, unle=
ss
> they also use "csst" (their .com domain name) as a prefix.

Hi Arnd,

ha-ha.

except Wall St and stock, i really didn't realize CSR is something
related with 'China Security & Surveillance Tech. Inc' . it seems CSR
is much more extensively known as a company in Wireless Technology,
Audio, Connectivity and GPS.
if we lost this name, people might not know it came from *that* CSR
focusing on Wireless/Audio/Connectivity/GPS. people will ask, what is
CSRXF? if we really use stock sticker symbols, CSR.L is the more
normal symbol in UK market. if we move to stock sticker symbol, could
we use CSR.L?

if 'China Security & Surveillance Tech. Inc' begin to move to Linux,
it seems CSST make more senses to them than CSR too :-)  as we check
the attached logo of 'China Security & Surveillance Tech. Inc' , CSST
is the abbreviation of the name of this China Company.

-barry

>
>> > better put these in a list with one file per line, like
>> >
>> > obj-y =C2=A0 +=3D timer.o
>> > obj-y =C2=A0 +=3D irq.o
>> >
>> > That makes the list more consistent when you add conditional files.
>>
>> Then it could be:
>> obj-y +=3D timer.o
>> obj-y +=3D irq.o
>> obj-y +=3D clock.o
>> obj-y +=3D common.o
>> obj-$(CONFIG_CACHE_L2X0) :=3D l2x0.o
>
>
> Right. Note that you have a :=3D in there, which needs to be +=3D.
>
>
>> > It probably makes sense to pick a new name for the combined file, too,=
 but I
>> > can't think of a good one. Maybe one of platform.c, prima2.c or core.c=
.
>>
>> i am not sure the original purpose of board_dt.c. and i am guessing
>> whether Grant created that single board file to contain multiple
>> boards. For example:
>>
>> MACHINE_START(PRIMA2_XXX, "prima2xxx")
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.boot_params =C2=A0 =C2=A0=3D SIRFSOC_SDRAM_P=
A + 0x100,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.init_early =C2=A0 =C2=A0 =3D sirfsoc_init_cl=
k,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.map_io =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D sirfs=
oc_map_io,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.init_irq =C2=A0 =C2=A0 =C2=A0 =3D sirfsoc_of=
_init_irq,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.timer =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =
&sirfsoc_timer,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.init_machine =C2=A0 =3D sirfsoc_mach_init,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.dt_compat =C2=A0 =C2=A0 =C2=A0=3D prima2xxx_=
dt_match,
>> MACHINE_END
>>
>> MACHINE_START(PRIMA2_YYY, "prima2yyy")
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.boot_params =C2=A0 =C2=A0=3D SIRFSOC_SDRAM_P=
A + 0x100,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.init_early =C2=A0 =C2=A0 =3D sirfsoc_init_cl=
k,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.map_io =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D sirfs=
oc_map_io,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.init_irq =C2=A0 =C2=A0 =C2=A0 =3D sirfsoc_of=
_init_irq,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.timer =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =
&sirfsoc_timer,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.init_machine =C2=A0 =3D sirfsoc_mach_init,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.dt_compat =C2=A0 =C2=A0 =C2=A0=3D prima2yyy_=
dt_match,
>> MACHINE_END
>
> No, this wouldn't make any sense when the only difference is the dt_compa=
t
> field: At that point you would just list all the possible boards in the
> global dt_match table.
>
>> after creating a new file named mach-prima2/l2x0.c, =C2=A0it seems we on=
ly
>> need to change Makefile to:
>> obj-$(CONFIG_CACHE_L2X0) :=3D l2x0.o
>> the head file is not needed.
>>
>> Currently, rob's OF-based L2 cache is not merged yet. then i only
>> write the following:
>>
>> static int __init sirfsoc_of_l2x_init(void)
>> {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_node *np;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 void __iomem *sirfsoc_l2x_base;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 np =3D of_find_matching_node(NULL, l2x_ids);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!np)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic("unable to=
 find compatible intc node in dtb\n");
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 sirfsoc_l2x_base =3D of_iomap(np, 0);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!sirfsoc_l2x_base)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic("unable to=
 map l2x cpu registers\n");
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 of_node_put(np);
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(readl_relaxed(sirfsoc_l2x_base + L2X0_=
CTRL) & 1)) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* set the =
physical memory windows L2 cache will cover
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 writel_relaxed(P=
LAT_PHYS_OFFSET + 1024 * 1024 * 1024,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 sirfsoc_l2x_base + L2X0_ADDR_FILTERING_END);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 writel_relaxed(P=
LAT_PHYS_OFFSET | 0x1,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 sirfsoc_l2x_base + L2X0_ADDR_FILTERING_START);
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 writel_relaxed(0=
,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 sirfsoc_l2x_base + L2X0_TAG_LATENCY_CTRL);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 writel_relaxed(0=
,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 sirfsoc_l2x_base + L2X0_DATA_LATENCY_CTRL);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 l2x0_init((void __iomem *)sirfsoc_l2x_base, =
0x00040000,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00000000);
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>> }
>> early_initcall(sirfsoc_of_l2x_init);
>>
>> After Rob's patch is merged, i think sirfsoc_of_l2x_init can be much sim=
pler.
>>
> Yes. Rob/Olof, what's the status of that patch?
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Arnd

--000325554c4acbf35204a6f6c2cd
Content-Type: image/png; name="CSST.PNG"
Content-Disposition: attachment; filename="CSST.PNG"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gpkdmsd90

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
Q5ujDmYdxSMYzPpNbfZLCbnlMXmUTnuBdnpqCkgbb/TmCIQ9mv1EwyWNQ8z92uJ4izxKG8X5r3+B
3qWFNjhjMAdiVPQfqugfruo/WDEQBAx0rmSymW0YXHrlNbvyqysHDnIAtoW8ARZJU2+/P+EPZ5x9
7opNOxav3bw4NiFqy66T/nryX08+NSph58KY+HlRcYvWJd589/18bUkVPep0LdiWzNP1GeUffTPz
+lvvvPWeB+5+6PH7HnvqjgceveWe+2+4/a5X3/80q6GXY6YvXi0c7gtm1vfx9JZ7HoxIzIjaXbhm
f9mSxKwVu/KWJ+XMj98/Z+PeuRv3LopPfuCZVzksNrVqG+31xc7nPp3J05l7ul6dFvur4377ZUL9
+CX7xi/Zc8KJJ59y3mVfbyqdHJ01aU3G5NUpM7ZWyV0Ycj0zNpede/kNJ/zpJNbomRddNW1dxuzE
0h82Zs/akv/RrDWc7aVPv1u6u2xxUtHi7YVRaY06/2lTqe27mD0zN6YuSMyfFZ86c/2+BVsyz7vs
ahbl9xEJC+L2L0vM3JjVwNtesGnf5vxmwn2Clk159aefe8GfTvrril3Z8QWN67Nr1mVWxWZWRqdX
RadVxmRWruVpVnVUSsnixHSkNpL6u6oHOOern365p9Fx9DHHfL86fltZB+8Kvl1+/S0XXnktuOy6
m8+5WJqsZm/cpa2jIK6omeOvu2OstJe2efa1i0enLMIKTZq3guO/nL8qnLfB/XN++M3Ml8Z/+uqH
n73+8eTXPpr02seT2ZBtHj/54p3Pvznl9DNPO+sc7jGhYKyK3G/C6HUjYdmlvA7I44JFWW3OjFYH
5FH+iBVqdYLkVltKiy29dSCrzc6R2e2uURHp7lUZntXpnpVpjoh05+pMd2SWWKG9OZsPZuO5iZ0p
zZ6gNx7clFvflXWj0sZglCKY9dvyrLe35mbH5PXQdCA3Dyz2M2aNWh4dagOF8BlwGCgGQVsTGY3b
nrX6Lnnna8Ofw8z52zMfvrtiG9GOiVICRX3BsgGZfS7TAB2DLa7BZvdh8BRcdtU1yYUVoVmBtiCT
nSv7eRT87vjjxz7yBDM4a+zD1Y7hctvQ+ZdcfvYFF5UMDJV2e4skkxB8b9IM1mJCQTcqCI2c8xKz
+KqgwY6C+nX7srflVbzx8ST2vDPp243pZbH7chPSS1IqWg15VvG7eIf5Xd6NqaXJtXY8t4Ub9ox9
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
--000325554c4acbf35204a6f6c2cd
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--000325554c4acbf35204a6f6c2cd--
