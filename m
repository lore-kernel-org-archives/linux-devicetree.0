From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/2] GPIO: add single-register GPIO via CREG driver
Date: Wed, 10 Oct 2018 09:21:41 +0200
Message-ID: <CACRpkdbgOqXdKMnhMVHPsM-YzL5A4R03C+SPRxE4s5zEKW3aKA@mail.gmail.com>
References: <20180928131531.4598-1-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180928131531.4598-1-Eugeniy.Paltsev@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eugeniy.Paltsev@synopsys.com
Cc: "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vineet Gupta <vineet.gupta1@synopsys.com>, Alexey Brodkin <alexey.brodkin@synopsys.com>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 28, 2018 at 3:15 PM Eugeniy Paltsev
<Eugeniy.Paltsev@synopsys.com> wrote:

> Add single-register MMIO GPIO driver for complex cases where
> only several fields in register belong to GPIO lines and each GPIO
> line owns a field with different length and on/off value.
>
> Such CREG GPIOs are used in Synopsys AXS10x and HSDK boards.
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
> Changes v3->v4:
>  * Cleanup 'include' section.
>  * Get rid of 'of_mm_gpio_chip' using.
>  * Get rid of custom 'creg_gpio_xlate' function.
>  * Get rid of dummy 'creg_gpio_get_direction' function.
>  * Small fixies.

Patch applied.

Yours,
Linus Walleij
