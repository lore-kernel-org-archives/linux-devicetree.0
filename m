From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH v5 3/4] pinctrl: Qualcomm SPMI PMIC GPIO pin controller
 driver
Date: Wed, 22 Oct 2014 12:35:14 +0300
Message-ID: <1413970514.30282.8.camel@mm-sol.com>
References: <1412181058-29179-1-git-send-email-iivanov@mm-sol.com>
	 <1412181058-29179-4-git-send-email-iivanov@mm-sol.com>
	 <5446A2D8.3070204@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <5446A2D8.3070204@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Tue, 2014-10-21 at 19:15 +0100, Srinivas Kandagatla wrote:
> Hi Ivan,
> 
> Just realized that this patch can generate compiler errors due to 
> 3.18
> changes in pinmux_ops struct and gpiochip_remove returns void now.

Yes. I am just preparing new version of this for Linus.

Regards,
Ivan
