From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 2/3] pinctrl: bcm2835: Add support for generic pinctrl binding
Date: Thu, 26 Apr 2018 14:24:29 +0200
Message-ID: <CACRpkdZDcqdntPdVss5YvvrhKLOcWhtX73_kSHCYiRM4Rfb01A@mail.gmail.com>
References: <f500b25c-eea0-9f01-7d7b-5a9dd90c50fa@castello.eng.br>
 <1523422726-7910-1-git-send-email-matheus@castello.eng.br> <1523422726-7910-3-git-send-email-matheus@castello.eng.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523422726-7910-3-git-send-email-matheus@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Matheus Castello <matheus@castello.eng.br>, Stephen Warren <swarren@wwwdotorg.org>
Cc: Rob Herring <robh@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 11, 2018 at 6:58 AM, Matheus Castello
<matheus@castello.eng.br> wrote:

> To keep driver up to date we add generic pinctrl binding support, which covers
> the features used in this driver and has additional node properties that this
> SoC has compatibility, so enabling future implementations of these properties
> without the need to create new node properties in the device trees.
>
> The logic of this change maintain the old brcm legacy binding support in order
> to keep the ABI stable.
>
> Signed-off-by: Matheus Castello <matheus@castello.eng.br>

Looking good, just need to address Stefan's comments.

(I already merged patch 1 so you do not need to resend this.)

The driver is kind of part of what Stefan and Eric maintains but
it would be nice to get a nod from Stephen Warren as well
as in my mind he is also maintainer for this. Please include him
on subsequent postings as well.

Yours,
Linus Walleij
