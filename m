From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] dt-bindings: staging: remove a couple of ADC bindings
Date: Thu, 26 Apr 2018 21:42:05 +0200
Message-ID: <20180426214205.22f1a543@windsurf>
References: <20180426015754.26605-1-robh@kernel.org>
        <20180426053255.75jg5bsdu4h624jo@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180426053255.75jg5bsdu4h624jo@vireshk-i7>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Roland Stigge <stigge@antcom.de>, Stefan Roese <sr@denx.de>, Jonathan Cameron <jic23@kernel.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Thu, 26 Apr 2018 11:02:55 +0530, Viresh Kumar wrote:
> @Thomas: Do you guys use this ?
> 
> On 25-04-18, 20:57, Rob Herring wrote:
> > Remove LPC32xx and SPEAr ADC bindings in staging. They have not been
> > touched since 2012.
> > 
> > Cc: Roland Stigge <stigge@antcom.de>
> > Cc: Stefan Roese <sr@denx.de>
> > Cc: Jonathan Cameron <jic23@kernel.org>
> > Cc: Viresh Kumar <viresh.kumar@linaro.org>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > Move these out of staging please or they are going to be removed.
> > 
> >  .../bindings/staging/iio/adc/lpc32xx-adc.txt       | 16 -------------
> >  .../bindings/staging/iio/adc/spear-adc.txt         | 26 ----------------------
> >  2 files changed, 42 deletions(-)

We are using the spear-adc driver, which is out of staging
in ./drivers/iio/adc/spear_adc.c. So rather than removing its DT binding
entirely, it should be moved out of staging.

I'm not using the LPC32xx ADC, but the IIO driver is also out of
staging, so for the same reason, it would be strange to remove the DT
binding.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
