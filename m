From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: irq: Convert Allwinner NMI
 Controller to a schema
Date: Tue, 27 Aug 2019 12:24:02 -0500
Message-ID: <20190827172402.GA13986@bogus>
References: <20190821082138.11049-1-mripard@kernel.org>
 <20190821082138.11049-2-mripard@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190821082138.11049-2-mripard@kernel.org>
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

On Wed, 21 Aug 2019 10:21:38 +0200, Maxime Ripard wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
> 
> The Allwinner SoCs have an interrupt controller called NMI supported in
> Linux, with a matching Device Tree binding.
> 
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> 
> ---
> 
> Changes from v1:
>   - Remove the custom select and rely on the deprecated property instead
> ---
>  .../allwinner,sun7i-a20-sc-nmi.yaml           | 70 +++++++++++++++++++
>  .../allwinner,sunxi-nmi.txt                   | 29 --------
>  2 files changed, 70 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/allwinner,sunxi-nmi.txt
> 

Applied, thanks.

Rob
