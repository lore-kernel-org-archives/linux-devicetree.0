From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] pinctrl: qcom: ipq4019: add most other IPQ4019 pin
 functions and groups
Date: Mon, 15 May 2017 19:13:10 -0500
Message-ID: <CAL_Jsq+cXPUu_cvEKS0EfBykyYBznrfL2fYdBhKfJQXegbKMag@mail.gmail.com>
References: <d53b7a9b1bab818536680123136ac58481d959c8.1494415174.git.chunkeey@googlemail.com>
 <20170510112712.14744-1-chunkeey@googlemail.com> <20170513001037.tpqdrjh3r6aciskx@rob-hp-laptop>
 <6106539.ylfJifP948@debian64>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <6106539.ylfJifP948@debian64>
Sender: linux-gpio-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Varadarajan Narayanan <varada@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ram Chandra Jangir <rjangir@codeaurora.org>, John Crispin <john@phrozen.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 13, 2017 at 11:03 AM, Christian Lamparter
<chunkeey@googlemail.com> wrote:
> On Friday, May 12, 2017 7:10:37 PM CEST Rob Herring wrote:
>> On Wed, May 10, 2017 at 01:27:11PM +0200, Christian Lamparter wrote:
>> > This patch adds the remaining pin functions and mux groups.
>> > It also fixes a typo in the existing binding document.
>> >
>> > Cc: Varadarajan Narayanan <varada@codeaurora.org>
>> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
>> > Cc: Ram Chandra Jangir <rjangir@codeaurora.org>
>> > Cc: John Crispin <john@phrozen.org>
>> > Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
>> > ---
>> > Note: These definitions were present in the original submission
>> > <https://patchwork.kernel.org/patch/7630711/>
>> >
>> > The DT patch was acked by Rob Herring back then. However,
>> > I'm not sure if this is still valid or not. @Rob, can you
>> > please comment?
>>
>> Am I supposed to ack patch 1/2 or patch 1/2...? The first one has the
>> preferred subject prefix.
>
> This was my fault. I decided to reword the patch and changed
> the subject among a few other things. So, this patch was sent
> to the ML twice.
>
> Bjorn commented that he has some comments.
> <http://www.spinics.net/lists/devicetree/msg176168.html>
>
> Unfortunately, he didn't say what exactly needs to be changed.
> So, I'm not really sure how to proceed.
>
> @Bjorn: can you please tell what you would like to see changed?
> I see what I can do about it. I do have access two a few IPQ4019/8
> and can ask a few people to run tests.
>
> @Rob:
>
> I noticed that:
>
> qcom,apq8064-pinctrl.txt: pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-strength,
> qcom,ipq4019-pinctrl.txt: pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-strength,
> qcom,ipq8064-pinctrl.txt: pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-strength,
> qcom,msm8660-pinctrl.txt: pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-strength,
> qcom,msm8974-pinctrl.txt: pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-strength.
>
> all have the same "bias-pull,up". I think I'll just do
> a separate patch for this to stop it from spreading :D.

Please do. Send it now and I'll apply for 4.12.

Rob
