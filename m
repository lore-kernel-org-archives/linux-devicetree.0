From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 09/20] SEAD3: Probe parallel flash via DT
Date: Tue, 9 Aug 2016 16:23:40 +0300
Message-ID: <5bc9f3b2-e37b-1d07-730b-972e19d83b06@cogentembedded.com>
References: <20160809123546.10190-1-paul.burton@imgtec.com>
 <20160809123546.10190-10-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160809123546.10190-10-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hello.

On 08/09/2016 03:35 PM, Paul Burton wrote:

> Probe the system parallel flash using device tree rather than platform
> code, in order to reduce the amount of the latter.
>
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> ---
>
>  arch/mips/boot/dts/mti/sead3.dts     | 17 +++++++++++++++++
>  arch/mips/mti-sead3/sead3-platform.c | 37 ------------------------------------
>  2 files changed, 17 insertions(+), 37 deletions(-)
>
> diff --git a/arch/mips/boot/dts/mti/sead3.dts b/arch/mips/boot/dts/mti/sead3.dts
> index 66f7947..7799826 100644
> --- a/arch/mips/boot/dts/mti/sead3.dts
> +++ b/arch/mips/boot/dts/mti/sead3.dts
> @@ -67,6 +67,23 @@
>  		interrupts = <0>; /* GIC 0 or CPU 6 */
>  	};
>
> +	pflash@1c000000 {

    What's "pflash"? I'd suggest to just name the ndoe "flash@..." to be more 
in line with ePAPR.

> +		compatible = "intel,28f128j3", "cfi-flash";
> +		reg = <0x1c000000 0x2000000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		user-fs@0 {
> +			label = "User FS";
> +			reg = <0x0 0x1fc0000>;
> +		};
> +
> +		board-config@3e0000 {
> +			label = "Board Config";
> +			reg = <0x1fc0000 0x40000>;
> +		};

    Doesn't MTD code complain that the partitions are not subnodes of a 
"partitions" node?
It's the preferred way now...

> +	};
> +
>  	/* UART connected to FTDI & miniUSB socket */
>  	uart0: uart@1f000900 {
>  		compatible = "ns16550a";
[...]

MBR, Sergei
