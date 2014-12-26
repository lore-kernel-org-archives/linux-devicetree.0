From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH v8 2/3] mfd: qcom-rpm: Driver for the Qualcomm RPM
Date: Fri, 26 Dec 2014 12:11:42 -0800
Message-ID: <CAJAp7OiEkuz8wjdix-=BHU2Eu6Yzbn1P52F8zzjO6wA_cpEWng@mail.gmail.com>
References: <1417038661-30209-1-git-send-email-bjorn.andersson@sonymobile.com>
	<1417038661-30209-3-git-send-email-bjorn.andersson@sonymobile.com>
	<1419245407.30945.35.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1419245407.30945.35.camel@x220>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>, Lee Jones <lee.jones@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Mark Brown <broonie@kernel.org>, Valentin Rothberg <valentinrothberg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Josh Cartwright <joshc@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 22, 2014 at 2:50 AM, Paul Bolle <pebolle@tiscali.nl> wrote:
> Hi Bjorn,
>

Hi Paul

[..]
>
> The Qualcomm RPM regulator driver (see Kconfig symbol
> REGULATOR_QCOM_RPM) was added in v3.18. It depends on the above symbol,
> so it has not yet gotten build coverage. Even manual hacks like
>     make -C ../.. M=$PWD CONFIG_REGULATOR_QCOM_RPM=m qcom_rpm-regulator.ko
>
> won't work for that driver, because it includes linux/mfd/qcom_rpm.h,
> which is not part of the tree.
>

Correct, but unfortunately Lee Jones awaits devicetree maintainers ack
(or any comment) and have been doing so for months now. I did send out
a ping a few weeks ago, but might have done so when they where
occupied by the merge window.


Lee, the Qualcomm RPM binding is not for a subsystem and is limited to
Qualcomm devices. Could we apply this in accordance with II.2 in
Documentation/devicetree/bindings/submitting-patches.txt or is there
anything I could do to make you feel comfortable doing so?

> It seems there's no generally agreed upon guideline for situations like
> this. So I guess it's up to Mark to decide how long the tree should
> include an unbuildable driver.
>

I haven't seen any guidelines, but appreciate Mark's way of working in
this matter - as we've been able to run our devices with fewer
out-of-tree patches.

Regards,
Bjorn
