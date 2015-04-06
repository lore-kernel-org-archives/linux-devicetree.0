From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH v2 0/5] Refactor Qualcomm RPM regulator to single platform_device
Date: Mon, 6 Apr 2015 09:40:32 -0700
Message-ID: <CAJAp7Oijn8B8tyYNbCkHgFyZkO58vskYbZs+-H+4rXpG_CD=8g@mail.gmail.com>
References: <1427928946-31291-1-git-send-email-bjorn.andersson@sonymobile.com>
	<551DBC05.2090301@codeaurora.org>
	<20150402222630.GV6023@sirena.org.uk>
	<551DC94C.3060001@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <551DC94C.3060001@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mark Brown <broonie@kernel.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Andy Gross <agross@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 2, 2015 at 3:57 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 04/02/15 15:26, Mark Brown wrote:
>> On Thu, Apr 02, 2015 at 03:00:37PM -0700, Stephen Boyd wrote:
>>
>>> What happens with debugfs when you have multiple pmics with the same
>>> named regulator? I thought that in this case we needed to make the names
>>> unique somehow or we would end up with the same directory for two
>>> different regulators.
>> Guenther sent a patch fixing that a while back.
>
> This one?
>
> commit a9eaa8130707d4013fb109b80323489c0d0111ac
> Author:     Guenter Roeck <linux@roeck-us.net>
> AuthorDate: Fri Oct 17 08:17:03 2014 -0700
> Commit:     Mark Brown <broonie@kernel.org>
> CommitDate: Fri Mar 27 16:14:18 2015 -0700
>
>     regulator: Ensure unique regulator debugfs directory names
>
> Ok. Seems to be only in next. I'm not sure it will work though because
> in this case the parent device is the same for both regulators on
> different PMICs that the RPM is controlling. I could be wrong though
> because I haven't tested it.
>

You're right Stephen; for the platforms with multiple pmics this will
spit out a bunch of warnings and Guenter's fix does not change that
fact.

Either we make the regulator names more specific (like pm8058_l1) or
we build desc.name out of pdev->dev.of_node->name and the regulator
name. I like the latter, so unless someone object I'll respin it that
way.

Regards,
Bjorn
