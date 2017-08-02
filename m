From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: keystone-k2g-evm: Add gpio nodes
Date: Wed, 2 Aug 2017 11:24:22 +0200
Message-ID: <CACRpkdYvCngFxvK6kxA5rH9C8S37Eb8LSafnXks0caAzsq+Ejg@mail.gmail.com>
References: <1501048228-3492-1-git-send-email-j-keerthy@ti.com> <1501048228-3492-2-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1501048228-3492-2-git-send-email-j-keerthy@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, fcooper@ti.com, Suman Anna <s-anna@ti.com>, "Nori, Sekhar" <nsekhar@ti.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 26, 2017 at 7:50 AM, Keerthy <j-keerthy@ti.com> wrote:

> 66AK2G has 2 instances of gpio. The first one has all the 144 GPIOs
> functional( 9 banks with 16 gpios = 144). The second instance has
> only the GPIO0:GPIO67 functional and rest are marked reserved.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Merge this through the ARM SoC tree.

Yours,
Linus Walleij
