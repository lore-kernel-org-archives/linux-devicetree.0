Return-Path: <SRS0=J7OV=TP=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH v6 1/7] dt-bindings: usb: hd3ss3220 device tree binding
 document
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
 <1557922152-16449-2-git-send-email-biju.das@bp.renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <c9b3ee90-9292-320c-4e22-8f989d829497@cogentembedded.com>
Date: Wed, 15 May 2019 19:09:38 +0300
MIME-Version: 1.0
In-Reply-To: <1557922152-16449-2-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hello!

On 05/15/2019 03:09 PM, Biju Das wrote:

> Add device tree binding document for TI HD3SS3220 Type-C DRP port
> controller driver.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> V5-->V6
>   * No change.
> V4-->V5
>   * No Change.
> V3-->V4
>   * No Change.
> V2-->V3
>   * Added Rob's Reviewed by tag.
> V1-->V2
>   * Added connector node.
>   * updated the example with connector node.
> ---
>  .../devicetree/bindings/usb/ti,hd3ss3220.txt       | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> new file mode 100644
> index 0000000..7f41400
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> @@ -0,0 +1,37 @@
> +TI HD3SS3220 TypeC DRP Port Controller.
> +
> +Required properties:
> + - compatible: Must be "ti,hd3ss3220".
> + - reg: I2C slave address, must be 0x47 or 0x67 based on ADDR pin.
> + - interrupts: <a b> where a is the interrupt number and b represents an
> +   encoding of the sense and level information for the interrupt.

   This depends on an interrupt controller used. I'd just said "an interrupt
specifier", w/o further details.

> +
> +Required sub-node:
> + - connector : The "usb-c-connector" attached to the hd3ss3220 chip. The
> +   bindings of the connector node are specified in:
> +
> +	Documentation/devicetree/bindings/connector/usb-connector.txt
> +
[...]

MBR, Sergei
