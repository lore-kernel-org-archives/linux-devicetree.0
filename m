From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: crypto: Convert Allwinner A10 Security
 Engine to a schema
Date: Fri, 12 Jul 2019 07:23:35 -0600
Message-ID: <20190712132335.GA14684@bogus>
References: <20190711122301.8193-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190711122301.8193-1-maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, linux-crypto@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, 11 Jul 2019 14:23:01 +0200, Maxime Ripard wrote:
> The older Allwinner SoCs have a crypto engine that is supported in Linux,
> with a matching Device Tree binding.
> 
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../crypto/allwinner,sun4i-a10-crypto.yaml    | 79 +++++++++++++++++++
>  .../devicetree/bindings/crypto/sun4i-ss.txt   | 23 ------
>  2 files changed, 79 insertions(+), 23 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/crypto/allwinner,sun4i-a10-crypto.yaml
>  delete mode 100644 Documentation/devicetree/bindings/crypto/sun4i-ss.txt
> 

Applied, thanks.

Rob
