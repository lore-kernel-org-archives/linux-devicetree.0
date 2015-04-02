From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH v2 2/5] regulator: Introduce property to flag drms
Date: Thu, 2 Apr 2015 14:35:07 -0700
Message-ID: <CAJAp7OhW9SBf5=MmEEFNLGYpZ738Z8=HKxsBTBVvk-GNZq6=bQ@mail.gmail.com>
References: <1427928946-31291-1-git-send-email-bjorn.andersson@sonymobile.com>
	<1427928946-31291-3-git-send-email-bjorn.andersson@sonymobile.com>
	<20150402085440.GL6023@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150402085440.GL6023@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 2, 2015 at 1:54 AM, Mark Brown <broonie@kernel.org> wrote:
> On Wed, Apr 01, 2015 at 03:55:43PM -0700, Bjorn Andersson wrote:
>> Introduce "regulator-allow-drms" to make it possible for board
>> configuration to enable drms for regulators.
>
> I don't think this is a good name, nobody unfamiliar with a fairly
> obscure feature in the Linux regulator API is going to know what DRMS
> means.  Something like change-load might be clearer.

Right. And with the cleanup of the drms handling (drms_uA_update())
that we discussed during ELC it makes more sense for the Linux case as
well. I will rework this patch and include it when sending out the
cleanup.

Would you mind picking the other patches from this series or do you
want me to resend them? They are unrelated to this issue and will give
us working regulators (without set_load support) on the affected
platforms.

Regards,
Bjorn
