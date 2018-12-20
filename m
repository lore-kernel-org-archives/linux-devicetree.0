From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 2/3] dt-bindings: mailbox: Document
 armada-37xx-rwtm-mailbox binding
Date: Thu, 20 Dec 2018 15:44:47 -0600
Message-ID: <20181220214447.GA18008@bogus>
References: <20181217153706.25873-1-marek.behun@nic.cz>
 <20181217153706.25873-2-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181217153706.25873-2-marek.behun@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 17, 2018 at 04:37:05PM +0100, Marek Behún wrote:
> This adds device tree binding documentation for the rWTM BIU mailbox
> driver on the Armada 37xx SOC (EspressoBin, Turris Mox).
> 
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../mailbox/armada-37xx-rwtm-mailbox.txt         | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/armada-37xx-rwtm-mailbox.txt
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/armada-37xx-rwtm-mailbox.txt b/Documentation/devicetree/bindings/mailbox/armada-37xx-rwtm-mailbox.txt
> new file mode 100644
> index 000000000000..2d182d61eb3f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/armada-37xx-rwtm-mailbox.txt
> @@ -0,0 +1,16 @@
> +* rWTM BIU Mailbox driver for Armada 37xx
> +
> +Required properties:
> +- compatible :	must be "marvell,armada-37xx-rwtm-mailbox"

Don't use wildcards in compatible strings.

> +- reg : 	physical base address of the mailbox and length of memory mapped

mixed space and tab.

> +		region
> +- interrupts:	the IRQ line for the mailbox
> +- #mbox-cells:	must be 1
> +
> +Example:
> +	rwtm: mailbox@b0000 {
> +		compatible = "marvell,armada-37xx-rwtm-mailbox";
> +		reg = <0xb0000 0x100>;
> +		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +		#mbox-cells = <1>;
> +	};
> -- 
> 2.18.1
> 
