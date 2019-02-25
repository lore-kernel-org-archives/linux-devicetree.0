From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: MIPS: Add doc about Ingenic CPU node.
Date: Mon, 25 Feb 2019 10:17:05 -0600
Message-ID: <20190225161705.GA29894@bogus>
References: <1548854044-56483-1-git-send-email-zhouyanjie@zoho.com>
 <1548854044-56483-2-git-send-email-zhouyanjie@zoho.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548854044-56483-2-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhou Yanjie <zhouyanjie@zoho.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, paul.burton@mips.com, ralf@linux-mips.org, jhogan@kernel.org, ezequiel@collabora.co.uk, paul@crapouillou.net, mark.rutland@arm.com, syq@debian.org, jiaxun.yang@flygoat.com, 772753199@qq.com, ulf.hansson@linaro.org, malat@debian.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 30, 2019 at 09:14:03PM +0800, Zhou Yanjie wrote:
> Dt-bindings doc about CPU node of Ingenic XBurst based SOCs.
> 
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>  .../devicetree/bindings/mips/ingenic/ingenic,cpu.txt    | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.txt
> 
> diff --git a/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.txt b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.txt
> new file mode 100644
> index 0000000..38e3cd3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.txt
> @@ -0,0 +1,17 @@
> +Ingenic Soc CPU
> +
> +Required properties:
> +- device_type: Must be "cpu".
> +- compatible: One of:
> +  - "ingenic,xburst".

Only 1 version?

Is everything else discoverable or implied by this? Cache sizes, 
instruction set features, bugs, etc.?

> +- reg: The number of the CPU.

Ideally, this should be based on some h/w id, but generally only SMP 
processors have that.

BTW, is SMP supported? If so, you need to define how secondary cores get 
booted (unless that is standard and implied).

> +- next-level-cache: If there is a next level cache, point to it.
> +
> +Example:
> +cpu0: cpu@0 {
> +	device_type = "cpu";
> +	compatible = "ingenic,xburst";
> +	reg = <0>;
> +	next-level-cache = <&l2c>;
> +};
> +
> -- 
> 2.7.4
> 
> 
