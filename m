From: Vinay Simha <simhavcs@gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: Add jdi lt070me05000 panel bindings
Date: Wed, 7 Sep 2016 12:10:06 +0530
Message-ID: <CAGWqDJ4H2K58-_Ai-adG-DsB1CLrQrX3U+zZH5T1Nx2i_He7=A@mail.gmail.com>
References: <1472179029-9803-1-git-send-email-simhavcs@gmail.com> <1472179029-9803-2-git-send-email-simhavcs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472179029-9803-2-git-send-email-simhavcs@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Vinay Simha BN <simhavcs@gmail.com>, Archit Taneja <archit.taneja@gmail.com>, John Stultz <john.stultz@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

thierry,

please review.

On Fri, Aug 26, 2016 at 8:07 AM, Vinay Simha BN <simhavcs@gmail.com> wrote:
> Add documentation for lt070me05000 panel
>
> Cc: Archit Taneja <archit.taneja@gmail.com>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
>
> ---
> v2:
>  * incorporated rob herring and thierry reviews
>    gpio to gpios, gpio to regulator using fixed regulators
>    and pwm backlight is removed, since it is controlled by
>    dcs commands
>
> v3:
>  * incorporated thierry reviews
>    - Added gpio polarity details for reset-gpios
>    - proper naming conventions and sequence wrt panel datasheet
>      (vddp-supply, iovcc-supply,
>       enable-gpios, reset-gpios, dcdc-en-gpios)
> ---
>  .../bindings/display/panel/jdi,lt070me05000.txt    | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
>
> diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
> new file mode 100644
> index 0000000..4724952
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
> @@ -0,0 +1,33 @@
> +JDI model LT070ME05000 1200x1920 7" DSI Panel
> +
> +Required properties:
> +- compatible: should be "jdi,lt070me05000"
> +- vddp-supply: phandle of the regulator that provides the supply voltage
> +  Power IC supply (3-5V)
> +- iovcc-supply: phandle of the regulator that provides the supply voltage
> +  IOVCC , power supply for LCM (1.8V)
> +- enable-gpios: phandle of gpio for enable line
> +  LED_EN, LED backlight enable, High active
> +- reset-gpios: phandle of gpio for reset line
> +  This should be 8mA, gpio can be configured using mux, pinctrl, pinctrl-names
> +  XRES, Reset, Low active
> +- dcdc-en-gpios: phandle of the gpio for power ic line
> +  Power IC supply enable, High active
> +
> +Example:
> +
> +       dsi0: qcom,mdss_dsi@4700000 {
> +               panel@0 {
> +                       compatible = "jdi,lt070me05000";
> +                       reg = <0>;
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&dsi_panel_pinctrl>;
> +
> +                       vddp-supply = <&pm8921_l17>;
> +                       iovcc-supply = <&pm8921_lvs7>;
> +
> +                       enable-gpios = <&pm8921_gpio 36 GPIO_ACTIVE_HIGH>;
> +                       reset-gpios = <&tlmm_pinmux 54 GPIO_ACTIVE_LOW>;
> +                       dcdc-en-gpios = <&pm8921_gpio 23 GPIO_ACTIVE_HIGH>;
> +               };
> +       };
> --
> 2.1.2
>



-- 
regards,
vinaysimha
