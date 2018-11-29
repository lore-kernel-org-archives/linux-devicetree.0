Return-Path: <SRS0=gYPT=OI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400108.outbound.protection.outlook.com ([40.107.140.108]:23191
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728162AbeK3Ag7 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 29 Nov 2018 19:36:59 -0500
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 7/7] ARM: dts: r8a7744: Add SMP support
Date: Thu, 29 Nov 2018 13:31:30 +0000
Message-ID: <OSBPR01MB2103D3B1E59714EFC8A71E29B8D20@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1542878075-61314-1-git-send-email-biju.das@bp.renesas.com>
 <1542878075-61314-8-git-send-email-biju.das@bp.renesas.com>
 <20181129124915.almc5pimbglpyzcy@verge.net.au>
In-Reply-To: <20181129124915.almc5pimbglpyzcy@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

Thanks for the feedback.

> -----Original Message-----
> From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-
> owner@vger.kernel.org> On Behalf Of Simon Horman
> Sent: 29 November 2018 12:49
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; Magnus Damm <magnus.damm@gmail.com>;
> linux-renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; Geert
> Uytterhoeven <geert+renesas@glider.be>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>
> Subject: Re: [PATCH 7/7] ARM: dts: r8a7744: Add SMP support
>
> On Thu, Nov 22, 2018 at 09:14:35AM +0000, Biju Das wrote:
> > Add DT node for the Advanced Power Management Unit (APMU), add the
> > second CPU core, and use "renesas,apmu" as "enable-method".
> >
> > Also add cpu1 phandle node to the PMU interrupt-affinity property.
>
> Hi Biju,
>
> Could you comment on how well this has been tested with respect to CPU
> hotplug and suspend to RAM?

Please find the snippet from test script. It will details the tests related=
 to CPU hot plug and STR.

 For cpu hotplug
-----------------
SCRIPTS_DIRECTORY=3D"$(cd "$(dirname "$0")"; pwd)"
source "${SCRIPTS_DIRECTORY}"/identity.sh
PROCESSORS=3D$(cat /test-data/apmu_t_001-rzg1${RZG1_VARIANT}.txt | grep -c =
^processor)

for CURRENT_PROCESSOR in $(seq ${PROCESSORS}); do
echo "*** Testing CPU hotplug for processor ${CURRENT_PROCESSOR} ***"

echo 0 > /sys/devices/system/cpu/cpu$((CURRENT_PROCESSOR - 1))/online
CURRENT_PROCESSORS=3D$(cat /proc/cpuinfo | grep -c ^processor)
if [ ${CURRENT_PROCESSORS} -eq ${PROCESSORS} ]; then
echo "FAILED: Can't take processor ${CURRENT_PROCESSOR} offline"
exit 1
fi
echo 1 > /sys/devices/system/cpu/cpu$((CURRENT_PROCESSOR - 1))/online
CURRENT_PROCESSORS=3D$(cat /proc/cpuinfo | grep -c ^processor)
if [ ${CURRENT_PROCESSORS} -ne ${PROCESSORS} ]; then
echo "FAILED: Can't take processor ${CURRENT_PROCESSOR} online"
exit 1
fi
done

For STR
---------

PROCESSORS=3D$(cat /test-data/apmu_t_001-rzg1${RZG1_VARIANT}.txt | grep -c =
^processor)
PROCESSORS_COMBINATIONS=3D$(power_of_two ${PROCESSORS})
PROCESSORS_COMBINATIONS=3D$((PROCESSORS_COMBINATIONS - 1))

for CURRENT_PROCESSORS in $(seq ${PROCESSORS_COMBINATIONS}); do
echo "***********************************************************"
echo "* Testing suspend-to-RAM with the following configuration *"
echo "***********************************************************"
enable_all_cpus
disable_cpus ${CURRENT_PROCESSORS}
sleep 1
print_cpus_status
echo
echo

dmesg -c > /dev/null
echo enabled > /sys/class/tty/${DEBUG_CONSOLE}/power/wakeup
echo N       > /sys/module/printk/parameters/console_suspend
echo mem     > /sys/power/state
dmesg | grep -F "Restarting tasks ... done." > /dev/null
if [ $? -ne 0 ]; then
echo "FAILED: Something went wrong either when going to sleep or when wakin=
g up"
exit 1
fi
done

regards,
Biju

> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  arch/arm/boot/dts/r8a7744.dtsi | 28 +++++++++++++++++++++++++++-
> >  1 file changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/r8a7744.dtsi
> > b/arch/arm/boot/dts/r8a7744.dtsi index 046ed94..79e75e7 100644
> > --- a/arch/arm/boot/dts/r8a7744.dtsi
> > +++ b/arch/arm/boot/dts/r8a7744.dtsi
> > @@ -49,6 +49,7 @@
> >  cpus {
> >  #address-cells =3D <1>;
> >  #size-cells =3D <0>;
> > +enable-method =3D "renesas,apmu";
> >
> >  cpu0: cpu@0 {
> >  device_type =3D "cpu";
> > @@ -69,6 +70,25 @@
> >     < 375000 1000000>;
> >  };
> >
> > +cpu1: cpu@1 {
> > +device_type =3D "cpu";
> > +compatible =3D "arm,cortex-a15";
> > +reg =3D <1>;
> > +clock-frequency =3D <1500000000>;
> > +clocks =3D <&cpg CPG_CORE R8A7744_CLK_Z>;
> > +clock-latency =3D <300000>; /* 300 us */
> > +power-domains =3D <&sysc R8A7744_PD_CA15_CPU1>;
> > +next-level-cache =3D <&L2_CA15>;
> > +
> > +/* kHz - uV - OPPs unknown yet */
> > +operating-points =3D <1500000 1000000>,
> > +   <1312500 1000000>,
> > +   <1125000 1000000>,
> > +   < 937500 1000000>,
> > +   < 750000 1000000>,
> > +   < 375000 1000000>;
> > +};
> > +
> >  L2_CA15: cache-controller-0 {
> >  compatible =3D "cache";
> >  cache-unified;
> > @@ -96,7 +116,7 @@
> >  compatible =3D "arm,cortex-a15-pmu";
> >  interrupts-extended =3D <&gic GIC_SPI 72
> IRQ_TYPE_LEVEL_HIGH>,
> >        <&gic GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > -interrupt-affinity =3D <&cpu0>;
> > +interrupt-affinity =3D <&cpu0>, <&cpu1>;
> >  };
> >
> >  /* External SCIF clock */
> > @@ -250,6 +270,12 @@
> >  #reset-cells =3D <1>;
> >  };
> >
> > +apmu@e6152000 {
> > +compatible =3D "renesas,r8a7744-apmu",
> "renesas,apmu";
> > +reg =3D <0 0xe6152000 0 0x188>;
> > +cpus =3D <&cpu0 &cpu1>;
> > +};
> > +
> >  rst: reset-controller@e6160000 {
> >  compatible =3D "renesas,r8a7744-rst";
> >  reg =3D <0 0xe6160000 0 0x100>;
> > --
> > 2.7.4
> >



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
