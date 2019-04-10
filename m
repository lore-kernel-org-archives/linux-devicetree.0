From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: Add YAML schemas for the generic
 NAND options
Date: Wed, 10 Apr 2019 08:05:26 -0500
Message-ID: <CAL_Jsq+aXtRSAUoSLxSK2vWj0p8uXMhcr+kfd=60BmdK1agvJw@mail.gmail.com>
References: <88ac1ca97bc5dd0a0e40d7d828199331b3e01fb9.1554277681.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <88ac1ca97bc5dd0a0e40d7d828199331b3e01fb9.1554277681.git-series.maxime.ripard@bootlin.com>
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

On Wed, Apr 3, 2019 at 2:48 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The NAND chips in MTD have a bunch of generic options that are needed in a
> device tree. Add a YAML schemas for those.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v2:
>   - Fix the regex for the NAND chip node
>   - Move the minimum into an allOf for nand-ecc-strength and
>     nand-ecc-step-size
>
> Changes from v1:
>   - Removed free form text binding
>   - Enhanced properties descriptions
>   - Fixed the SPDX license tag
>   - Added minimums for nand-ecc-strength and nand-ecc-step-size
>   - Removed Boris from the maintainers
> ---
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 143 +++++++-
>  Documentation/devicetree/bindings/mtd/nand.txt             |  75 +----
>  2 files changed, 143 insertions(+), 75 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nand-controller.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/nand.txt

Reviewed-by: Rob Herring <robh@kernel.org>
