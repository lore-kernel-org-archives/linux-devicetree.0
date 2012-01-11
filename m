From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: Initial DT clock bindings
Date: Wed, 11 Jan 2012 15:57:20 -0800
Message-ID: <CAPnjgZ2siCQq45ug-_HC3RtgULSZVreVL-LWjgHsQ0Ak9qE9Bw@mail.gmail.com>
References: <1323727236-4811-1-git-send-email-grant.likely@secretlab.ca>
 <4EE6859F.2040807@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4EE6859F.2040807-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Mon, Dec 12, 2011 at 2:52 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 12/12/2011 04:00 PM, Grant Likely wrote:
>> Hi everyone,
>>
>> Here's my second posting of initial device tree bindings for clocks. =A0=
I'm
>> a lot happier with how this is looking now, and Versatile is pretty much
>> entirely converted. =A0In fact, the realview, integrator and vexpress pl=
atforms
>> are pretty close now too. =A0Just for fun I went and converted Highbank =
also.
>
> Thanks! I'll give it a spin.
>
>> There is still stuff to clean up, and I want to add test cases for the n=
ew
>> clock framework, but otherwise I think it is pretty complete. =A0There a=
re
>> some changes to the binding documentation that you'll want to pay attent=
ion
>> to.
>>
>> This series is based on v3.2-rc5 plus the of_parse_phandle_args() patches
>> that I posted a couple of hours ago.
>>
> Where? I'm not seeing them on devicetree-discuss.
>
> Can you publish this series on your git tree?
>
> Rob

I am trying to find this series - I cannot see it on the mailing list.
Can you please repost it or provide a pointer?

Thanks,
Simon

>
>>
>> =A0.../devicetree/bindings/clock/clock-bindings.txt =A0 | =A0114 +++++++=
++++
>> =A0.../devicetree/bindings/clock/fixed-clock.txt =A0 =A0 =A0| =A0 21 ++
>> =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 | =A0 =A01 +
>> =A0arch/arm/boot/dts/highbank.dts =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 32 +++-
>> =A0arch/arm/boot/dts/testcases/tests-phandle.dtsi =A0 =A0 | =A0 =A02 +
>> =A0arch/arm/boot/dts/versatile-ab.dts =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 79 ++++++++
>> =A0arch/arm/common/timer-sp.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 72 ++++++-
>> =A0arch/arm/include/asm/hardware/timer-sp.h =A0 =A0 =A0 =A0 =A0 | =A0 =
=A02 +
>> =A0arch/arm/mach-highbank/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 19 --
>> =A0arch/arm/mach-highbank/core.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 =A01 -
>> =A0arch/arm/mach-highbank/highbank.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 13 +-
>> =A0arch/arm/mach-highbank/include/mach/clkdev.h =A0 =A0 =A0 | =A0 11 +
>> =A0arch/arm/mach-integrator/impd1.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 30 +---
>> =A0arch/arm/mach-integrator/include/mach/clkdev.h =A0 =A0 | =A0 19 --
>> =A0arch/arm/mach-integrator/integrator_cp.c =A0 =A0 =A0 =A0 =A0 | =A0 21=
 +--
>> =A0arch/arm/mach-realview/core.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 22 +--
>> =A0arch/arm/mach-realview/include/mach/clkdev.h =A0 =A0 =A0 | =A0 10 -
>> =A0arch/arm/mach-versatile/core.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 61 +------
>> =A0arch/arm/mach-versatile/include/mach/clkdev.h =A0 =A0 =A0| =A0 10 -
>> =A0arch/arm/mach-versatile/versatile_dt.c =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
39 ++++-
>> =A0arch/arm/mach-vexpress/include/mach/clkdev.h =A0 =A0 =A0 | =A0 =A09 -
>> =A0arch/arm/mach-zynq/include/mach/clkdev.h =A0 =A0 =A0 =A0 =A0 | =A0 10=
 -
>> =A0arch/arm/plat-versatile/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0151 ++++++++++++++
>> =A0arch/arm/plat-versatile/include/plat/clock.h =A0 =A0 =A0 | =A0 34 ++++
>> =A0drivers/clk/clkdev.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 | =A0 =A09 +
>> =A0drivers/of/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 | =A0 =A06 +
>> =A0drivers/of/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0| =A0 =A01 +
>> =A0drivers/of/base.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0| =A0 36 ++++
>> =A0drivers/of/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 | =A0208 ++++++++++++++++++++
>> =A0drivers/of/selftest.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| =A0 29 +++
>> =A0include/linux/of.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 | =A0 =A03 +
>> =A0include/linux/of_clk.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 | =A0 41 ++++
>> =A032 files changed, 893 insertions(+), 223 deletions(-)
>>
>> _______________________________________________
>> devicetree-discuss mailing list
>> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
