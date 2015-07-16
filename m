From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: Accept standard function, pins and
 groups properties
Date: Thu, 16 Jul 2015 11:06:07 +0200
Message-ID: <CACRpkdaZLmDxbs3P-pV7SWnTWHoDa82mYH4Sjg3D3oR=DJizQA@mail.gmail.com>
References: <1435652997-25254-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1435652997-25254-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 30, 2015 at 10:29 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:

> The "function", "pins" and "groups" pinmux and pinctrl properties have
> been standardized. Support them in addition to the custom "renesas,*"
> properties. New-style and old-style properties can't be mixed in DT.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Patch applied.

Yours,
Linus Walleij
