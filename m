From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: bus: Convert Allwinner DE2 bus to a schema
Date: Fri, 12 Jul 2019 07:23:05 -0600
Message-ID: <20190712132305.GA13584@bogus>
References: <20190711094036.21777-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190711094036.21777-1-maxime.ripard@bootlin.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 11, 2019 at 11:40:36AM +0200, Maxime Ripard wrote:
> The Allwinner SoCs using the second generation of the display engine have a
> bus for that display engine. The bus is supported in Linux, with a matching
> Device Tree binding.
> 
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../bus/allwinner,sun50i-a64-de2.yaml         | 84 +++++++++++++++++++
>  .../bindings/bus/sun50i-de2-bus.txt           | 40 ---------
>  2 files changed, 84 insertions(+), 40 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
>  delete mode 100644 Documentation/devicetree/bindings/bus/sun50i-de2-bus.txt
> 
> diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> new file mode 100644
> index 000000000000..b9734f8109c6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: GPL2

I fixed this up.

Rob
