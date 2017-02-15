From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/1] arm64: dts: r8a7795: add IMR-LX4 support
Date: Wed, 15 Feb 2017 12:45:09 +0300
Message-ID: <3f007932-d120-b0c0-2080-ce8eeb9418af@cogentembedded.com>
References: <20170214210301.620322370@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170214210301.620322370@cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Konstantin Kozhevnikov <Konstantin.Kozhevnikov@cogentembedded.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2/15/2017 12:02 AM, Sergei Shtylyov wrote:

> Describe the IMR-LX4 devices in the R8A7795 device tree.
>
> Based on the original (and large) patch by Konstantin Kozhevnikov
> <Konstantin.Kozhevnikov@cogentembedded.com>.
>
> Signed-off-by: Konstantin Kozhevnikov <Konstantin.Kozhevnikov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
> This patch is against the 'renesas-devel-20170213-v4.10-rc8' tag of Simon
> Horman's 'renesas.git' repo.

    The binding was documented in the IMR driver patch. I don't expect it to 
change even if the driver would be rewritten for DRM.

[...]
> Index: renesas/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> ===================================================================
> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ renesas/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -1419,6 +1419,38 @@
>  			status = "disabled";
>  		};
>
> +		imr-lx4@fe860000 {
> +			compatible = "renesas,imr-lx4";

    The manual seems to suggest that IMR-LX4 devicec are different between 
7795 and 7796 SoCs, so we may need SoC specific compatibility. I'll look into 
this...

MBR, Sergei
