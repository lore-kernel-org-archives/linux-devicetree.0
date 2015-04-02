From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 0/5] Refactor Qualcomm RPM regulator to single platform_device
Date: Thu, 02 Apr 2015 15:57:16 -0700
Message-ID: <551DC94C.3060001@codeaurora.org>
References: <1427928946-31291-1-git-send-email-bjorn.andersson@sonymobile.com> <551DBC05.2090301@codeaurora.org> <20150402222630.GV6023@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20150402222630.GV6023@sirena.org.uk>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Andy Gross <agross@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/02/15 15:26, Mark Brown wrote:
> On Thu, Apr 02, 2015 at 03:00:37PM -0700, Stephen Boyd wrote:
>
>> What happens with debugfs when you have multiple pmics with the same
>> named regulator? I thought that in this case we needed to make the names
>> unique somehow or we would end up with the same directory for two
>> different regulators.
> Guenther sent a patch fixing that a while back.

This one?

commit a9eaa8130707d4013fb109b80323489c0d0111ac
Author:     Guenter Roeck <linux@roeck-us.net>
AuthorDate: Fri Oct 17 08:17:03 2014 -0700
Commit:     Mark Brown <broonie@kernel.org>
CommitDate: Fri Mar 27 16:14:18 2015 -0700

    regulator: Ensure unique regulator debugfs directory names

Ok. Seems to be only in next. I'm not sure it will work though because
in this case the parent device is the same for both regulators on
different PMICs that the RPM is controlling. I could be wrong though
because I haven't tested it.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
