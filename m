From: Jason Liu <liu.h.jason@gmail.com>
Subject: Re: [PATCH 0/8] Basic ARM device tree support
Date: Fri, 28 Jan 2011 14:37:15 +0800
Message-ID: <AANLkTiktL9LzHTHv06Cx27CjvMiGCo6kN_HaDBiajr6n@mail.gmail.com>
References: <20110118195933.13011.56098.stgit@localhost6.localdomain6>
	<00bcd596-2108-4c54-92d3-7fda39e333e3@VA3EHSMHS015.ehs.local>
	<4D40A116.6040209@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4D40A116.6040209@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: John Linn <John.Linn@xilinx.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Lennert Buijtenhek <buytenh@wantstofly.org>, Olof Johansson <olof@lixom.net>, Jeremy Kerr <jeremy.kerr@canonical.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi, Rob,

2011/1/27 Rob Herring <robherring2@gmail.com>:
> On 01/26/2011 02:04 PM, John Linn wrote:
>>>
>>> -----Original Message-----
>>> From: Grant Likely [mailto:glikely@secretlab.ca] On Behalf Of Grant
>>> Likely
>>> Sent: Tuesday, January 18, 2011 1:29 PM
>>> To: linux-arm-kernel@lists.infradead.org
>>> Cc: Nicolas Pitre; Russell King; Catalin Marinas;
>>> devicetree-discuss@lists.ozlabs.org; linux-
>>> kernel@vger.kernel.org; Olof Johansson; Jeremy Kerr; John Linn; Len=
nert
>>> Buijtenhek
>>> Subject: [PATCH 0/8] Basic ARM device tree support
>>>
>>> It's been a while since these patches have been circulated for revi=
ew.
>>> Much has changed since the last posting and there are no longer any
>>> ugly hacks or workarounds to it working. =A0From my viewpoint, thes=
e
>>> patches are complete and ready to be used.
>>>
>>> This patch series allows CONFIG_OF to be enabled on ARM and allows =
the
>>> kernel to accept a dtb pointer from boot firmware instead of atags.
>>> If a dtb is passed, then the kernel will use the root 'compatible'
>>> property to find a matching machine_desc, and it will use it to obt=
ain
>>> the memory layout, initrd location and kernel parameters string.
>>>
>>> Only limited device tree support is enabled here. =A0It does not pe=
rform
>>> any kind of device registration from device tree data. =A0That supp=
ort
>>> will be enabled in a later patch set. =A0Right now those patches de=
pend
>>> on the common struct clk patches that Jeremy is working on, so I'm =
not
>>> going to post them yet. =A0Rather, this series is a stable base tha=
t
>>> other engineers can use to start working on device tree support for
>>> their platforms.
>>>
>>> Tested on Versatile (qemu) and nVidia Tegra Harmony. =A0Kernel comp=
iles
>>> an boot with CONFIG_OF both on and off, both with and without passi=
ng
>>> a device tree blob.
>>
>> Tested on Xilinx platform. =A0Did see an issue with loading the devi=
ce
>> tree blob into higher memory. =A0At address 0 there was no issue.
>>
>
> I have a fix for this. The issue is the early mmu page table needs to=
 map
> the dtb. I later realized this is also may be problem for ATAGs as we=
ll, so
> I planned to re-work to make it unconditional and work for ATAGs. Or =
perhaps
> ATAGs only get accessed with the MMU on later than the dtb and everyt=
hing is
> okay?
>
> This applies to the DT patch set prior to the one Grant sent out
> this week, so it may need updates.
>
> From: Rob Herring <rob.herring@calxeda.com>
> Date: Tue, 5 Oct 2010 10:32:51 -0500
> Subject: [PATCH] arm/dt: map devtree blob in initial page table
>
> If the DTB is not in 1st 1MB of RAM, it will not be mapped before
> memblock is setup, so map it early. We assume the dtb is less than
> 1MB and map 2MB so it can be at any alignment.
>
> Some assembly optimizations from Nicolas Pitre.
>
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> ---
> =A0arch/arm/kernel/head.S | =A0 13 +++++++++++++
> =A01 files changed, 13 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
> index 0480f25..1fcb962 100644
> --- a/arch/arm/kernel/head.S
> +++ b/arch/arm/kernel/head.S
> @@ -228,6 +228,19 @@ __create_page_tables:
> =A0 =A0 =A0 =A0.endif
> =A0 =A0 =A0 =A0str =A0 =A0 r6, [r0]
>
> +#ifdef CONFIG_OF_FLATTREE
> + =A0 =A0 =A0 /* Make sure DT blob is mapped */
> + =A0 =A0 =A0 adr =A0 =A0 r0, __devtree_pointer
> + =A0 =A0 =A0 ldr =A0 =A0 r0, [r0]
> + =A0 =A0 =A0 mov =A0 =A0 r0, r0, lsr #20
> + =A0 =A0 =A0 mov =A0 =A0 r0, r0, lsl #20
> + =A0 =A0 =A0 add =A0 =A0 r3, r0, #PAGE_OFFSET
> + =A0 =A0 =A0 add =A0 =A0 r3, r4, r3, lsr #18
> + =A0 =A0 =A0 orr =A0 =A0 r6, r7, r0
> + =A0 =A0 =A0 str =A0 =A0 r6, [r3]
> + =A0 =A0 =A0 add =A0 =A0 r6, r6, #0x100000
> + =A0 =A0 =A0 str =A0 =A0 r6, [r3, #4]
> +#endif
> =A0#ifdef CONFIG_DEBUG_LL
> =A0#ifndef CONFIG_DEBUG_ICEDCC

Build broken after apply your patch,
arch/arm/kernel/head.S:223: Error: undefined symbol __devtree_pointer
used as an immediate value
make[2]: *** [arch/arm/kernel/head.o] Error 1


BR,
Jason Liu

> =A0 =A0 =A0 =A0/*
> --
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
