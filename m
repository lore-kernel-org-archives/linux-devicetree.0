From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: Add a ngpios-ranges property
Date: Thu, 11 Jan 2018 10:36:38 -0600
Message-ID: <73078b7c-c3dd-0927-a82a-fb9369f5b576@codeaurora.org>
References: <20180110015848.11480-1-sboyd@codeaurora.org>
 <20180110015848.11480-3-sboyd@codeaurora.org>
 <CACRpkdaN6vmV4L4U76DvD5BN+j1RYCQakTysA+GGPdT8Chc-iw@mail.gmail.com>
 <CACxGe6vA652LCosMc+AsQ2Gb_mgiApx+Gxu9judXnO_p3AFcsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACxGe6vA652LCosMc+AsQ2Gb_mgiApx+Gxu9judXnO_p3AFcsw@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 01/11/2018 10:33 AM, Grant Likely wrote:
> What level of access control is implemented here? Is there access
> control for each GPIO individually, or is it done by banks of GPIOs?
> Just asking to make sure I understand the problem domain.

On our ACPI system, it's specific GPIOs.  Each GPIO is in its own 64k 
page, which is what allows us to block specific ones.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
