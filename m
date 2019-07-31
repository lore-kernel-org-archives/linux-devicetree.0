From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH 1/2] dts: add vendor prefix "acme" for "Acme Systems srl"
Date: Wed, 31 Jul 2019 13:34:19 +0200
Message-ID: <20190731113419.bz4qygnmnlf57yeo@M43218.corp.atmel.com>
References: <20190728210403.2730-1-uwe@kleine-koenig.org>
 <20190728210403.2730-2-uwe@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190728210403.2730-2-uwe@kleine-koenig.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, info@acmesystems.it, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 28, 2019 at 11:04:02PM +0200, Uwe Kleine-K=F6nig wrote:
> =

> Signed-off-by: Uwe Kleine-K=F6nig <uwe@kleine-koenig.org>

As I can confirm it's not an April fool!
Reviwed-by: Ludovic Desroches <ludovic.desroches@microchip.com>

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 6992bbbbffab..85965e3446bf 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -27,6 +27,8 @@ patternProperties:
>      description: Abilis Systems
>    "^abracon,.*":
>      description: Abracon Corporation
> +  "^acme,.*":
> +    description: Acme Systems srl
>    "^actions,.*":
>      description: Actions Semiconductor Co., Ltd.
>    "^active-semi,.*":
> -- =

> 2.20.1
> =
