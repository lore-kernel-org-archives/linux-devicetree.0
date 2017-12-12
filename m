From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 4/4] [v4] pinctrl: qcom: qdf2xxx: add support for new ACPI
 HID QCOM8002
Date: Tue, 12 Dec 2017 14:27:10 -0600
Message-ID: <88349f2e-5243-8061-cc72-d01fa70e6f2e@codeaurora.org>
References: <1512170904-4749-1-git-send-email-timur@codeaurora.org>
 <1512170904-4749-5-git-send-email-timur@codeaurora.org>
 <CACRpkdYer_Q5R4XhWTX3=jwshcKZRSDY9=gOvSeUPsQHbUw6vw@mail.gmail.com>
 <1513076836.25007.641.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1513076836.25007.641.camel@linux.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, David Brown <david.brown@linaro.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Varadarajan Narayanan <varada@codeaurora.org>, Archit Taneja <architt@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 12/12/2017 05:07 AM, Andy Shevchenko wrote:

> Not ACPI standards as of my knowledge. ACPI standard defines a common
> scheme how to define properties, it doesn't tell anything about property
> names or any mappings between names to values or names to "OS
> subsystem").

There was an attempt a while back to standardize this like we do for 
device tree, but it fell apart.  Device-specific ACPI-only properties 
are not standarized.  This driver is initialized only on ACPI systems. 
It has no device tree binding.

> As for GPIO we just follow *de facto* what DT has right now, i.e. "xxx-
> gpio" or "xxx-gpios" pattern is used to map ACPI standard resource to a
> GPIO name. That's how GPIO ACPI lib is being developed.

GPIOs in device tree are defined completely differently than in ACPI. 
On DT, the kernel controls the pin muxing.  On ACPI, pins are muxed by 
firmware and never re-muxed by the operating system.  So all this driver 
does is expose a few pins as simple GPIOs.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
