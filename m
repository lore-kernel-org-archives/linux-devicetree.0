From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/1] MIPS: DTS: cavium-octeon: provide model attribute
Date: Mon, 15 Feb 2016 14:16:48 +0300
Message-ID: <56C1B3A0.4090301@cogentembedded.com>
References: <1455513977-934-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455513977-934-1-git-send-email-xypron.glpk@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello.

On 2/15/2016 8:26 AM, Heinrich Schuchardt wrote:

> Downstream packages like Debian flash-kernel rely on
> /proc/device-tree/model
> to determine how to install an updated kernel image.
>
> Most dts files provide this property.
> It is suggested by IEEE Std 1275-1994.
>
> This patch adds a model attribute for Octeon CPUs.
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
>   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts | 1 +
>   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts | 1 +
>   2 files changed, 2 insertions(+)
>
> diff --git a/arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts b/arch/=
mips/boot/dts/cavium-octeon/octeon_3xxx.dts
> index 9c48e05..a746678 100644
> --- a/arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts
> +++ b/arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts
> @@ -8,6 +8,7 @@
>    */
>   / {
>   	compatible =3D "cavium,octeon-3860";
> +	model =3D "Cavium Octeon 3XXX";
>   	#address-cells =3D <2>;
>   	#size-cells =3D <2>;
>   	interrupt-parent =3D <&ciu>;
> diff --git a/arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts b/arch/=
mips/boot/dts/cavium-octeon/octeon_68xx.dts
> index 79b46fc..c8a292a 100644
> --- a/arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts
> +++ b/arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts
> @@ -8,6 +8,7 @@
>    */
>   / {
>   	compatible =3D "cavium,octeon-6880";
> +	model =3D "Cavium Octeon 68XX";
>   	#address-cells =3D <2>;
>   	#size-cells =3D <2>;
>   	interrupt-parent =3D <&ciu2>;

     The ePAPR 1.1 standard says:

2.3.2 model

Property: model
Value type: <string>
Description:
	The model property value is a <string> that specifies the
  	manufacturer=92s model number of the device.

	The recommended format is: =93manufacturer,model=94, where manufacture=
r
	is a string describing the name of the manufacturer (such as a stock
	ticker symbol), and model specifies the model number.

Example:
	model =3D =93fsl,MPC8349EMITX=94;

MBR, Sergei
