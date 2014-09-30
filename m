From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/4] ARM: DT: apq8064: add rpm support
Date: Tue, 30 Sep 2014 12:13:05 -0700
Message-ID: <542B00C1.3010702@codeaurora.org>
References: <1411982044-7873-1-git-send-email-srinivas.kandagatla@linaro.org> <1411982092-7922-1-git-send-email-srinivas.kandagatla@linaro.org> <5429DA95.80505@codeaurora.org> <20140930050203.GG28481@sonymobile.com> <542AF5FE.1000006@codeaurora.org> <20140930190023.GS28481@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20140930190023.GS28481@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 09/30/14 12:00, Bjorn Andersson wrote:
>
> Hmm, seems I got that wrong, sorry about that.
>
> But do you mean "all wrong" as in that I use the wrong bit or to some greater
> extent? Currently all following requests should timeout, but maybe we should
> have a faster fail-path when we've hit this point?

Yes. We just ack the interrupt and go on happy to keep allowing clients
to request things. I'd rather see us blow up or start failing requests,
or maybe both.

>
> From a practical pov I guess that once the rpm starts returning errors on
> updates to regulators, root clocks and bus scaling then most of the system is
> becoming useless.

Right. Rebooting will be required fairly soon.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
