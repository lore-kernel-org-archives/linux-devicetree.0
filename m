From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 07/12] MIPS: Malta: Probe RTC via DT
Date: Sat, 3 Sep 2016 15:15:36 +0300
Message-ID: <8cc3d8af-8851-2f66-fb6d-d3ba35eb66b4@cogentembedded.com>
References: <20160902154859.24269-1-paul.burton@imgtec.com>
 <20160902154859.24269-8-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20160902154859.24269-8-paul.burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hello.

On 9/2/2016 6:48 PM, Paul Burton wrote:

> Add the DT node required to probe the RTC, and remove the platform code
> that was previously doing it.
>
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> ---
>
>  arch/mips/boot/dts/mti/malta.dts     | 15 +++++++++++++++
>  arch/mips/mti-malta/malta-platform.c | 21 ---------------------
>  2 files changed, 15 insertions(+), 21 deletions(-)
>
> diff --git a/arch/mips/boot/dts/mti/malta.dts b/arch/mips/boot/dts/mti/malta.dts
> index af765af..ee43296 100644
> --- a/arch/mips/boot/dts/mti/malta.dts
> +++ b/arch/mips/boot/dts/mti/malta.dts
> @@ -49,4 +49,19 @@
>  		interrupt-parent = <&gic>;
>  		interrupts = <GIC_SHARED 3 IRQ_TYPE_LEVEL_HIGH>;
>  	};
> +
> +	isa {
> +		compatible = "isa";
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges = <1 0 0 0x1000>;
> +
> +		rtc: mc146818@70 {

    Should be the other way around: you can use the chip name as a label, but 
you have to use the device class as a node name.

> +			compatible = "motorola,mc146818";
> +			reg = <1 0x70 0x8>;
> +
> +			interrupt-parent = <&i8259>;
> +			interrupts = <8>;
> +		};
> +	};
>  };
[...]

MBR, Sergei
