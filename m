From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 4/4] regulator: qcom: Rework to single platform device
Date: Wed, 04 Mar 2015 17:46:25 -0800
Message-ID: <54F7B571.7090705@codeaurora.org>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com> <1425356740-26285-5-git-send-email-bjorn.andersson@sonymobile.com> <54F75E8F.2070900@codeaurora.org> <20150305003004.GZ21293@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20150305003004.GZ21293@sirena.org.uk>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/04/15 16:30, Mark Brown wrote:
> On Wed, Mar 04, 2015 at 11:35:43AM -0800, Stephen Boyd wrote:
>
>> There's another problem with this of_parse_cb design. The regulator
>> framework requires supplies to be registered before consumers of the
>> supplies are registered. So when we register L23 we need to make sure
>> it's supply is already registered (S8 for example). If we used
>> of_regulator_match() we could sort the array by hand so that we always
>> register the supplies first. Or we could modify the regulator framework
>> to have a concept of "orphaned" supplies like the clock framework has so
>> that when a regulator is registered it waits until its supply is registered.
> Dependency resolution isn't anything new, I'm not sure why you think
> this is related to of_parse_cb()?  Open coding does exactly the same
> thing and the ability to have device specific properties on is not
> obviously related to dependency resolution so perhaps I'm
> misunderstanding what you're talking about...

I was just using of_parse_cb to indicate the difference from
of_regulator_match(). I could have said "between your design and my design".

>
> If you *are* talking about dependency resolution then just bulk
> registering the regulators (which we should be doing anyway) and then
> iterating the array until we stop making progress should do the trick
> for most cases, normally there's only one PMIC in play, or have people
> who care do a single struct device per regulator and then let the probe
> deferral stuff sort it out.

Yeah I think the brute force, keep trying approach will work for now if
we can't add orphan support to regulator core. I'm not aware of any
circular dependencies for these platforms.

>
> I'm a bit nervous of the idea of having orphaning without core support,
> it's not just inter regulator dependencies we need to worry about (they
> use GPIOs and so on) and there's concerns about debuggability but it is
> the kind of thing probe deferral was meant to be a cheap implementation
> of.  There was a proposal quite recently from someone at Samsung Poland
> to do something more coreish and basically split registrations in two,
> one half registering the things needed for each resource and then a
> second half which runs once the required resources are registered.
> Pushing that along might be best, it's a more general approach.  The
> component stuff Russell did has some similarities here.

Ah you're talking about the res track stuff[1]? That patchset seemed to
be doing a *lot* of different stuff where probe defer was just a part of
it. Frmo what I recall that still operates on the device level, where
here we want to be able to say that a particular regulator needs another
resource, but it's ok to register it's sibling regulator within this
device because that regulator doesn't need anything. Are you saying you
want the restrack stuff to work at the regulator level? If we went that
way we could do the same thing in the clock framework and get rid of the
orphan list and rely on the notifications from restrack to figure out
when a clock resource becomes fully available.

[1] https://lkml.org/lkml/2014/12/10/342

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
