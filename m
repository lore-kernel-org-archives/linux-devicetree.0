From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH v3 2/6] pinctrl: Introduce pinctrl driver for Qualcomm
 SSBI PMIC's
Date: Wed, 20 Aug 2014 14:28:44 -0700
Message-ID: <20140820212843.GB16274@sonymobile.com>
References: <1407771634-14946-1-git-send-email-iivanov@mm-sol.com>
 <1407771634-14946-3-git-send-email-iivanov@mm-sol.com>
 <53F456F3.3000309@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53F456F3.3000309@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: "Ivan T. Ivanov" <iivanov@mm-sol.com>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed 20 Aug 01:06 PDT 2014, Srinivas Kandagatla wrote:

> Hi Bjorn,
> 

Hi Srinivas,

Thanks for the testing. I'm reworking the driver to incorporate yours, Linus'
and Ivans feedback.

> Two things which I noticed while trying out this driver to drive a reset
> line.
> 
> 1> gpio numbering for pinconf vs gpio are not consistent, they differ by
> an offset of 1.
> 

After scratching my head regarding this I now see that there's a off by one in
most of the gpio functions. I've rewroked this to make more sense now.

The gpio numbers has to start at 1, as all documentation is based on that.

[...]
> 
> 2> Looking back at v3.4 kernel, for gpio modes, BIT(0) of bank 0 is set
> to enable gpio mode. without this bit driver does not work for output pins.
> 

Thanks, I missed that.

Unfortunately, setting that bit results in input not working - the interrupt
bits are never set for gpios that have that bit set. I'm trying to figure out
why this is the case before sending out the new version...

Regards,
Bjorn
