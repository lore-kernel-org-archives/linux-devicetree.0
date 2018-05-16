From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 2/7] gpio: pca953x: add more register definitions for pcal953x
Date: Wed, 16 May 2018 13:51:09 +0200
Message-ID: <CACRpkdaLG_zFXjdRU0RXoUMmH2K55u4k7A+q2noww9+uNNkxjw@mail.gmail.com>
References: <cover.1524933096.git.hns@goldelico.com> <79da0e04213915b797222027bbeaebf513387e62.1524933096.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <79da0e04213915b797222027bbeaebf513387e62.1524933096.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Kumar Gala <galak@codeaurora.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Alexandre Courbot <gnurou@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org

On Sat, Apr 28, 2018 at 6:31 PM, H. Nikolaus Schaller <hns@goldelico.com> wrote:

> PCAL chips ("L" seems to stand for "latched") have additional
> registers starting at address 0x40 to control the latches,
> interrupt mask, pull-up and pull down etc.
>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Patch applied with Andy's ACK.

Yours,
Linus Walleij
