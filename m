From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 2/3] gpio: pca953x: define masks for addressing common
 and extended registers
Date: Wed, 23 May 2018 13:47:29 +0200
Message-ID: <CACRpkdZepB55eBfrJzvxQxa9w9YPN00esUoE43SszaYCeMrAeA@mail.gmail.com>
References: <cover.1526533188.git.hns@goldelico.com> <2fe132b534a4b1ca717932e78cc3cdae5aacba0d.1526533188.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2fe132b534a4b1ca717932e78cc3cdae5aacba0d.1526533188.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Kumar Gala <galak@codeaurora.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Alexandre Courbot <gnurou@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org

On Thu, May 17, 2018 at 6:59 AM, H. Nikolaus Schaller <hns@goldelico.com> wrote:

> These mask bits are to be used to map the extended register
> addreseses (which are defined for an unsupported 8-bit pcal chip)
> to 16 and 24 bit chips (pcal6524).
>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Patch applied.

Yours,
Linus Walleij
