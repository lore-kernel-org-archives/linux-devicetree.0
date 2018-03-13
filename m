From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] drivers: gpio: pca953x: add compatibility for pcal6524
 and pcal9555a
Date: Tue, 13 Mar 2018 18:56:16 +0200
Message-ID: <CAHp75Ve8Y2AOm36KwuVUhssLR7Q82KS1SzB1tcKw57_LdqkKhQ@mail.gmail.com>
References: <49f6922ba342cf69bfd2a787d0c2a93b4df2c429.1520664883.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <49f6922ba342cf69bfd2a787d0c2a93b4df2c429.1520664883.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, devicetree <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, letux-kernel@openphoenux.org, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org

On Sat, Mar 10, 2018 at 1:00 PM, H. Nikolaus Schaller <hns@goldelico.com> wrote:
> The Pyra-Handheld originally used the tca6424 but recently we have
> replaced it by the pin and package compatible pcal6524. So let's
> add this to the bindings and the driver.
>
> And while we are at it, the pcal9555a does not have a compatible entry
> either but is already supported by the device id table.


> +       { "pcal6524", 24 | PCA953X_TYPE | PCA_INT | PCA_PCAL, },
>         { "pcal9555a", 16 | PCA953X_TYPE | PCA_INT | PCA_PCAL, },

So, from your description I can get that PCA_PCAL is redundant for
6524. Is it correct? What does L means in the model code?
Perhaps we need to rename PCA_PCAL to be more specific?


> +       { .compatible = "nxp,pcal6524", .data = OF_953X(24, PCA_INT), },
> +       { .compatible = "nxp,pcal9555a", .data = OF_953X(16, PCA_INT), },

Other way around, you missed PCA_PCAL in the second case.

-- 
With Best Regards,
Andy Shevchenko
