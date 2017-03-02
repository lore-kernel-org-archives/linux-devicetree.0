From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 1/3] doc: bindings: Add bindings documentation for mtd
 nvmem
Date: Thu, 2 Mar 2017 21:22:20 +0100
Message-ID: <20170302212220.4c3c7bef@bbrezillon>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
 <1488484223-844-2-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1488484223-844-2-git-send-email-albeu@free.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Alban <albeu@free.fr>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Thu,  2 Mar 2017 20:50:21 +0100
Alban <albeu@free.fr> wrote:

> Add the binding to expose MTD partitions as nvmem providers.

Looks good. Maybe you should take the case you describe in your
cover-letter into account and add an extra layer: add an nvmem sub-node
containing the nvmem cells, so that you can expose nvmem cells directly
under master MTD devices (and not only partitions). 

> 
> Signed-off-by: Alban <albeu@free.fr>
> ---
>  .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> new file mode 100644
> index 0000000..47602f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> @@ -0,0 +1,29 @@
> += NVMEM in MTD =
> +
> +Config data for drivers is often stored in MTD devices. This binding
> +define how such data can be represented in device tree.
> +
> +An MTD can be defined as an NVMEM provider by adding the `nvmem-provider`
> +property to their node. Data cells can then be defined as child nodes
> +of the partition as defined in nvmem.txt.
> +
> +Example:
> +
> +	flash@0 {
> +		...
> +
> +		partition@2 {
> +			label = "art";
> +			reg = <0x7F0000 0x010000>;
> +			read-only;
> +
> +			nvmem-provider;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			eeprom@1000 {
> +				label = "wmac-eeprom";
> +				reg = <0x1000 0x1000>;
> +			};
> +		};
> +	};


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
