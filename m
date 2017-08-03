Return-Path: <SRS0=+deU=7F=monstr.eu=monstr@kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1500552941.git.michal.simek@xilinx.com>
References: <cover.1500552941.git.michal.simek@xilinx.com>
From: Michal Simek <monstr@monstr.eu>
Date: Thu, 3 Aug 2017 13:31:51 +0200
Message-ID: <CAHTX3dLT4uiW3i=ELw3hGAvr_4fPjB5itfotRX8=pJtAGgbkJA@mail.gmail.com>
Subject: Re: [PATCH 00/10] arm64: zynqmp: dtsi changes
Content-Type: multipart/alternative; boundary="94eb2c0859c81bdfbe0555d7baab"
To: linux-arm <linux-arm-kernel@lists.infradead.org>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Rob Herring <robh+dt@kernel.org>, Stefan Krsmanovic <stefan.krsmanovic@aggios.com>, Catalin Marinas <catalin.marinas@arm.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexander Graf <agraf@suse.de>, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, Duc Dang <dhdang@apm.com>, Moritz Fischer <mdf@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <monstr@monstr.eu>, "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Carlo Caione <carlo@endlessm.com>, LKML <linux-kernel@vger.kernel.org>, Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>, Will Wong <willw@xilinx.com>, Marc Zyngier <marc.zyngier@arm.com>
List-ID: <devicetree@vger.kernel.org>

--94eb2c0859c81bdfbe0555d7baab
Content-Type: text/plain; charset="UTF-8"

Hi,

2017-07-20 14:16 GMT+02:00 Michal Simek <michal.simek@xilinx.com>:

> Hi,
>
> I have cherry-picked all patches from xilinx soc vendor tree which are
> ready for submission.
> This patchset targets only zynqmp.dtsi which is shared with all zynqmp
> families.
>
> Thanks,
> Michal
>
>
> Bharat Kumar Gogada (1):
>   arm64: zynqmp: Adding prefetchable memory space to pcie node
>
> Edgar E. Iglesias (1):
>   arm64: zynqmp: Correct IRQ nr for the SMMU
>
> Michal Simek (5):
>   arm64: zynqmp: Add references to cpu nodes
>   arm64: zynqmp: Add dcc console for zynqmp
>   arm64: zynqmp: Add CCI-400 node
>   arm64: zynqmp: Add support for RTC
>   arm64: zynqmp: Add new uartps compatible string
>
> Naga Sureshkumar Relli (1):
>   arm64: zynqmp: Set status disabled in dtsi
>
> Shubhrajyoti Datta (1):
>   arm64: zynqmp: Add operating points
>
> Stefan Krsmanovic (1):
>   arm64: zynqmp: Add idle state for ZynqMP
>
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 111
> ++++++++++++++++++++++++++++-----
>  1 file changed, 94 insertions(+), 17 deletions(-)
>
>
>
Applied all.

Thanks,
Michal


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform

--94eb2c0859c81bdfbe0555d7baab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">2017-07-20 14:16 GMT+02:00 Michal Simek <span dir=3D"ltr">&lt;<=
a href=3D"mailto:michal.simek@xilinx.com" target=3D"_blank">michal.simek@xi=
linx.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
I have cherry-picked all patches from xilinx soc vendor tree which are<br>
ready for submission.<br>
This patchset targets only zynqmp.dtsi which is shared with all zynqmp<br>
families.<br>
<br>
Thanks,<br>
Michal<br>
<br>
<br>
Bharat Kumar Gogada (1):<br>
=C2=A0 arm64: zynqmp: Adding prefetchable memory space to pcie node<br>
<br>
Edgar E. Iglesias (1):<br>
=C2=A0 arm64: zynqmp: Correct IRQ nr for the SMMU<br>
<br>
Michal Simek (5):<br>
=C2=A0 arm64: zynqmp: Add references to cpu nodes<br>
=C2=A0 arm64: zynqmp: Add dcc console for zynqmp<br>
=C2=A0 arm64: zynqmp: Add CCI-400 node<br>
=C2=A0 arm64: zynqmp: Add support for RTC<br>
=C2=A0 arm64: zynqmp: Add new uartps compatible string<br>
<br>
Naga Sureshkumar Relli (1):<br>
=C2=A0 arm64: zynqmp: Set status disabled in dtsi<br>
<br>
Shubhrajyoti Datta (1):<br>
=C2=A0 arm64: zynqmp: Add operating points<br>
<br>
Stefan Krsmanovic (1):<br>
=C2=A0 arm64: zynqmp: Add idle state for ZynqMP<br>
<br>
=C2=A0arch/arm64/boot/dts/xilinx/<wbr>zynqmp.dtsi | 111 +++++++++++++++++++=
+++++++++--<wbr>---<br>
=C2=A01 file changed, 94 insertions(+), 17 deletions(-)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br><br></font></span></bloc=
kquote><div><br></div><div>Applied all.<br><br></div><div>Thanks,<br></div>=
<div>Michal<br></div><div>=C2=A0<br></div></div><br>-- <br><div class=3D"gm=
ail_signature" data-smartmail=3D"gmail_signature">Michal Simek, Ing. (M.Eng=
), OpenPGP -&gt; KeyID: FE3D1F91<br>w: <a href=3D"http://www.monstr.eu" tar=
get=3D"_blank">www.monstr.eu</a> p: +42-0-721842854<br>Maintainer of Linux =
kernel - Microblaze cpu - <a href=3D"http://www.monstr.eu/fdt/" target=3D"_=
blank">http://www.monstr.eu/fdt/</a><br>Maintainer of Linux kernel - Xilinx=
 Zynq ARM architecture<br>Microblaze U-BOOT custodian and responsible for u=
-boot arm zynq platform</div>
</div></div></div>

--94eb2c0859c81bdfbe0555d7baab--
