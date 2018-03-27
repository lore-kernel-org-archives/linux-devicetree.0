From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drivers: gpio: pca953x: add compatibility for pcal6524
 and pcal9555a
Date: Tue, 27 Mar 2018 15:02:03 +0200
Message-ID: <CACRpkdYfk7P0+Ysy43HboBe0Z66vO3COXRgUGaZ7Y9sSDh+yxA@mail.gmail.com>
References: <49f6922ba342cf69bfd2a787d0c2a93b4df2c429.1520664883.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <49f6922ba342cf69bfd2a787d0c2a93b4df2c429.1520664883.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org

On Sat, Mar 10, 2018 at 12:00 PM, H. Nikolaus Schaller
<hns@goldelico.com> wrote:

> The Pyra-Handheld originally used the tca6424 but recently we have
> replaced it by the pin and package compatible pcal6524. So let's
> add this to the bindings and the driver.
>
> And while we are at it, the pcal9555a does not have a compatible entry
> either but is already supported by the device id table.
>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Patch applied with Rob's review tag.

If there are any further concerns from the discussion with Andy,
please follow up with additional patches if need be, thanks!

Yours,
Linus Walleij
