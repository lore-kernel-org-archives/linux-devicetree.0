From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] ARM: ux500: remove regulator-compatible usage
Date: Tue, 17 Nov 2015 14:52:19 +0100
Message-ID: <CACRpkdYWV4FgU-ghRJyh3EO6Z5jmoMc-Q6if5tLAb83zmvrEQQ@mail.gmail.com>
References: <1443189092-16430-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443189092-16430-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 25, 2015 at 3:51 PM, Javier Martinez Canillas
<javier@osg.samsung.com> wrote:

> The regulator-compatible property from the regulator DT binding was
> deprecated and the correct approach is to use the node's name.
>
> This patch has no functional changes since the values of the node's
> name and the regulator-compatible match for all the regulators.
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Patch applied on my ux500-devicetree branch, will be in my first pull
request to ARM SoC.

Yours,
Linus Walleij
