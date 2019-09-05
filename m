Return-Path: <SRS0=ZhZM=XA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:20588 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390151AbfIEPDy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Sep 2019 11:03:54 -0400
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 4/6] ARM: dts: Configure sgx for omap5
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190826145530.GT52127@atomide.com>
Date: Thu, 5 Sep 2019 17:03:28 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <4BC961D4-1D6E-457B-944A-7137414BC163@goldelico.com>
References: <20190814131408.57162-1-tony@atomide.com> <20190814131408.57162-5-tony@atomide.com> <20190815182348.8A1BA2063F@mail.kernel.org> <20190817065615.GI52127@atomide.com> <20190826145530.GT52127@atomide.com>
Sender: devicetree-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, devicetree <devicetree@vger.kernel.org>, Adam Ford <aford173@gmail.com>, =?utf-8?Q?Filip_Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, moaz korena <moaz@korena.xyz>, Merlijn Wajer <merlijn@wizzup.org>, =?utf-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, Philipp Rossak <embed3d@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Michael Turquette <mturquette@baylibre.com>, Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
List-ID: <devicetree@vger.kernel.org>

Hi Tony,
I found some time to update my drivers/stating/pvr/1.14.369993 tree to =
make
use of the new sgx soc integration code and it works on omap5!

> root@letux:~# modprobe pvrsrvkm_omap_omap5_sgx544_116
> [  106.478254] pvrsrvkm_omap_omap5_sgx544_116: module is from the =
staging directory, the quality is unknown, you have been warned.
> [  106.526201] [drm] Initialized pvr 1.14.3699939 20110701 for =
5600fe00.sgx on minor 1
> root@letux:~# pvrsrvctl --no-module --start
> [  261.091978] PVR_K: UM DDK-(3699939) and KM DDK-(3699939) match. [ =
OK ]
> root@letux:~# gles1test1 0
> ^C
> root@letux:~#=20


To make it work, I have added a child node to the target-module@56000000
that describes the img,sgx5xx. Here are the work-in-progress patches if
you want to take a look inside:

	=
https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/commits/letux/omap=
-pvr-soc-glue-v2

On omap3630 the driver module loads but pvrsrvinit fails:

> root@letux:~# modprobe pvrsrvkm_omap_omap3630_sgx530_125
> [  390.429260] pvrsrvkm_omap_omap3630_sgx530_125: module is from the =
staging directory, the quality is unknown, you have been warned.
> [  390.474304] [drm] Initialized pvr 1.14.3699939 20110701 for =
50000000.sgx on minor 1
> root@letux:~# pvrsrvctl --start --no-module
> [  402.200439] PVR_K: UM DDK-(3699939) and KM DDK-(3699939) match. [ =
OK ]
> [  402.219604] PVR_K:(Error): BridgedDispatchKM: Initialisation =
failed.  Driver unusable.
> PVR:(Error): LoaduKernelProgram : SGX ukernel program Device Addr: =
0xe400000 invalid alignment [0, ]
> PVR:(Error): SetupuKernel : Failed to load uKernel programs [0, ]
> PVR:(Error): SrvInit: Initialisation for device of class 0, type 7, =
index 0, failed (1) [0, ]
> PVR:(Error): PVRSRVBridgeCall: Failed to access device.  Function =
ID:3223086862 (strerror returns no value.). [0, ]
> pvrsrvctl: SrvInit failed (already initialized?) =
(err=3DPVRSRV_ERROR_OUT_OF_MEMORY - Unable to allocate required memory)
> root@letux:~#=20

Maybe I do not have done the address range translation properly. Or I am =
missing
some of your PRM rstctrl patches since I am working on top of =
linus/master.
Because of that I had to comment out prm_gfx in am33xx.dtsi to get it =
compile and could
not test yet on Beagle Bone.

A little unclear is how to properly handle omap4. omap4430/4440 and 4460 =
have the sgx540
while only omap4470 has an sgx544 inside. But omap4420/30 share one =
.dtsi and omap4460/70
the other. So we might have to define a new omap4470.dtsi and #include =
in the real omap4470
boards.

And am3517 and am43/am57/am65/... support is missing. But that can be =
added later if we
have it running on omap3 and am33xx.

Anyways, we again have made a big step forwards. Let's hope that we can =
get
the FLOSS part of the sgx drivers to staging in some not too far future.

BR and thanks,
Nikolaus


> Am 26.08.2019 um 16:55 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * Tony Lindgren <tony@atomide.com> [190817 06:56]:
>> * Stephen Boyd <sboyd@kernel.org> [190815 18:24]:
>>> Quoting Tony Lindgren (2019-08-14 06:14:06)
>>>> diff --git a/arch/arm/boot/dts/omap54xx-clocks.dtsi =
b/arch/arm/boot/dts/omap54xx-clocks.dtsi
>>>> --- a/arch/arm/boot/dts/omap54xx-clocks.dtsi
>>>> +++ b/arch/arm/boot/dts/omap54xx-clocks.dtsi
>>>> @@ -1146,6 +1146,20 @@
>>>>                };
>>>>        };
>>>>=20
>>>> +       gpu_cm: gpu_cm@1500 {
>>>=20
>>> Node names shouldn't have underscores. Maybe clock-controller?
>>=20
>> OK yeah clock-controller sounds good to me.
>=20
> Below is this one updated to use clock-controller naming.
>=20
> Regards,
>=20
> Tony
>=20
> 8< ---------------------------
> =46rom tony Mon Sep 17 00:00:00 2001
> From: Tony Lindgren <tony@atomide.com>
> Date: Wed, 14 Aug 2019 05:18:16 -0700
> Subject: [PATCH] ARM: dts: Configure sgx for omap5
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> I've tested that the interconnect target module enables and idles
> just fine when probed with ti-sysc with PM runtime control via sys:
>=20
> # echo on > $(find /sys -name control | grep \/5600)
> # rwmem 0x5600fe00	# OCP Revision
> 0x5600fe00 =3D 0x40000000
> # echo auto > $(find /sys -name control | grep \/5600)
> # rwmem 0x5600fe10
> # rwmem 0x56000024
>=20
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Filip Matijevi=C4=87 <filip.matijevic.pz@gmail.com>
> Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
> Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> Cc: moaz korena <moaz@korena.xyz>
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
> Cc: Philipp Rossak <embed3d@gmail.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
> arch/arm/boot/dts/omap5.dtsi           | 23 +++++++++++++++++++++++
> arch/arm/boot/dts/omap54xx-clocks.dtsi | 14 ++++++++++++++
> 2 files changed, 37 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/omap5.dtsi =
b/arch/arm/boot/dts/omap5.dtsi
> --- a/arch/arm/boot/dts/omap5.dtsi
> +++ b/arch/arm/boot/dts/omap5.dtsi
> @@ -257,6 +257,29 @@
> 			ports-implemented =3D <0x1>;
> 		};
>=20
> +		target-module@56000000 {
> +			compatible =3D "ti,sysc-omap4", "ti,sysc";
> +			reg =3D <0x5600fe00 0x4>,
> +			      <0x5600fe10 0x4>;
> +			reg-names =3D "rev", "sysc";
> +			ti,sysc-midle =3D <SYSC_IDLE_FORCE>,
> +					<SYSC_IDLE_NO>,
> +					<SYSC_IDLE_SMART>;
> +			ti,sysc-sidle =3D <SYSC_IDLE_FORCE>,
> +					<SYSC_IDLE_NO>,
> +					<SYSC_IDLE_SMART>;
> +			clocks =3D <&gpu_clkctrl OMAP5_GPU_CLKCTRL 0>;
> +			clock-names =3D "fck";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			ranges =3D <0 0x56000000 0x2000000>;
> +
> +			/*
> +			 * Closed source PowerVR driver, no child device
> +			 * binding or driver in mainline
> +			 */
> +		};
> +
> 		dss: dss@58000000 {
> 			compatible =3D "ti,omap5-dss";
> 			reg =3D <0x58000000 0x80>;
> diff --git a/arch/arm/boot/dts/omap54xx-clocks.dtsi =
b/arch/arm/boot/dts/omap54xx-clocks.dtsi
> --- a/arch/arm/boot/dts/omap54xx-clocks.dtsi
> +++ b/arch/arm/boot/dts/omap54xx-clocks.dtsi
> @@ -1146,6 +1146,20 @@
> 		};
> 	};
>=20
> +	gpu_cm: clock-controller@1500 {
> +		compatible =3D "ti,omap4-cm";
> +		reg =3D <0x1500 0x100>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges =3D <0 0x1500 0x100>;
> +
> +		gpu_clkctrl: clk@20 {
> +			compatible =3D "ti,clkctrl";
> +			reg =3D <0x20 0x4>;
> +			#clock-cells =3D <2>;
> +		};
> +	};
> +
> 	l3init_cm: l3init_cm@1600 {
> 		compatible =3D "ti,omap4-cm";
> 		reg =3D <0x1600 0x100>;
> --=20
> 2.23.0
