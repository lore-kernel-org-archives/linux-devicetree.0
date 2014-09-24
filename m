From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH v4 3/4] pinctrl: Qualcomm SPMI PMIC GPIO pin controller
 driver
Date: Wed, 24 Sep 2014 11:14:17 +0300
Message-ID: <1411546457.18580.50.camel@iivanov-dev>
References: <1410792254-24126-1-git-send-email-iivanov@mm-sol.com>
	 <1410792254-24126-4-git-send-email-iivanov@mm-sol.com>
	 <20140924041852.GO10179@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140924041852.GO10179@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, David Collins <collinsd@codeaurora.org>, Wu Fenglin <fenglinw@qti.qualcomm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2014-09-23 at 21:18 -0700, Bjorn Andersson wrote:
> On Mon 15 Sep 07:44 PDT 2014, Ivan T. Ivanov wrote:
> 
> > This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> > Qualcomm GPIO sub-function blocks found in the PMIC chips.
> > 
> > Signed-off-by: Ivan T. Ivanov <iivanov@mm-sol.com>
> 
> I think this looks pretty good, just some minor comments. Mostly on the future
> compatibility of the Kconfig and compatible.

Thanks.

> 
> It's much in line with what I hacked up for pm8xxx, I was just hoping to get
> something from Thomas regarding irq_read_line() before pushing it again...
> 
> > ---
> >  drivers/pinctrl/qcom/Kconfig                  |  12 +
> >  drivers/pinctrl/qcom/Makefile                 |   1 +
> >  drivers/pinctrl/qcom/pinctrl-spmi-pmic-gpio.c | 942 ++++++++++++++++++++++++++
> >  3 files changed, 955 insertions(+)
> >  create mode 100644 drivers/pinctrl/qcom/pinctrl-spmi-pmic-gpio.c

I am planing to remove pmic part from the file name.

Comments will be fixed in next version.

Thank you.
Ivan
