From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 4/4] DTS: Bindings: pca953x: add example how to use
 interrupt-controller and gpio-controller
Date: Fri, 13 Apr 2018 10:18:42 -0500
Message-ID: <CAL_JsqJe+guBSWShfBYDf2Jbwa7ue=gU1jgrOVeiRJZj1f0J5A@mail.gmail.com>
References: <cover.1523376423.git.hns@goldelico.com> <95fa67c09ef009675f6989662b657b6c8b9ac839.1523376423.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <95fa67c09ef009675f6989662b657b6c8b9ac839.1523376423.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org

On Tue, Apr 10, 2018 at 11:07 AM, H. Nikolaus Schaller
<hns@goldelico.com> wrote:
> It is not completely obvious that these are required and
> how to use them. So we provide a tested example.
>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  .../devicetree/bindings/gpio/gpio-pca953x.txt      | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
