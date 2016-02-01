From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 03/14] clk: sunxi: add bus gates for A83T
Date: Mon, 1 Feb 2016 09:03:44 -0600
Message-ID: <20160201150344.GA4947@rob-hp-laptop>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
 <1454203266-4450-4-git-send-email-vishnupatekar0510@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454203266-4450-4-git-send-email-vishnupatekar0510@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: corbet@lwn.net, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, maxime.ripard@free-electrons.com, linux@arm.linux.org.uk, emilio@elopez.com.ar, jenskuske@gmail.com, hdegoede@redhat.com, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, mturquette@baylibre.com, sboyd@codeaurora.org, patchesrdh@mveas.com, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Jan 31, 2016 at 09:20:55AM +0800, Vishnu Patekar wrote:
> A83T has similar bus gates that of H3, including single gating register has
> different clock parent.
> 
> As per H3 and A83T datasheet, usbhost is under AHB2.
> 
> However,below shows allwinner source code assignment:
> bits: 26 (ehci0), 27 (ehci1), 29 (ohci0) => AHB1 for A83T.
> bits: 26 (ehci0), 27 (ehci1) => AHB1 for H3
> bits  29, 30, 31(ohci0,1,2) => AHB2 for H3.
> 
> until, this confusion is cleared keep it H3 way.
> 
> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt | 1 +
>  drivers/clk/sunxi/clk-sun8i-bus-gates.c           | 2 ++
>  2 files changed, 3 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
