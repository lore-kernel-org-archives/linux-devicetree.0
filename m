From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/3] mtd: arasan: Add device tree binding documentation
Date: Sun, 22 Nov 2015 16:09:02 -0600
Message-ID: <20151122220902.GA7523@rob-hp-laptop>
References: <1448116777-9748-1-git-send-email-punnaia@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448116777-9748-1-git-send-email-punnaia@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dwmw2@infradead.org, computersforpeace@gmail.com, michals@xilinx.com, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kalluripunnaiahchoudary@gmail.com, kpc528@gmail.com, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Sat, Nov 21, 2015 at 08:09:37PM +0530, Punnaiah Choudary Kalluri wrote:
> This patch adds the dts binding document for arasan nand flash
> controller.
> 
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> ---
> Changes in v5:
> - None
> Changes in v4:
> - Added num-cs property
> - Added clock support
> Changes in v3:
> - None
> Changes in v2:
> - None
> ---
>  .../devicetree/bindings/mtd/arasan_nfc.txt         | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/arasan_nfc.txt b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> new file mode 100644
> index 0000000..02e1ce3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> @@ -0,0 +1,34 @@
> +Arasan Nand Flash Controller with ONFI 3.1 support
> +
> +Required properties:
> +- compatible: Should be "arasan,nfc-v3p10"

This should have a chip specific compatible in addition. Otherwise,

Acked-by: Rob Herring <robh@kernel.org>

Rob
