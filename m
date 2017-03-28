From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFT PATCH 6/6] ARM64: dts: meson-gxbb: Add USB Hub GPIO hog
Date: Tue, 28 Mar 2017 11:31:38 +0200
Message-ID: <CACRpkdafNk0921by3kGYqEc88P5FKxepXZsvenGELzpf=Q4AnA@mail.gmail.com>
References: <1490286449-19448-1-git-send-email-narmstrong@baylibre.com> <1490286449-19448-7-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1490286449-19448-7-git-send-email-narmstrong@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 23, 2017 at 5:27 PM, Neil Armstrong <narmstrong@baylibre.com> wrote:

> The ODroid-C2 on-board USB Hub needs to to have it's reset signal set to
> high level in order to be enumerated by the USB Host Controller.
>
> But this management must be part of the currently in-development Generic
> Power Sequence patch that will allow a USB Controller driver to start and stop
> a power sequence associated to the USB Bus.
>
> In the meantime, a simple USB Hog will work to enable the USB Hub.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
