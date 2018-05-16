From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 2/3] pinctrl: bcm2835: Add support for generic pinctrl binding
Date: Wed, 16 May 2018 14:00:57 +0200
Message-ID: <CACRpkdZL2_j93=+x_NM-5SzxxoHn6m4LYnfb-k9=5wQ-Oi6NVA@mail.gmail.com>
References: <1525030092-3643-3-git-send-email-matheus@castello.eng.br>
 <1525135334-28506-1-git-send-email-matheus@castello.eng.br> <1525135334-28506-2-git-send-email-matheus@castello.eng.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525135334-28506-2-git-send-email-matheus@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Matheus Castello <matheus@castello.eng.br>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 1, 2018 at 2:42 AM, Matheus Castello
<matheus@castello.eng.br> wrote:

> To keep driver up to date we add generic pinctrl binding support, which
> covers the features used in this driver and has additional node properties
> that this SoC has compatibility, so enabling future implementations of
> these properties without the need to create new node properties in the
> device trees.
>
> The logic of this change maintain the old brcm legacy binding support in
> order to keep the ABI stable.
>
> Signed-off-by: Matheus Castello <matheus@castello.eng.br>
> Reviewed-by: Eric Anholt <eric@anholt.net>

Patch applied with Stefan's ACK!

Yours,
Linus Walleij
