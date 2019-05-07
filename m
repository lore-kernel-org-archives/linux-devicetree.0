From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 0/6] Add drive-strength in Meson pinctrl driver
Date: Tue, 7 May 2019 20:03:15 +0200
Message-ID: <CAFBinCBeqW7NLyFygB5vi5a+KGcez8q5Hy1e7MdHmaWLv7KmkA@mail.gmail.com>
References: <20190507115726.23714-1-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190507115726.23714-1-glaroque@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, May 7, 2019 at 1:57 PM Guillaume La Roque <glaroque@baylibre.com> wrote:
>
> The purpose of this patchset is to add drive-strength support in meson pinconf
> driver. This is a new feature that was added on the g12a. It is critical for us
> to support this since many functions are failing with default pad drive-strength.
>
> The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
> 'drive-strength' is expressed in mA.
> So this patch add another generic property "drive-strength-uA". The change to do so
> would be minimal and could be benefit to other platforms later on.
>
> Cheers
> Guillaume
>
> Changes since v2:
> - update driver-strength-uA property to be compliant with DT documentation
> - rework patch series for better understanding
> - rework set_bias function
>
> Changes since v1:
> - fix missing break
> - implement new pinctrl generic property "drive-strength-uA"
>
> [1] https://lkml.kernel.org/r/20190314163725.7918-1-jbrunet@baylibre.com
>
>
> Guillaume La Roque (6):
>   dt-bindings: pinctrl: add a 'drive-strength-microamp' property
>   pinctrl: generic: add new 'drive-strength-microamp' property support
>   dt-bindings: pinctrl: meson: Add drive-strength-microamp property
>   pinctrl: meson: Rework enable/disable bias part
>   pinctrl: meson: add support of drive-strength-microamp
>   pinctrl: meson: g12a: add DS bank value
>
>  .../bindings/pinctrl/meson,pinctrl.txt        |   4 +
>  .../bindings/pinctrl/pinctrl-bindings.txt     |   3 +
>  drivers/pinctrl/meson/pinctrl-meson-g12a.c    |  36 ++--
>  drivers/pinctrl/meson/pinctrl-meson.c         | 177 +++++++++++++++---
>  drivers/pinctrl/meson/pinctrl-meson.h         |  18 +-
>  drivers/pinctrl/pinconf-generic.c             |   2 +
>  include/linux/pinctrl/pinconf-generic.h       |   3 +
>  7 files changed, 195 insertions(+), 48 deletions(-)
I gave this a go on one of my Meson8m2 boards:
[Meson8m2 doesn't support drive strength and still boots without any
crashes or obvious regressions]
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
