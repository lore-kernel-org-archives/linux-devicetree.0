From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 11/17 v1] clocksource/drivers/ixp4xx: Add DT bindings
Date: Mon, 18 Feb 2019 15:26:05 -0600
Message-ID: <CAL_JsqKd=93Xkp4OAu9GxMMqLrzYWTmr2rv=-NsDnqxMmSavYA@mail.gmail.com>
References: <20190203214205.13594-1-linus.walleij@linaro.org>
 <20190203214205.13594-12-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190203214205.13594-12-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Tim Harvey <tharvey@gateworks.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Krzysztof Halasa <khalasa@piap.pl>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, Imre Kaloz <kaloz@openwrt.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 3, 2019 at 3:42 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This adds device tree bindings for the Intel IXP4xx
> timers.
>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Clocksource/timer maintainers: I am requesting an ACK for
> this once you're happy with the bindings, as I intend to
> merge all of this IXP4xx rework through ARM SoC.
> ---
>  .../bindings/timer/intel,ixp4xx-timer.txt      | 18 ++++++++++++++++++
>  MAINTAINERS                                    |  1 +
>  2 files changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.txt

Same wish and comments here...

Reviewed-by: Rob Herring <robh@kernel.org>
