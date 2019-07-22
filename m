From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 01/11] dt-bindings: timer: Convert Allwinner A10 Timer to
 a schema
Date: Mon, 22 Jul 2019 09:05:59 -0600
Message-ID: <CAL_JsqJyDS0eaQeUWRx3OGJfQ7+QDRwEC=fTM1MzZOOEO0h3SQ@mail.gmail.com>
References: <20190722081229.22422-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190722081229.22422-1-maxime.ripard@bootlin.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 22, 2019 at 2:12 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The older Allwinner SoCs have a Timer supported in Linux, with a matching
> Device Tree binding.
>
> While the original binding only mentions one interrupt, the timer actually
> has 6 of them.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../timer/allwinner,sun4i-a10-timer.yaml      | 76 +++++++++++++++++++
>  .../bindings/timer/allwinner,sun4i-timer.txt  | 19 -----
>  2 files changed, 76 insertions(+), 19 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml
>  delete mode 100644 Documentation/devicetree/bindings/timer/allwinner,sun4i-timer.txt

Reviewed-by: Rob Herring <robh@kernel.org>
