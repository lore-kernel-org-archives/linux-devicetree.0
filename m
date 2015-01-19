From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 31/36] devicetree: document ingenic,jz4780-intc binding
Date: Mon, 19 Jan 2015 15:08:14 +0300
Message-ID: <54BCF3AE.2080704@cogentembedded.com>
References: <1421620067-23933-1-git-send-email-paul.burton@imgtec.com> <1421620945-25502-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1421620945-25502-1-git-send-email-paul.burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org
Cc: Lars-Peter Clausen <lars@metafoo.de>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 1/19/2015 1:42 AM, Paul Burton wrote:

> Add binding documentation for the Ingenic jz4780 interrupt controller.

> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: devicetree@vger.kernel.org
> ---
>   .../interrupt-controller/ingenic,jz4780-intc.txt   | 24 ++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ingenic,jz4780-intc.txt

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,jz4780-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ingenic,jz4780-intc.txt
> new file mode 100644
> index 0000000..c6164d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,jz4780-intc.txt
> @@ -0,0 +1,24 @@
> +Ingenic jz4780 SoC Interrupt Controller
> +
> +Required properties:
> +
> +- compatible : should be "ingenic,jz4780-intc"
> +- reg : Specifies base physical address and size of the registers.
> +- interrupt-controller : Identifies the node as an interrupt controller
> +- #interrupt-cells : Specifies the number of cells needed to encode an
> +  interrupt source. The value shall be 1.
> +- interrupt-parent: phandle of the CPU interrupt controller.

    This is never a required prop, it can be inherited from an upper level node.

> +- interrupts - Specifies the CPU interrupt the controller is connected to.
> +
> +Example:
> +
> +intc: intc@10001000 {

    Again, should be "interrupt-controller@10001000".

WBR, Sergei
