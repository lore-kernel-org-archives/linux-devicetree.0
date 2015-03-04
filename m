From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [PATCH v3 3/3] pinctrl: qcom: Add msm8916 pinctrl driver
Date: Wed, 04 Mar 2015 11:44:35 +0200
Message-ID: <54F6D403.3040709@mm-sol.com>
References: <1422612241-12944-1-git-send-email-svarbanov@mm-sol.com> <1422612241-12944-4-git-send-email-svarbanov@mm-sol.com> <20150203164748.GA29190@qualcomm.com> <54D22F05.9050403@mm-sol.com> <CACRpkdYj_t15wxXzhHMGo-kb=o1HNaMEV07G1dr7XPYCZv=WNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYj_t15wxXzhHMGo-kb=o1HNaMEV07G1dr7XPYCZv=WNQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Gross <agross@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Joonwoo Park <joonwoop@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 03/02/2015 04:40 PM, Linus Walleij wrote:
> On Wed, Feb 4, 2015 at 3:39 PM, Stanimir Varbanov <svarbanov@mm-sol.com> wrote:
>> On 02/03/2015 06:47 PM, Andy Gross wrote:
>>> On Fri, Jan 30, 2015 at 12:04:01PM +0200, Stanimir Varbanov wrote:
>>>> From: Joonwoo Park <joonwoop@codeaurora.org>
>>>>
>>>> Add initial pinctrl driver to support pin configuration with
>>>> pinctrl framework for msm8916.
>>>>
>>>> Signed-off-by: Joonwoo Park <joonwoop@codeaurora.org>
>>>> Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
>>>> Reviewed-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
>>>
>>> Looks good.
>>>
>>> Reviewed-by: Andy Gross <agross@codeaurora.org>
>>>
>>
>> Linus, do you want me to resend the patchset including this Reviewed-by tag?
> 
> 1/3 is already merged upstream.
> 
> 2/3 has an unaddressed review comment. Please fix that and resent.
> 
> So this 3/3 can be resent as well, with the Review tag.
> 
> But it's down to just two patches now atleast.

Sure, will resend it as a new patch set, thanks. And of course you are
talking for "[PATCH 0/3] pinctrl: qcom: enable generic pinconf and
input-enable" patch set.

-- 
regards,
Stan
