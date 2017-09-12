From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 06/10] arm64: allwinner: a64: Add devicetree binding for
 DMA controller
Date: Tue, 12 Sep 2017 11:52:20 -0500
Message-ID: <20170912165220.yj4bcpd4yg3wujyh@rob-hp-laptop>
References: <20170903224100.17893-1-stefan.bruens@rwth-aachen.de>
 <20170903224100.17893-7-stefan.bruens@rwth-aachen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170903224100.17893-7-stefan.bruens@rwth-aachen.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens@rwth-aachen.de>
Cc: devicetree@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, Code Kipper <codekipper@gmail.com>, linux-sunxi@googlegroups.com, dmaengine@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 04, 2017 at 12:40:57AM +0200, Stefan Br=FCns wrote:
> The A64 is register compatible with the H3, but has a different number
> of dma channels and request ports.
> =

> Attach additional properties to the node to allow future reuse of the
> compatible for controllers with different number of channels/requests.
> =

> If dma-requests is not specified, the register layout defined maximum
> of 32 is used.

This belongs in the binding.

> =

> Signed-off-by: Stefan Br=FCns <stefan.bruens@rwth-aachen.de>
> ---
>  .../devicetree/bindings/dma/sun6i-dma.txt          | 26 ++++++++++++++++=
++++++
>  1 file changed, 26 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/dma/sun6i-dma.txt b/Docume=
ntation/devicetree/bindings/dma/sun6i-dma.txt
> index 6b267045f522..66195fb31296 100644
> --- a/Documentation/devicetree/bindings/dma/sun6i-dma.txt
> +++ b/Documentation/devicetree/bindings/dma/sun6i-dma.txt
> @@ -26,6 +26,32 @@ Example:
>  		#dma-cells =3D <1>;
>  	};
>  =

> +------------------------------------------------------------------------=
------
> +For A64 DMA controller:
> +
> +Required properties:
> +- compatible:	"allwinner,sun50i-a64-dma"
> +- dma-channels: Number of DMA channels supported by the controller.
> +		Refer to Documentation/devicetree/bindings/dma/dma.txt

dma.txt already explains what these properties are. You just need to =

state what are valid values.

> +- all properties above, i.e. reg, interrupts, clocks, resets and #dma-ce=
lls
> +
> +Optional properties:
> +- dma-requests: Number of DMA request signals supported by the controlle=
r.
> +		Refer to Documentation/devicetree/bindings/dma/dma.txt
> +
> +Example:
> +	dma: dma-controller@01c02000 {

Drop the leading 0. Building dtbs with W=3D2 will tell you this.

> +		compatible =3D "allwinner,sun50i-a64-dma";
> +		reg =3D <0x01c02000 0x1000>;
> +		interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D <&ccu CLK_BUS_DMA>;
> +		dma-channels =3D <8>;
> +		dma-requests =3D <27>;
> +		resets =3D <&ccu RST_BUS_DMA>;
> +		#dma-cells =3D <1>;
> +	};
> +------------------------------------------------------------------------=
------
> +
>  Clients:
>  =

>  DMA clients connected to the A31 DMA controller must use the format
> -- =

> 2.14.1
> =
