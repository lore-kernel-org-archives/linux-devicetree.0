From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/3] mfd: arizona: Update GPIO binding for newly
 supported flag
Date: Mon, 22 May 2017 12:07:58 +0100
Message-ID: <20170522110758.32hgaetvegk3dzal@dell>
References: <1494948714-15203-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1494948714-15203-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20170522110713.qhvsvq7db4j75ebu@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170522110713.qhvsvq7db4j75ebu@dell>
Sender: linux-gpio-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, gnurou@gmail.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Mon, 22 May 2017, Lee Jones wrote:

> On Tue, 16 May 2017, Charles Keepax wrote:
> 
> > Update the device tree binding to show that the new GPIO_SLEEP flags are
> > now supported in the flags field of the GPIO binding for Arizona
> > devices.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/arizona.txt | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
> > index 8f2e282..1729133 100644
> > --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> > +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> > @@ -30,7 +30,10 @@ Required properties:
> >  
> >    - gpio-controller : Indicates this device is a GPIO controller.
> >    - #gpio-cells : Must be 2. The first cell is the pin number and the
> > -    second cell is used to specify optional parameters (currently unused).
> > +    second cell is used to specify optional parameters, the following flags
> > +    are supported:
> > +      "GPIO_SLEEP_MAY_LOOSE_OUTPUT" the output of this GPIO does not need to
> > +      be maintained whilst the CODEC is in low power mode.
> 
> I guess this needs a GPIO and DT Ack.

FYI, if you receive both of those, you can also add mine without any
further intervention from me.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
