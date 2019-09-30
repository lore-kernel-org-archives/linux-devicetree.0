From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] pinctrl: add compatible for Amlogic Meson A1 pin
  controller
Date: Mon, 30 Sep 2019 17:47:20 -0500
Message-ID: <20190930224720.GA27280@bogus>
References: <1568700442-18540-1-git-send-email-qianggui.song@amlogic.com>
 <1568700442-18540-2-git-send-email-qianggui.song@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1568700442-18540-2-git-send-email-qianggui.song@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Qianggui Song <qianggui.song@amlogic.com>, Mark Rutland <mark.rutland@arm.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, Xingyu Chen <xingyu.chen@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Tue, 17 Sep 2019 14:07:20 +0800, Qianggui Song wrote:
> Add new compatible name for Amlogic's Meson-A1 pin controller
> add a dt-binding header file which document the detail pin names.
> 
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  .../devicetree/bindings/pinctrl/meson,pinctrl.txt  |  1 +
>  include/dt-bindings/gpio/meson-a1-gpio.h           | 73 ++++++++++++++++++++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 include/dt-bindings/gpio/meson-a1-gpio.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
