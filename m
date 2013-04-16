From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH V2 5/6] DT: MIPS: ralink: add RT3883 dts files
Date: Tue, 16 Apr 2013 17:00:45 +0400
Message-ID: <516D4B7D.1030302@cogentembedded.com>
References: <1366103562-21463-1-git-send-email-blogic@openwrt.org> <1366103562-21463-5-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1366103562-21463-5-git-send-email-blogic@openwrt.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: John Crispin <blogic@openwrt.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hello.

On 16-04-2013 13:12, John Crispin wrote:

> Add a dtsi file for RT3883 SoC and a sample dts file.

> Signed-off-by: John Crispin <blogic@openwrt.org>
[...]

> diff --git a/arch/mips/ralink/dts/rt3883.dtsi b/arch/mips/ralink/dts/rt3883.dtsi
> new file mode 100644
> index 0000000..3b131dd
> --- /dev/null
> +++ b/arch/mips/ralink/dts/rt3883.dtsi
> @@ -0,0 +1,58 @@
[...]
> +	cpuintc: cpuintc@0 {
> +		#address-cells = <0>;

    There's no subnodes?

> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +		compatible = "mti,cpu-interrupt-controller";
> +	};
> +
> +	palmbus@10000000 {
> +		compatible = "palmbus";
> +		reg = <0x10000000 0x200000>;
> +		ranges = <0x0 0x10000000 0x1FFFFF>;

    Why the last cell is not 0x200000?

WBR, Sergei
