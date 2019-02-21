From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 11/30 v2] clocksource/drivers/ixp4xx: Add DT bindings
Date: Thu, 21 Feb 2019 15:40:18 -0600
Message-ID: <CAL_JsqKp-DPkEQuWbeTsTqXF7v2=BD11-x2Os_8KfXtg28UJ8g@mail.gmail.com>
References: <20190221154458.23763-1-linus.walleij@linaro.org>
 <20190221154458.23763-12-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190221154458.23763-12-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Krzysztof Halasa <khalasa@piap.pl>, Thomas Gleixner <tglx@linutronix.de>, Imre Kaloz <kaloz@openwrt.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 21, 2019 at 9:45 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This adds device tree bindings for the Intel IXP4xx
> timers.
>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Switch to JSON YAML schema, why not.
> - Not collecting any review tags as this changed a bit.
> ---
>  .../bindings/timer/intel,ixp4xx-timer.yaml    | 42 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
