From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] pinctrl: sunxi: add allwinner A83T PIO controller support
Date: Fri, 2 Oct 2015 04:10:49 -0700
Message-ID: <CACRpkdb6tmfVSzuV7=u6pXU4trMbUBj8jF+aQgNiZsysgsL6qA@mail.gmail.com>
References: <1442936337-3104-1-git-send-email-vishnupatekar0510@gmail.com>
	<1442936337-3104-3-git-send-email-vishnupatekar0510@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1442936337-3104-3-git-send-email-vishnupatekar0510@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Emilio Lopez <emilio@elopez.com.ar>, Jens Kuske <jenskuske@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 22, 2015 at 8:38 AM, Vishnu Patekar
<vishnupatekar0510@gmail.com> wrote:

> Allwinner A83T soc port controller has 8 ports.
> It has 3 IRQ banks namely PB, PG, PH.
> Pinmuxing are different for some pins as compared to
> sun8i A23 and A33.
>
> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>

Patch applied with Maxime's ACK.

Yours,
Linus Walleij
