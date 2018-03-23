From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH v3 3/3] pinctrl: qcom: Don't allow protected pins to be
 requested
Date: Thu, 22 Mar 2018 19:16:29 -0500
Message-ID: <97380342-c3aa-5d34-7b22-f6ebbab4bafe@codeaurora.org>
References: <20180321165848.89751-1-swboyd@chromium.org>
 <20180321165848.89751-4-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180321165848.89751-4-swboyd@chromium.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On 03/21/2018 11:58 AM, Stephen Boyd wrote:
> +static int msm_gpio_init_valid_mask(struct gpio_chip *chip,
> +				    struct msm_pinctrl *pctrl)
> +{
> +	int ret;
> +	unsigned int len, i;
> +	unsigned int max_gpios = pctrl->soc->ngpios;
> +
> +	/* The number of GPIOs in the ACPI tables */
> +	ret = device_property_read_u16_array(pctrl->dev, "gpios", NULL, 0);
> +	if (ret > 0 && ret < max_gpios) {

This needs to be ret <= max_gpios, otherwise it will fail if every GPIO 
is available.

And it should print an error message and return an error code if ret > 
max_gpios.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
