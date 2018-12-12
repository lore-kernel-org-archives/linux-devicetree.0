From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v6 10/10] soc: qcom: rpmhpd: Mark mx as a parent for cx
Date: Wed, 12 Dec 2018 09:43:13 +0530
Message-ID: <1c493bce-af67-2a4b-f903-8d39c39f7367@codeaurora.org>
References: <20181211094938.25086-1-rnayak@codeaurora.org>
 <20181211094938.25086-11-rnayak@codeaurora.org>
 <CAPDyKFof-rkzmzibWOrAhDFysU=y+C8Bp0cK=_iht4=vmv-0vw@mail.gmail.com>
 <00d91f90-ccf1-3486-0d42-0c4105058e61@codeaurora.org>
 <154456502486.17204.11345601448030201032@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154456502486.17204.11345601448030201032@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, David Collins <collinsd@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>, DTML <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


[]...

>>>> This is used to enforce a requirement that exists for various
>>>> hardware blocks on SDM845 that MX performance state >= CX performance
>>>> state for a given operating frequency.
>>>
>>> I assume that also means the MX power domain must not be power off as
>>> long as the CX power domain is powered on?
>>
>> So with rpmh, there's really no separate on/off control, we just put
>> it in the lowest perf state at off.
> 
> I think in theory the answer is MX can't be off if CX is on, but in
> reality, MX and CX are never turned off, just set to something really
> low and even then the constraint applies for MX >= CX. Is that right?

to some extent, let me clarify this a bit more. rpmh is the central entity
controlling these rails and takes a final call on when it can or cannot
be 'really' off and when its turned on, at what level it should be set to.

CPU is just one of the entities 'voting' on them. Now legacy platforms which
had rpm (like msm8996) did have separate control to send a
on/off vote and a performance level vote. With rpmh, its just that there
is no separate message that you send to rpmh for OFF, its just mapped to
the lowest perf level. So think of it as the lowest perf level is mapped to
a '0' which is same as OFF.

So when you say 'MX can't be off if CX is on', yes MX can't be at the lowest
level '0', while CX is at something higher.

>>> Just to make sure there are no conflicting hierarchical constraints
>>> between idle management and performance state management!?
>>>
> 
> I'm not sure what idle states mean to the CX and MX domains. Would it be
> some sort of idle state governor attached at genpd creation time that
> would adjust the main SoC power rails when all devices attached are
> idle? Maybe I don't understand how idle states are different from
> performance states.
> My understanding is that devices using these domains would almost always
> expect their clk frequency and clk on/off state to decide what the
> performance state is, unless they need to ignore clk state because they
> aren't managing clks and bump up the voltage directly when the device is
> active. Either way, devices are actively managing the voltage they need
> these voltage domains to operate at by using the genpd performance
> states APIs.

I am not quite sure whats the point that you are trying to make here,
but this is what I would expect the users of these genpds to do,
regardless of if they have a clk dependency or not.
When the device is active, vote for a performance state they need
then request for the genpd to be on. When they are idle, request for the
genpd to be turned off.
  
