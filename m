From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: power: add Amlogic Everything-Else power
 domains bindings
Date: Wed, 21 Aug 2019 08:46:38 -0500
Message-ID: <CAL_JsqLy9etZtUYTJdvBRCRGuxPN_eXJQT8_xwdST5TNparJug@mail.gmail.com>
References: <20190821114121.10430-1-narmstrong@baylibre.com> <20190821114121.10430-2-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821114121.10430-2-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org, "open list:THERMAL" <linux-pm@vger.kernel.org>, linux-amlogic@lists.infradead.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 21, 2019 at 6:41 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the bindings for the Amlogic Everything-Else power domains,
> controlling the Everything-Else peripherals power domains.
>
> The bindings targets the Amlogic G12A and SM1 compatible SoCs,
> support for earlier SoCs will be added later.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/power/amlogic,meson-ee-pwrc.yaml | 93 +++++++++++++++++++
>  include/dt-bindings/power/meson-g12a-power.h  | 13 +++
>  include/dt-bindings/power/meson-sm1-power.h   | 18 ++++
>  3 files changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
>  create mode 100644 include/dt-bindings/power/meson-g12a-power.h
>  create mode 100644 include/dt-bindings/power/meson-sm1-power.h

Reviewed-by: Rob Herring <robh@kernel.org>
