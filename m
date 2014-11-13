From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH 2/4] DT: pwm: Add binding document for IMG PWM DAC
Date: Wed, 12 Nov 2014 21:19:35 -0800
Message-ID: <CAL1qeaHd0j273HnQ+EXhfJoKh0nVM_==K4DvzkvcS2y4_kv+wg@mail.gmail.com>
References: <1415795873-4816-1-git-send-email-Naidu.Tellapati@imgtec.com>
	<1415795873-4816-3-git-send-email-Naidu.Tellapati@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pwm-owner@vger.kernel.org>
In-Reply-To: <1415795873-4816-3-git-send-email-Naidu.Tellapati@imgtec.com>
Sender: linux-pwm-owner@vger.kernel.org
To: Naidu Tellapati <Naidu.Tellapati@imgtec.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, James Hartley <James.Hartley@imgtec.com>, Ezequiel Garcia <Ezequiel.Garcia@imgtec.com>, Arul.Ramasamy@imgtec.com, Sai.Masarapu@imgtec.com, linux-pwm@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 12, 2014 at 4:37 AM,  <Naidu.Tellapati@imgtec.com> wrote:
> From: Naidu Tellapati <Naidu.Tellapati@imgtec.com>
>
> Add binding document for IMG Pulse Width Modulator (PWM) DAC present on the
> Pistachio SOC. The PWM DAC has four channels.
>
> Signed-off-by: Naidu Tellapati <Naidu.Tellapati@imgtec.com>
> Signed-off-by: Sai Masarapu <Sai.Masarapu@imgtec.com>

> diff --git a/Documentation/devicetree/bindings/pwm/img-pwm.txt b/Documentation/devicetree/bindings/pwm/img-pwm.txt
> new file mode 100644
> index 0000000..4f7f60c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/img-pwm.txt
> @@ -0,0 +1,22 @@
> +*Imagination Technologies PWM DAC driver
> +
> +Required properties:
> +  - compatible: Should be "img,pistachio-pwm"
> +  - reg: Should contain physical base address and length of pwm registers.
> +  - clocks: phandle to input PWM clock.
> +  - clock-names: input clock names.
> +       Required elements: "pwm".
> +  - #pwm-cells: Should be 2. See pwm.txt in this directory for the
> +       description of the cells format.
> +  - img,cr-periph: Must contain a phandle to the peripheral control
> +       syscon node which contains PWM control registers.
> +
> +Example:
> +       pwm: pwm@18101300 {
> +               compatible = "img,pistachio-pwm";
> +               reg = <0x18101300 0x14>;

Might as well claim the full 256 bytes.

> +               clocks = <&pwm_clk_handle>;
> +               clk-names = "pwm";

s/clk/clock/

> +               #pwm-cells = <2>;
> +               img,cr-periph = <&cr_periph>;
> +       };
> --
> 1.7.0.4
>
