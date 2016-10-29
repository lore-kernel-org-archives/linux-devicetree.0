From: Michael Scott <michael.scott@linaro.org>
Subject: Re: [PATCH V2] pinctrl: qcom: Add msm8994 pinctrl driver
Date: Sat, 29 Oct 2016 09:32:09 -0700
Message-ID: <425e9cd8-5df5-bd74-90ff-ab28ff05ccb7@linaro.org>
References: <20161026233228.15219-1-michael.scott@linaro.org>
 <CACRpkda9fcUjtEuezEa-DdU_Q_OcE-kArRpY7RGp+aTFWWf=rA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkda9fcUjtEuezEa-DdU_Q_OcE-kArRpY7RGp+aTFWWf=rA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Joonwoo Park <joonwoop@codeaurora.org>, Jeremy McNicoll <jeremymc@redhat.com>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Resending: The mailing lists bounced due me being silly and replying on 
my phone.

Please reply to this email instead of the last one.

On 10/29/2016 01:27 AM, Linus Walleij wrote:
> On Thu, Oct 27, 2016 at 1:32 AM, Michael Scott <michael.scott@linaro.org> wrote:
>
>> Initial pinctrl driver for QCOM msm8994 platforms.
>>
>> In order to continue the initial board support for QCOM msm8994/msm8992
>> presented in patches from Jeremy McNicoll <jeremymc@redhat.com>, let's put
>> a proper pinctrl driver in place.
>>
>> Currently, the DT for these platforms uses the msm8x74 pinctrl driver to enable
>> basic UART.  Beyond the first few pins the rest are different enough to justify
>> it's own driver.
>>
>> Note: This driver is also be used by QCOM's msm8992 platform as it's TLM block
>> is the same.
>>
>> - Initial formatting and style was taken from the msm8x74 pinctrl driver added
>>    by Björn Andersson <bjorn.andersson@linaro.org>
>> - Data was then adjusted per QCOM MSM8994 documentation for Top Level Multiplexing
>> - Bindings documentation was based on qcom,msm8996-pinctrl.txt by
>>    Joonwoo Park <joonwoop@codeaurora.org> and then modified for msm8994 content
>>
>> Signed-off-by: Michael Scott <michael.scott@linaro.org>
>> ---
>>
>> V1 -> V2: fixed missing FUNCTION(nav_pps) and removed 3 odd newlines between blsp_i2c4_groups and cci_timer0_groups
> Looks fine to me, just like the other Qcom drivers.
>
> I just want Björn Andersson's ACK before merging, Björn?

FYI: I asked Stephen if he could find someone else with tech docs to do 
a data review.  This may or may not happen depending on the internal 
interest level and/or current work load.  It will probably take a week 
or so to get sorted out.

Worst case is no extra set of eyes on the data, and as issues are found 
we can fix them in follow up patches.  The driver works for the current 
msm8994 patches submitted by Jeremy.

Michael Scott

>
> Yours,
> Linus Walleij
