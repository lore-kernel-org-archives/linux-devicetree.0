From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 6/6] ARM: brcmstb: Add default gpio number
Date: Tue, 2 Jun 2015 15:41:58 +0200
Message-ID: <CACRpkdYYkPxm_K82YnzYDKDv4sFODCkQFVck_M=y6sBehmy7qg@mail.gmail.com>
References: <1432865650-4062-1-git-send-email-gregory.0xf0@gmail.com>
	<1432865650-4062-7-git-send-email-gregory.0xf0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432865650-4062-7-git-send-email-gregory.0xf0@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory Fong <gregory.0xf0@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Brian Norris <computersforpeace@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

On Fri, May 29, 2015 at 4:14 AM, Gregory Fong <gregory.0xf0@gmail.com> wrote:

> Out of the brcmstb SoCs that I know, BCM3390 has the largest numbers
> of GPIOs, with its
> - 320 "peripheral" GPIOs
> - 5*32 = 160 UPG GPIOs (counting unused lines, which do get counted)
> - 2*32 = 64 UPG AON GPIOs (counting unused lines)
> Total: 544
>
> I suspect that the upper limit will only need to be higher in the
> future, so set it to 1024.
>
> Signed-off-by: Gregory Fong <gregory.0xf0@gmail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
