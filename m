From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v6 2/6] dt-bindings: add mtk-timer bindings
Date: Wed, 4 Jun 2014 06:05:40 -0500
Message-ID: <CAL_Jsq+SkzTsczhh-DWvsktmCVtgNBsBtK3QqK5Am7UxMPgURA@mail.gmail.com>
References: <1401468964-5307-1-git-send-email-matthias.bgg@gmail.com>
 <1401468964-5307-3-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1401468964-5307-3-git-send-email-matthias.bgg@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@bq.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Florian Vaussard <florian.vaussard@epfl.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, Thomas Gleixner <tglx@linutronix.de>, Soren
List-Id: devicetree@vger.kernel.org

On Fri, May 30, 2014 at 11:56 AM, Matthias Brugger
<matthias.bgg@gmail.com> wrote:
> Add binding documentation for the General Porpose Timer driver of
> the Mediatek SoCs.
>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Acked-by: Rob Herring <robh@kernel.org>

but one typo below:

> ---
>  .../bindings/timer/mediatek,mtk-timer.txt          |   18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
>
> diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> new file mode 100644
> index 0000000..0558ddd0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> @@ -0,0 +1,18 @@
> +Mediatek MT6577, MT6572 and MT6589 Timers
> +---------------------------------------
> +
> +Required properties:
> +- compatible: Should be "mediatek,mt6577-timer"
> +- reg: Should contain location and length for timers register.
> +- clocks: Clocks driving the timer hardware. This list shoud include two

s/shoud/should/

> +       clocks. The order is system clock and as second clock the RTC clock.
> +
> +Examples:
> +
> +       timer@10008000 {
> +               compatible = "mediatek,mt6577-timer";
> +               reg = <0x10008000 0x80>;
> +               interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
> +               clocks = <&system_clk>, <&rtc_clk>;
> +               clock-names = "system-clk", "rtc-clk";
> +       };
> --
> 1.7.9.5
>
