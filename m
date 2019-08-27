From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: irq: Convert Allwinner IRQ
 Controller to a schema
Date: Tue, 27 Aug 2019 12:23:20 -0500
Message-ID: <20190827172320.GA12595@bogus>
References: <20190821082138.11049-1-mripard@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190821082138.11049-1-mripard@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, jason@lakedaemon.net, Maxime Ripard <maxime.ripard@bootlin.com>, maz@kernel.org, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, tglx@linutronix.de, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 21 Aug 2019 10:21:37 +0200, Maxime Ripard wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
> 
> The Allwinner SoCs have an interrupt controller supported in Linux, with a
> matching Device Tree binding.
> 
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> 
> ---
> 
> Changes from v1:
>   - Remove Fixme and add additionalProperties to false
>   - Add unit address for the example
> ---
>  .../allwinner,sun4i-a10-ic.yaml               | 47 +++++++++++++++++++
>  .../allwinner,sun4i-ic.txt                    | 20 --------
>  2 files changed, 47 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/allwinner,sun4i-a10-ic.yaml
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/allwinner,sun4i-ic.txt
> 

Applied, thanks.

Rob
