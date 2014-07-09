From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [RFC PATCH v2 3/5] rtc: add qpnp rtc driver
Date: Wed, 09 Jul 2014 11:07:29 -0700
Message-ID: <53BD84E1.4030602@codeaurora.org>
References: <1404393243-7324-1-git-send-email-svarbanov@mm-sol.com> <1404393243-7324-4-git-send-email-svarbanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1404393243-7324-4-git-send-email-svarbanov@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, Lee Jones <lee.jones@linaro.org>, Josh Cartwright <joshc@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 07/03/14 06:14, Stanimir Varbanov wrote:
> A 32bits RTC is housed inside PMIC. The RTC driver uses QPNP
> SPMI interface to communicate with the PMIC RTC module.
>
> The RTC device is divided into two sub-peripherals:
>  - RTC read-write peripheral having basic RTC registers
>  - alarm peripheral for controlling alarm
>
> These two RTC peripherals are childrens of QPNP SPMI bus. They
> use regmap to read/write to its registers into PMIC.
>

What happened to using Josh's patch for rtc-pm8xxx.c[1]? That seems
easier than adding an entire new driver for almost the same hardware.

[1]
http://lists.infradead.org/pipermail/linux-arm-kernel/2013-October/207665.html

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
