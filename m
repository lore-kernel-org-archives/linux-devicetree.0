From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 10/10] arm: dts: genmai: Add ethernet pin group
Date: Fri, 28 Apr 2017 10:49:32 +0200
Message-ID: <CACRpkdaiDMxaGM=vqeqVQ-6i3ecYhc+pudy4yt4zAZW-XZ4vCw@mail.gmail.com>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org> <1493281194-5200-11-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1493281194-5200-11-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 27, 2017 at 10:19 AM, Jacopo Mondi
<jacopo+renesas@jmondi.org> wrote:

> Add pin configuration subnode for ETHER ethernet controller.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
(...)
> +               pins_bidir {
> +                       pinmux = <RZA1_PINMUX(3, 3, 2)>;/* P3_3 = ET_MDIO  */
> +                       bi-directional;
> +               };

So I'm against merging this until someone explains what "bi-directional"
actually means, electrically speaking. What happens physically on this pin?

I think this just means open drain.

It is dangerous to merge things we don't understand.

Surely someone inside Renesas can answer this question.

Yours,
Linus Walleij
