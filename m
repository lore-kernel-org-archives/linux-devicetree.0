From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] ARM64: dts: meson-gx: add the missing uart_AO_B
Date: Wed, 18 Jan 2017 11:22:45 +0100
Message-ID: <CACRpkdY9LGHJinCeJvJ=38fpWU7eAZwuv5-HG=kEFKzouAF-vQ@mail.gmail.com>
References: <20170115222029.8271-1-martin.blumenstingl@googlemail.com>
 <20170115222029.8271-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170115222029.8271-3-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, Will Deacon <will.deacon@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Carlo Caione <carlo@caione.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 15, 2017 at 11:20 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> This adds the missing node for the uart_AO_B port to the meson-gx.dtsi
> (as this is supported by GXBB, GXL and GXM) along with the required
> pinctrl pins. This is required as some boards are using it (the boards
> from the Khadas VIM series for example have it exposed on the pin
> headers).
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Please funnel this through the apropriate ARM SoC-feed tree.

Yours,
Linus Walleij
