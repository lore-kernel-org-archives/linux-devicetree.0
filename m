From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] dt-bindings: staging: remove a couple of ADC bindings
Date: Mon, 30 Apr 2018 11:24:04 +0200
Message-ID: <20180430112404.35ff47eb@windsurf>
References: <20180426015754.26605-1-robh@kernel.org>
        <20180426053255.75jg5bsdu4h624jo@vireshk-i7>
        <20180426214205.22f1a543@windsurf>
        <CAL_JsqJw4-bgQOXG3_0poC5Uy8kB5Bg4mns=Uhne=LONvTX15g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJw4-bgQOXG3_0poC5Uy8kB5Bg4mns=Uhne=LONvTX15g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Roland Stigge <stigge@antcom.de>, Stefan Roese <sr@denx.de>, Jonathan Cameron <jic23@kernel.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Thu, 26 Apr 2018 21:13:17 -0500, Rob Herring wrote:

> >> >  .../bindings/staging/iio/adc/lpc32xx-adc.txt       | 16 -------------
> >> >  .../bindings/staging/iio/adc/spear-adc.txt         | 26 ----------------------
> >> >  2 files changed, 42 deletions(-)  
> >
> > We are using the spear-adc driver, which is out of staging
> > in ./drivers/iio/adc/spear_adc.c. So rather than removing its DT binding
> > entirely, it should be moved out of staging.  
> 
> Except I have comments on the spear binding and it's fair game to
> change it being in staging, right?

Sure, I don't care about binding changes. We ship the DT together with
the kernel on those SPEAr600 devices, so the DT backward compatibility
is totally useless for us, which allows to freely change the bindings.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
