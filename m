From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 0/7] ARM: rockchip: add smp functionality
Date: Fri, 31 Jan 2014 16:12:10 -0600
Message-ID: <CAL_JsqKkBnj9w0pMtQOGYvNmAYpwKO4U3hjzoLBiiVab7vBmkw@mail.gmail.com>
References: <4970034.fqvMoHdOyd@phil>
	<13010296.nzTT2PqdSR@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <13010296.nzTT2PqdSR@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 31, 2014 at 4:03 PM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrot=
e:
> On Monday, 20. January 2014 16:41:43 Heiko St=FCbner wrote:
>> This series enables the use of the additional cores on Rockchip
>> Cortex-A9 SoCs.
>
> So, two weeks without any general complaints, but I guess part of the=
 more
> general patches could use an ack.
>
> Going forward, what would be best way to merge them?
> As one pull request to arm-soc, or for example splitting them into th=
e first
> three patches going through the misc tree and the rockchip specific s=
tuff going
> through arm-soc? Or something else altogether?
>
>
>> Heiko Stuebner (7):
>>   of: add functions to count number of elements in a property
>
> One of the intermediate versions of this patch got a
>         Reviewed-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> .
> Mark, is this still true for this variant addressing some additional =
wished
> from Rob?
>
> And this final version got a "Looks good" from Rob Herring in the ori=
ginal
> thread, but a more formal "ack" might be nice :-) .

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Rob

>
>
>>   dt-bindings: sram: describe option to reserve parts of the memory
>>   misc: sram: implement mmio-sram-reserved option
>
> Philipp, you acked an intermediate version, and this v7 now should al=
so
> contain the two separate loops (1st gathering data and 2nd creating t=
he pool
> parts) you asked for.
>
> Could I persuade you to take a look again?
>
>
> Thanks
> Heiko
>
>
>>   ARM: rockchip: add snoop-control-unit
>>   ARM: rockchip: add sram dt nodes and documentation
>>   ARM: rockchip: add power-management-unit
>>   ARM: rockchip: add smp bringup code
>>
>>  .../devicetree/bindings/arm/rockchip/pmu.txt       |   16 ++
>>  .../devicetree/bindings/arm/rockchip/smp-sram.txt  |   23 +++
>>  Documentation/devicetree/bindings/misc/sram.txt    |    8 +
>>  arch/arm/boot/dts/rk3066a.dtsi                     |    6 +
>>  arch/arm/boot/dts/rk3188.dtsi                      |    6 +
>>  arch/arm/boot/dts/rk3xxx.dtsi                      |   10 +
>>  arch/arm/mach-rockchip/Kconfig                     |    1 +
>>  arch/arm/mach-rockchip/Makefile                    |    1 +
>>  arch/arm/mach-rockchip/core.h                      |   22 +++
>>  arch/arm/mach-rockchip/headsmp.S                   |   30 +++
>>  arch/arm/mach-rockchip/platsmp.c                   |  208
>> ++++++++++++++++++++ arch/arm/mach-rockchip/rockchip.c              =
    |
>>  2 +
>>  drivers/misc/sram.c                                |  121 +++++++++=
++-
>>  drivers/of/base.c                                  |   32 +++
>>  include/linux/of.h                                 |   76 +++++++
>>  15 files changed, 554 insertions(+), 8 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/arm/rockchip/p=
mu.txt
>>  create mode 100644
>> Documentation/devicetree/bindings/arm/rockchip/smp-sram.txt create m=
ode
>> 100644 arch/arm/mach-rockchip/core.h
>>  create mode 100644 arch/arm/mach-rockchip/headsmp.S
>>  create mode 100644 arch/arm/mach-rockchip/platsmp.c
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
