From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drivers: gpio: pca953x: add compatibility for pcal6524
 and pcal9555a
Date: Sun, 18 Mar 2018 07:48:26 -0500
Message-ID: <20180317234320.ahqlhzjzxco7xnyb@rob-hp-laptop>
References: <49f6922ba342cf69bfd2a787d0c2a93b4df2c429.1520664883.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <49f6922ba342cf69bfd2a787d0c2a93b4df2c429.1520664883.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org

On Sat, Mar 10, 2018 at 12:00:01PM +0100, H. Nikolaus Schaller wrote:
> The Pyra-Handheld originally used the tca6424 but recently we have
> replaced it by the pin and package compatible pcal6524. So let's
> add this to the bindings and the driver.
> 
> And while we are at it, the pcal9555a does not have a compatible entry
> either but is already supported by the device id table.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 2 ++

Reviewed-by: Rob Herring <robh@kernel.org>

>  drivers/gpio/gpio-pca953x.c                             | 4 ++++
>  2 files changed, 6 insertions(+)
