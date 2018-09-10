From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] ARM64: dts: meson-gxbb-wetek: add ttyAML1 uart for Bluetooth
Date: Mon, 10 Sep 2018 11:17:09 -0500
Message-ID: <CAL_JsqK4qwipnhhT=n3-sqh1rRXU4McJjR6WEAp+Tvnjvb5osw@mail.gmail.com>
References: <1536072290-28015-1-git-send-email-christianshewitt@gmail.com> <1536322536-53109-1-git-send-email-christianshewitt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1536322536-53109-1-git-send-email-christianshewitt@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: christianshewitt@gmail.com
Cc: Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 7, 2018 at 7:16 AM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>

ttyAML1 has nothing to do with dts files.

> This change adds the uart_A used by the brmcfmac sdio module in the
> WeTek Hub and WeTek Play 2 devices. meson_uart_probe seems to mandate
> an alias (without it, BT is not working) so this is also included.

You should fix the alias being required. It should not be.

> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
