From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: rcar: Add r8a7791 support to the DT bindings
Date: Fri, 29 Nov 2013 21:17:39 +0100
Message-ID: <CACRpkdb5u46DVjfw_90Abpo06d_qRwMGUhhvx4HHUjG86WNOpA@mail.gmail.com>
References: <1385756097-6627-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1385756097-6627-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 29, 2013 at 9:14 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:

> The r8a7791 (R-Car M2) has a GPIO controller with additional features
> compared to the generic renesas,gpio-rcar compatible devices. Add a
> model-specific string to let the driver enable these features.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

OK nothing controversial, patch applied.

Yours,
Linus Walleij
