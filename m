From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH RESEND v4 1/4] pwm: Imagination Technologies PWM DAC driver
Date: Fri, 21 Nov 2014 13:23:58 -0800
Message-ID: <CAL1qeaGt9K3eM-qDKo2qLrNEZK5EaStQEWJQH04_Kv6Sa3r04g@mail.gmail.com>
References: <1416600795-10965-1-git-send-email-Naidu.Tellapati@gmail.com>
	<1416600795-10965-2-git-send-email-Naidu.Tellapati@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pwm-owner@vger.kernel.org>
In-Reply-To: <1416600795-10965-2-git-send-email-Naidu.Tellapati@gmail.com>
Sender: linux-pwm-owner@vger.kernel.org
To: Naidu.Tellapati@gmail.com
Cc: Thierry Reding <thierry.reding@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, James Hartley <James.Hartley@imgtec.com>, Ezequiel Garcia <Ezequiel.Garcia@imgtec.com>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arul Ramasamy <Arul.Ramasamy@imgtec.com>, Sai Masarapu <Sai.Masarapu@imgtec.com>, Naidu Tellapati <Naidu.Tellapati@imgtec.com>
List-Id: devicetree@vger.kernel.org

Naidu,

On Fri, Nov 21, 2014 at 12:13 PM,  <Naidu.Tellapati@gmail.com> wrote:
> From: Naidu Tellapati <Naidu.Tellapati@imgtec.com>
>
> The Pistachio SOC from Imagination Technologies includes a Pulse Width
> Modulation DAC which produces 1 to 4 digital bit-outputs which represent
> digital waveforms. These PWM outputs are primarily in charge of controlling
> backlight LED devices.
>
> Signed-off-by: Naidu Tellapati <Naidu.Tellapati@imgtec.com>
> Signed-off-by: Sai Masarapu <Sai.Masarapu@imgtec.com>

One tiny comment below, otherwise:

Reviewed-by: Andrew Bresticker <abrestic@chromium.org>

> +static int img_pwm_remove(struct platform_device *pdev)
> +{
> +       unsigned int i;
> +       unsigned int val;
> +

No need for this newline.

> +       struct img_pwm_chip *pwm_chip = platform_get_drvdata(pdev);
