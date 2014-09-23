From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4 v5] GPIO: gpio-dwapb: Enable platform driver binding
 to MFD driver
Date: Tue, 23 Sep 2014 14:09:28 +0200
Message-ID: <CACRpkdaczdSkygXzbwcAudf3hPLbSwrZB7zLysHZrkTyx3g=Bw@mail.gmail.com>
References: <1410970722-8579-1-git-send-email-alvin.chen@intel.com>
	<1410970722-8579-2-git-send-email-alvin.chen@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1410970722-8579-2-git-send-email-alvin.chen@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Weike Chen <alvin.chen@intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, atull <atull@opensource.altera.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Boon Leong Ong <boon.leong.ong@intel.com>, Hock Leong Kweh <hock.leong.kweh@intel.com>, Darren Hart <dvhart@linux.intel.com>, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, Mika Westerberg <mika.westerberg@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 17, 2014 at 6:18 PM, Weike Chen <alvin.chen@intel.com> wrote:

> The Synopsys DesignWare APB GPIO driver only supports open firmware devices.
> But, like Intel Quark X1000 SOC, which has a single PCI function exporting
> a GPIO and an I2C controller, it is a Multifunction device. This patch is
> to enable the current Synopsys DesignWare APB GPIO driver to support the
> Multifunction device which exports the designware GPIO controller.
>
> Reviewed-by: Hock Leong Kweh <hock.leong.kweh@intel.com>
> Signed-off-by: Weike Chen <alvin.chen@intel.com>

OK no further comments, patch applied.

Yours,
Linus Walleij
