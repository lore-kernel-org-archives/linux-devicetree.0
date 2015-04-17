From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 07/14] devicetree: Add bindings for the ATH79 PLL controllers
Date: Fri, 17 Apr 2015 19:20:14 +0300
Message-ID: <553132BE.9070602@cogentembedded.com>
References: <1429280669-2986-1-git-send-email-albeu@free.fr> <1429280669-2986-8-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429280669-2986-8-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Alban Bedel <albeu@free.fr>, linux-mips@linux-mips.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/17/2015 05:24 PM, Alban Bedel wrote:

> Signed-off-by: Alban Bedel <albeu@free.fr>
> ---
>   .../devicetree/bindings/clock/qca,ath79-pll.txt    | 33 ++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/qca,ath79-pll.txt

> diff --git a/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt b/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt
> new file mode 100644
> index 0000000..2d2da3f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt
> @@ -0,0 +1,33 @@
> +Binding for Qualcomm Atheros AR7xxx/AR9XXX PLL controller
> +
> +The PPL controller provides the 3 main clocks of the SoC: CPU, DDR and AHB.
> +
> +Required Properties:
> +- compatible: has to be "qca,<soctype>-cpu-intc" and one of the following
> +  fallback:

    Fallbacks.

> +  - "qca,ar7100-pll"
> +  - "qca,ar7240-pll"
> +  - "qca,ar9130-pll"
> +  - "qca,ar9330-pll"
> +  - "qca,ar9340-pll"
> +  - "qca,ar9550-pll"
> +- reg: Base address and size of the controllers memory area
> +- clock-names: Name of the input clock, has to be "ref"
> +- clock: phandle of the external reference clock

    The prop name is "clocks", not "clock".

[...]

WBR, Sergei
