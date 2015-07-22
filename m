From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: dts: Add STM32429i-EVAL board support
Date: Wed, 22 Jul 2015 16:42:01 -0700
Message-ID: <CAOesGMjLBwQgfm=nP+qTD9J8mfdoDb1PYCJ5cv2rT10+QY539Q@mail.gmail.com>
References: <1436693957-30855-1-git-send-email-mcoquelin.stm32@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436693957-30855-1-git-send-email-mcoquelin.stm32@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Kamil Lulko <rev13@wp.pl>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, Jul 12, 2015 at 2:39 AM, Maxime Coquelin
<mcoquelin.stm32@gmail.com> wrote:

> +/ {
> +       model = "STMicroelectronics STM32429i-EVAL board";
> +       compatible = "st,stm32429i-eval", "st,stm32f429";
> +
> +       chosen {
> +               bootargs = "console=ttyS0,115200 root=/dev/ram rdinit=/linuxrc";
> +               linux,stdout-path = &usart1;

You should use stdout-path here instead, and with that you'll no
longer need the console arg in the bootargs.

See: https://www.kernel.org/doc/Documentation/devicetree/bindings/chosen.txt


-Olof
