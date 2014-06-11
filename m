From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/2] ARM: shmobile: r8a7791: add VIN DT support
Date: Thu, 12 Jun 2014 03:53:40 +0400
Message-ID: <5398EC04.5040802@cogentembedded.com>
References: <201406110304.18976.sergei.shtylyov@cogentembedded.com> <201406110306.08759.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <201406110306.08759.sergei.shtylyov@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

On 06/11/2014 03:06 AM, Sergei Shtylyov wrote:

> Define the generic R8A7791 parts of the VIN[0-2] device nodes. Add aliases for
> the VIN[0-2] device nodes.

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> ---
>   arch/arm/boot/dts/r8a7791.dtsi |   27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)

> Index: renesas/arch/arm/boot/dts/r8a7791.dtsi
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7791.dtsi
> +++ renesas/arch/arm/boot/dts/r8a7791.dtsi
[...]
> @@ -518,6 +521,30 @@
>   		status = "disabled";
>   	};
>
> +	vin0: video@e6ef0000 {
> +		compatible = "renesas,vin-r8a7790";

    Duh, should have been "renesas,vin-r8a7791"...

WBR, Sergei

