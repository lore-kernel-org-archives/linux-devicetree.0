From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 1/3] ARM: sunxi: Introduce Allwinner for A83T support
Date: Fri, 23 Oct 2015 09:37:45 +0800
Message-ID: <CAGb2v645Bwzdc1Uq0sR9SWqQH4htiO6qyPs28Hc5iOiJffXDHQ@mail.gmail.com>
References: <1445557577-27383-1-git-send-email-vishnupatekar0510@gmail.com> <1445557577-27383-2-git-send-email-vishnupatekar0510@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1445557577-27383-2-git-send-email-vishnupatekar0510@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Emilio Lopez <emilio@elopez.com.ar>, Linus Walleij <linus.walleij@linaro.org>, Jens Kuske <jenskuske@gmail.com>, Hans De Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 23, 2015 at 7:46 AM, Vishnu Patekar
<vishnupatekar0510@gmail.com> wrote:
> Allwinner A83T is octa-core cortex-a7 based SoC.
> It's clock control unit and prcm, pinmux are different from previous sun8i
> series.
> Its processor cores are arragned in two clusters 4 cores each,
> similar to A80.
>
> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>

Could you also update Documentation/arm/sunxi/README, so it says A83T
is supported?

Otherwise,

Acked-by: Chen-Yu Tsai <wens@csie.org>
