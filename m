From: Georgi Djakov <gdjakov@mm-sol.com>
Subject: Re: [PATCH v1 1/3] pinctrl: qcom: Add APQ8084 pinctrl support
Date: Wed, 20 Aug 2014 23:30:15 +0300
Message-ID: <53F50557.5070109@mm-sol.com>
References: <1408468936-12252-1-git-send-email-gdjakov@mm-sol.com> <1408468936-12252-2-git-send-email-gdjakov@mm-sol.com> <20140820043929.GH7070@sonymobile.com> <20140820154200.GA14731@qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140820154200.GA14731@qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "galak@codeaurora.org" <galak@codeaurora.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "iivanov@mm-sol.com" <iivanov@mm-sol.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 20.08.14 18:42, Andy Gross wrote:
> On Tue, Aug 19, 2014 at 09:39:30PM -0700, Bjorn Andersson wrote:
>> On Tue 19 Aug 10:22 PDT 2014, Georgi Djakov wrote:
>>
>>> This patch adds support for the TLMM (Top-Level Mode Mux) block found
>>> in the APQ8084 platform.
>>>
>> [...]
>>> +
>>> +#define NUM_GPIO_PINGROUPS 143
>>> +
>>
>> I think this looks good overall, but in my APQ8084 documentation
>> (80-NG550-2X Rev. B) there are 147 (0..146) gpio pins in the TLMM block.
>>
>> Any suggestion to why there's a discrepancy?
>>
> 
> We have some discrepancies internally on the documentation.  However, in this
> case I'd expect the OEM documentation to be correct.  So this needs to change to
> bjorn's version, as it appears to be the correct version.
> 
> I have no idea why some pins are missing.
> 

Thank you for reviewing, Bjorn and Andy. I'll update and submit v2.

BR,
Georgi
