From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 13/17 v1] gpio: ixp4xx: Add DT bindings
Date: Mon, 18 Feb 2019 15:27:28 -0600
Message-ID: <CAL_JsqKoNmG2dG8PSh7ak2Oi4p8WiTSLfgpR21sGPw7-V0956w@mail.gmail.com>
References: <20190203214205.13594-1-linus.walleij@linaro.org>
 <20190203214205.13594-14-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190203214205.13594-14-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Tim Harvey <tharvey@gateworks.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Krzysztof Halasa <khalasa@piap.pl>, Olof Johansson <olof@lixom.net>, Imre Kaloz <kaloz@openwrt.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 3, 2019 at 3:42 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This adds DT bindings for the IXP4xx GPIO controller.
>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Bartosz: looking for your ACK on this, it'd be good if
> the other GPIO maintainer is aligned with my ideas here.
> I intend to merge this through the ARM SoC tree.
> ---
>  .../bindings/gpio/intel,ixp4xx-gpio.txt       | 38 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/intel,ixp4xx-gpio.txt

Reviewed-by: Rob Herring <robh@kernel.org>
