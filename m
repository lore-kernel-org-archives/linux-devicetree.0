From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 1/2] dt-bindings: media: sun4i-csi: Drop the module clock
Date: Thu, 3 Oct 2019 23:51:05 +0800
Message-ID: <CAGb2v66az3uQnibudKai7ATfXh+w1Y+bJ=o258RVe9SCNRpGNQ@mail.gmail.com>
References: <20191003154842.248763-1-mripard@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191003154842.248763-1-mripard@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <mripard@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Oct 3, 2019 at 11:48 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> It turns out that what was thought to be the module clock was actually the
> clock meant to be used by the sensor, and isn't playing any role with the
> CSI controller itself. Let's drop that clock from our binding.
>
> Fixes: c5e8f4ccd775 ("media: dt-bindings: media: Add Allwinner A10 CSI binding")
> Reported-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  .../devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> index 5dd1cf490cd9..d3e423fcb6c2 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> @@ -27,14 +27,12 @@ properties:
>    clocks:
>      items:
>        - description: The CSI interface clock
> -      - description: The CSI module clock
>        - description: The CSI ISP clock
>        - description: The CSI DRAM clock
>
>    clock-names:
>      items:
>        - const: bus
> -      - const: mod
>        - const: isp
>        - const: ram
>
> @@ -89,9 +87,8 @@ examples:
>          compatible = "allwinner,sun7i-a20-csi0";
>          reg = <0x01c09000 0x1000>;
>          interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> -        clocks = <&ccu CLK_AHB_CSI0>, <&ccu CLK_CSI0>,
> -                 <&ccu CLK_CSI_SCLK>, <&ccu CLK_DRAM_CSI0>;
> -        clock-names = "bus", "mod", "isp", "ram";
> +        clocks = <&ccu CLK_AHB_CSI0>, <&ccu CLK_CSI_SCLK>, <&ccu CLK_DRAM_CSI0>;
> +        clock-names = "bus", "isp", "ram";

I believe what we thought was the ISP clock is actually the module clock
for the whole CSI subsystem. So we should still use the module clock entry,
and remove the ISP entry.

ChenYu

>          resets = <&ccu RST_CSI0>;
>
>          port {
> --
> 2.23.0
>
