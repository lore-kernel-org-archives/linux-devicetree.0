From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH V2 6/6] DT: MIPS: ralink: add MT7620A dts files
Date: Tue, 16 Apr 2013 16:59:01 +0400
Message-ID: <516D4B15.406@cogentembedded.com>
References: <1366103562-21463-1-git-send-email-blogic@openwrt.org> <1366103562-21463-6-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1366103562-21463-6-git-send-email-blogic@openwrt.org>
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

> Add a dtsi file for MT7620A SoC and a sample dts file.

> Signed-off-by: John Crispin <blogic@openwrt.org>
[...]

> diff --git a/arch/mips/ralink/dts/mt7620a.dtsi b/arch/mips/ralink/dts/mt7620a.dtsi
> new file mode 100644
> index 0000000..08bf24f
> --- /dev/null
> +++ b/arch/mips/ralink/dts/mt7620a.dtsi
> @@ -0,0 +1,58 @@
[...]
> +	cpuintc: cpuintc@0 {
> +		#address-cells = <0>;

    Why? There's no subnodes.

> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +		compatible = "mti,cpu-interrupt-controller";
> +	};
> +
> +	palmbus@10000000 {
> +		compatible = "palmbus";
> +		reg = <0x10000000 0x200000>;
> +                ranges = <0x0 0x10000000 0x1FFFFF>;

    This line is indented with spaces. And the last cell should probably be 
0x200000.

WBR, Sergei
