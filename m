From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 3/3] pinctrl: qcom: Don't allow protected pins to be
 requested
Date: Thu, 25 Jan 2018 13:51:35 -0800
Message-ID: <20180125215135.GY28313@codeaurora.org>
References: <20180110015848.11480-1-sboyd@codeaurora.org>
 <20180110015848.11480-4-sboyd@codeaurora.org>
 <f384a6c4-57a5-df18-862c-bf7dad9ea3f4@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f384a6c4-57a5-df18-862c-bf7dad9ea3f4@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/22, Timur Tabi wrote:
> On 1/9/18 7:58 PM, Stephen Boyd wrote:
> >+		ret = device_property_read_u16_array(pctrl->dev, "gpios", tmp,
> >+						     len);
> >+		if (ret < 0) {
> >+			dev_err(pctrl->dev, "could not read list of GPIOs\n");
> >+			kfree(tmp);
> >+			return ret;
> >+		}
> 
> Just FYI, I'm still going to have to parse "gpios" in my
> pinctrl-qdf2xxx.c driver, even though you're also parsing it here.
> That's because I need to make sure that the msm_pingroup array only
> contains "approve" addresses in its ctl_reg fields.
> 
> +	for (i = 0; i < avail_gpios; i++) {
> +		unsigned int gpio = gpios[i];
> +
> +		groups[gpio].npins = 1;
> +		snprintf(names[i], NAME_SIZE, "gpio%u", gpio);
> +		pins[gpio].name = names[i];
> +		groups[gpio].name = names[i];
> +
> +		groups[gpio].ctl_reg = 0x10000 * gpio;
>  		       ^^^^
> 
> I do this because I need to make sure that "unapproved" physical
> addresses are never store anywhere in groups[].  That way, it's
> impossible for the driver to cause an XPU violation -- the worst
> that can happen is a null pointer dereference.
> 

Sorry I don't get it. Is that some sort of hardening requirement?
If the framework doesn't cause those pins to be touched I fail to
see how it could hurt to have the other addresses listed. I'm
sure with some effort protected addresses could be crafted in
other ways to cause an XPU violation to the same place.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
