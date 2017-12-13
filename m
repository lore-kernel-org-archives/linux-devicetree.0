From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 4/4] [v4] pinctrl: qcom: qdf2xxx: add support for new ACPI
 HID QCOM8002
Date: Wed, 13 Dec 2017 08:47:50 -0600
Message-ID: <fb9ca35d-4794-d528-03ae-73c4c0bd2219@codeaurora.org>
References: <1512170904-4749-1-git-send-email-timur@codeaurora.org>
 <1512170904-4749-5-git-send-email-timur@codeaurora.org>
 <CACRpkdYer_Q5R4XhWTX3=jwshcKZRSDY9=gOvSeUPsQHbUw6vw@mail.gmail.com>
 <1513076836.25007.641.camel@linux.intel.com>
 <88349f2e-5243-8061-cc72-d01fa70e6f2e@codeaurora.org>
 <1513175798.7000.15.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1513175798.7000.15.camel@linux.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, David Brown <david.brown@linaro.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Varadarajan Narayanan <varada@codeaurora.org>, Archit Taneja <architt@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 12/13/2017 08:36 AM, Andy Shevchenko wrote:
> Wait, runtime muxing is a matter of requesting another function (usually
> GPIO) and putting it back afterwards. Do you really need anything like
> this at*runtime*?

No, there is no runtime muxing on ACPI platforms.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
