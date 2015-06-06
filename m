From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 4/6] ARM: dts; pxa: add embedded pxa camera capture interface
Date: Sun, 07 Jun 2015 01:07:01 +0300
Message-ID: <55736F05.8000904@cogentembedded.com>
References: <1433624953-28165-1-git-send-email-robert.jarzmik@free.fr> <1433624953-28165-4-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433624953-28165-4-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

On 06/07/2015 12:09 AM, Robert Jarzmik wrote:

> The pxa27x SoCs have an embedded camera host controller. Add the
> description to the family description.

> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
>   arch/arm/boot/dts/pxa27x.dtsi | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)

> diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
> index 506db86..9ebfd7f 100644
> --- a/arch/arm/boot/dts/pxa27x.dtsi
> +++ b/arch/arm/boot/dts/pxa27x.dtsi
> @@ -77,6 +77,23 @@
>   			clocks = <&clks CLK_KEYPAD>;
>   			status = "disabled";
>   		};
> +
> +		pxa_camera: pxa_camera@50000000 {

    The ePAPR standard has something to say about the node naming:
"The name of a node should be somewhat generic, reflecting the function of the 
device and not its precise programming model." So I'd suggest "video@50000000" 
instead...

[...]

WBR, Sergei
