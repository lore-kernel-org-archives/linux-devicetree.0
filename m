MIME-Version: 1.0
Date: Mon, 23 Jul 2018 07:20:00 -0600
References: <20180717125729.23045-1-vkoul@kernel.org>
	<20180717125729.23045-2-vkoul@kernel.org>
	<20180720180318.GA14573@rob-hp-laptop>
	<20180723035436.GV3219@vkoul-mobl>
In-Reply-To: <20180723035436.GV3219@vkoul-mobl>
Message-ID: <CAL_Jsq+WOMp2ZtEkk9rp42tzfVD=2-4yJKz1BerbQ=O4BW_Uow@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: Add binding document for
 Qualcomm CCI
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Vinod <vkoul@kernel.org>
Cc: Linux I2C <linux-i2c@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Sun, Jul 22, 2018 at 9:54 PM Vinod <vkoul@kernel.org> wrote:
>
> On 20-07-18, 12:03, Rob Herring wrote:
> > On Tue, Jul 17, 2018 at 06:27:28PM +0530, Vinod Koul wrote:
> > > From: Todor Tomov <todor.tomov@linaro.org>
>
> > > +Required properties:
> > > + - compatible: Should be one of:
> > > +   - "qcom,cci-v1.0.8" for 8916;
> > > +   - "qcom,cci-v1.4.0" for 8996.
> >
> > It's not very convincing to use version numbers instead of normal SoC
> > part# convention when there is a 1-1 mapping.
>
> I was under the impression that we don't have 1-1 mapping. An IP version
> is found in multiple SoCs

Maybe so, but I'm only looking at what is getting upstream. We already
discussed this at length on the thermal binding[1].

As you've written it, we'll still have to update the doc to add other
chips for an already documented version.

Rob

[1] https://lkml.org/lkml/2018/7/5/830
