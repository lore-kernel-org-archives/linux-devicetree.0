From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 1/7] arm: dt: zynq: Remove 'clock-ranges' from TTC nodes
Date: Tue, 12 Nov 2013 16:29:53 +0100
Message-ID: <52824971.5060203@linaro.org>
References: <1383945677-29674-1-git-send-email-soren.brinkmann@xilinx.com> <1383945677-29674-2-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1383945677-29674-2-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Soren Brinkmann <soren.brinkmann@xilinx.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Michal Simek <michal.simek@xilinx.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/08/2013 10:21 PM, Soren Brinkmann wrote:
> The bindings for the TTC changed in commit 'arm: zynq: Use standard
> timer binding' (e932900a3279b5dbb6d8f43c7b369003620e137c). That chang=
e
> removed possible subnodes from this driver rendering the 'clock-range=
s'
> property invalid for this node.
>
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> Acked-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

> ---
>   arch/arm/boot/dts/zynq-7000.dtsi | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zyn=
q-7000.dtsi
> index e32b92b949d2..27ebc1ba9671 100644
> --- a/arch/arm/boot/dts/zynq-7000.dtsi
> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> @@ -98,7 +98,6 @@
>   			compatible =3D "cdns,ttc";
>   			clocks =3D <&clkc 6>;
>   			reg =3D <0xF8001000 0x1000>;
> -			clock-ranges;
>   		};
>
>   		ttc1: ttc1@f8002000 {
> @@ -107,7 +106,6 @@
>   			compatible =3D "cdns,ttc";
>   			clocks =3D <&clkc 6>;
>   			reg =3D <0xF8002000 0x1000>;
> -			clock-ranges;
>   		};
>   		scutimer: scutimer@f8f00600 {
>   			interrupt-parent =3D <&intc>;
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
