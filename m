From: Georgi Djakov <gdjakov@mm-sol.com>
Subject: Re: [PATCH v4 4/4] pinctrl: qcom: Make the target processor value
 configurable
Date: Fri, 05 Sep 2014 10:20:57 +0300
Message-ID: <54096459.7020201@mm-sol.com>
References: <1409761696-15435-1-git-send-email-gdjakov@mm-sol.com>	<1409761696-15435-5-git-send-email-gdjakov@mm-sol.com> <CACRpkdZQouNk0z1AQHbjULJXdRK07-kZDXLcnx0Xayew0fnocA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZQouNk0z1AQHbjULJXdRK07-kZDXLcnx0Xayew0fnocA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kumar Gala <galak@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Andy Gross <agross@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Grant Likely <grant.likely@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 09/04/2014 07:20 PM, Linus Walleij wrote:
> On Wed, Sep 3, 2014 at 6:28 PM, Georgi Djakov <gdjakov@mm-sol.com> wrote:
> 
>> Currently the value used to specify that interrupts from the gpio should
>> be routed to the application processor is hardcoded for all Qualcomm SoCs.
>> But the new APQ8084 SoC uses a different value. To resolve this, we make
>> this value configurable for each SoC. For all existing SoCs we continue
>> to use the current value, and only for APQ8084 we use the new value.
>>
>> Suggested-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
>> Acked-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
>> Signed-off-by: Georgi Djakov <gdjakov@mm-sol.com>
> 
> Patch applied.
> 
> Yours,
> Linus Walleij
> 

Thank you, Bjorn and Linus!
