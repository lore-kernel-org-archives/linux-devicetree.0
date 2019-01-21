From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 5/7] riscv: dts: add initial support for the SiFive
 FU540-C000 SoC
Date: Mon, 21 Jan 2019 15:10:40 +0100
Message-ID: <20190121141040.GM3691@localhost>
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
 <20181215052154.24347-6-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181215052154.24347-6-paul.walmsley@sifive.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-riscv@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 14, 2018 at 09:21:52PM -0800, Paul Walmsley wrote:
> Add initial support for the SiFive FU540-C000 SoC.  This is a 28nm SoC
> based around the SiFive U54-MC core complex and a TileLink
> interconnect.
> 
> This file is expected to grow considerably as more device drivers are
> added to the kernel.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> ---
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 182 +++++++++++++++++++++
>  1 file changed, 182 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> 
> diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> new file mode 100644
> index 000000000000..0ef314cf17b6
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi

> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		timebase-frequency = <1000000>;
> +		cpu0: cpu@0 {
> +			clock-frequency = <0>;
> +			compatible = "sifive,e51", "sifive,rocket0";

Looks like you forgot the currently required "riscv" compatible here and
below.

But perhaps it's the binding and arch code that should be revised
instead (e.g. as per your discussion with Rob elsewhere in this thread).

Johan
