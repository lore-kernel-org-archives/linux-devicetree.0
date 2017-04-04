From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 5/7] mfd: Add Device Tree bindings document for TI
 tps6105x chip
Date: Tue, 4 Apr 2017 09:27:39 +0100
Message-ID: <20170404082739.6w6ltgdr2mgaqq4l@dell>
References: <20170401071854.23198-1-javier@osg.samsung.com>
 <20170401071854.23198-6-javier@osg.samsung.com>
 <20170403111540.7k3rjucvcxe5cunf@dell>
 <b1118a87-9b39-bb04-d43e-f8f2b366904b@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b1118a87-9b39-bb04-d43e-f8f2b366904b@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, 03 Apr 2017, Javier Martinez Canillas wrote:

> Hello Lee,
> 
> On 04/03/2017 07:15 AM, Lee Jones wrote:
> 
> [snip]
> 
> >> +
> >> +The TP61050/TPS61052 is a high-power "white LED driver". This boost converter
> >> +is also used for other things than white LEDs, and also contains a GPIO pin.
> > 
> > What functions does it offer?
> >
> 
> Same comment than before, I'm not really familiar with this driver. But I'll
> look what are the MFD cell instantiated to better understand dev functions
> and expand this documentation accordingly.

Writing documentation for H/W you are unfamiliar with is a bad idea IMHO.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
