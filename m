From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH 1/4] ARM: DT: apq8064: add rpm support
Date: Tue, 30 Sep 2014 12:56:53 -0700
Message-ID: <20140930195652.GT28481@sonymobile.com>
References: <1411982044-7873-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1411982092-7922-1-git-send-email-srinivas.kandagatla@linaro.org>
 <5429DA95.80505@codeaurora.org>
 <20140930050203.GG28481@sonymobile.com>
 <542AF5FE.1000006@codeaurora.org>
 <20140930190023.GS28481@sonymobile.com>
 <542B00C1.3010702@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <542B00C1.3010702@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue 30 Sep 12:13 PDT 2014, Stephen Boyd wrote:

> On 09/30/14 12:00, Bjorn Andersson wrote:
> >
> > Hmm, seems I got that wrong, sorry about that.
> >
> > But do you mean "all wrong" as in that I use the wrong bit or to some greater
> > extent? Currently all following requests should timeout, but maybe we should
> > have a faster fail-path when we've hit this point?
> 
> Yes. We just ack the interrupt and go on happy to keep allowing clients
> to request things. I'd rather see us blow up or start failing requests,
> or maybe both.
> 

Okay, I naively figured that the RPM would be dead after this happened and from
this point we would start getting timeouts. Let's ack the right bit and fail
early after the RPM have rejected things.

> >
> > From a practical pov I guess that once the rpm starts returning errors on
> > updates to regulators, root clocks and bus scaling then most of the system is
> > becoming useless.
> 
> Right. Rebooting will be required fairly soon.
> 

Yes, but we want something else to trigger that right?

Regards,
Bjorn
