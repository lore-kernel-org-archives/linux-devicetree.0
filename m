From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: mtd: sunxi-nand: Add YAML schemas
Date: Tue, 2 Apr 2019 20:25:59 -0500
Message-ID: <CAL_JsqLrdFAhdbjVi0ZoCOM6ajEOdQeLpkSKBsZ90X+UvfkLmA@mail.gmail.com>
References: <74b8a52ce98b09d7906f988c107793a86c0c5f6b.1554216856.git-series.maxime.ripard@bootlin.com>
 <079279c3713042bdcc76ea27907d5f75bcb483fc.1554216856.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <079279c3713042bdcc76ea27907d5f75bcb483fc.1554216856.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Boris Brezillon <boris.brezillon@collabora.com>, MTD Maling List <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 2, 2019 at 9:54 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Switch the DT binding to a YAML schema to enable the DT validation.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v1
>   - Added controller constraints to the generic options
> ---
>  Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml | 96 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  Documentation/devicetree/bindings/mtd/sunxi-nand.txt                | 48 +------------------------------------
>  2 files changed, 96 insertions(+), 48 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/sunxi-nand.txt

Same 'a-f' comment here, but otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

And thanks for being an early adopter. Let me know if you have any
feedback on the schema or pain points.

Rob
