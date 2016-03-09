From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] gpio: dt-bindings: Declare gpio-hog optional for GPIO subnodes
Date: Wed, 9 Mar 2016 11:07:25 +0700
Message-ID: <CACRpkdaem3OOP_TrZsUajxOB0ftYgLmcSr6LtFJpqN-4ETPe0A@mail.gmail.com>
References: <1456214089-13954-1-git-send-email-mpa@pengutronix.de>
	<1456214089-13954-3-git-send-email-mpa@pengutronix.de>
	<20160223232534.GA29637@rob-hp-laptop>
	<1813679.JaFRxta3v8@adelgunde>
	<20160302154120.GA23716@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160302154120.GA23716@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Markus Pargmann <mpa@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 2, 2016 at 10:41 PM, Rob Herring <robh@kernel.org> wrote:

> Requiring removing the gpio-hog to add a specific
> binding is a problem. AIUI, a hog will prevent any other user in the
> kernel. I think that is backwards in that a hog should only provide some
> default configuration/use.

I think there is some misunderstanding here.

- HOGS are done to hook a line up in a way so that
  it is *used* for something, such as biasing a MMC CD line
  in this example from arch/arm/boot/dts/ste-nomadik-s8815.dts:

        gpio3: gpio@101e7000 {
                /* This hog will bias the MMC/SD card detect line */
                mmcsd-gpio {
                        gpio-hog;
                        gpios = <16 0x0>;
                        output-low;
                        line-name = "card detect bias";
                };
        };

   So it's not like this line is "unused" or something.

- For the case when we want to just set up some default values
  in some registers for a GPIO line and just leave it for whatever
  consumer may turn up (whether a driver or e.g. userspace), we
  have had proposals for
  setting up initial values from the DT, using essentially the hog
  syntax but with another bool than "gpio-hog" obviously,
  "gpio-initval" or just leaving it blank was suggested in the former
  thread. (See switch discussion.)

So my view is if we want just initial configuration of lines, then handle
that separately, do not try to change the semantic meaning of the
hogs to be something else, let hogs be hogs.

Yours,
Linus Walleij
