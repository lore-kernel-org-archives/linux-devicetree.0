From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH RESEND v2 1/4] pinctrl: Update Qualcomm pm8xxx GPIO parameters
 definitions
Date: Wed, 23 Jul 2014 14:46:45 -0700
Message-ID: <53D02D45.50000@codeaurora.org>
References: <1405610748-7583-5-git-send-email-iivanov@mm-sol.com>  <1405626085-14069-1-git-send-email-iivanov@mm-sol.com>  <20140722214643.GH19700@sonymobile.com>  <1406119669.28520.10.camel@iivanov-dev> <1406131556.2585.42.camel@iivanov-dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1406131556.2585.42.camel@iivanov-dev>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 07/23/14 09:05, Ivan T. Ivanov wrote:
>
>> both on
>>> pm8xxx and qpnp-pin there are two different HW blocks, one for GPIO and one for
>>> MPP. And if you look in your pinconf_set function you will see that they are
>>> very different.
> I bet that the hardware blocks are almost identical, just register
> map is different.

The hardware is different and not "almost identical". If it was the same
then we would have called them all GPIOs or MPPs and not had a distinction.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
