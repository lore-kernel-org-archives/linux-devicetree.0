Return-Path: <vkoul@kernel.org>
Date: Wed, 8 Aug 2018 21:37:45 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: Add binding for Qualcomm CCI
 I2C controller
Message-ID: <20180808160745.GM2395@vkoul-mobl>
References: <20180806110416.4288-1-vkoul@kernel.org>
 <20180806110416.4288-2-vkoul@kernel.org>
 <20180806180337.GB21235@tuxbook-pro>
 <20180807041826.GE2395@vkoul-mobl>
 <20180807173913.GA1567@rob-hp-laptop>
 <20180807180750.GR30024@minitux>
 <7a5076a6-9a63-8e13-24a5-e486f2b464cc@linaro.org>
 <CAL_JsqLu9Au37Fz5-GS9NoJkAXwH+jjPTqUZCzxhd7pZKTLgXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLu9Au37Fz5-GS9NoJkAXwH+jjPTqUZCzxhd7pZKTLgXw@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Todor Tomov <todor.tomov@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Linux I2C <linux-i2c@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 08-08-18, 08:48, Rob Herring wrote:
> On Wed, Aug 8, 2018 at 8:03 AM Todor Tomov <todor.tomov@linaro.org> wrote:
> > >>>> So this should either be:
> > >>>>
> > >>>>    - "qcom,cci-v1.0.8"
> > >
> > > This is supposed to be 1.1.0 for 8916...
> >
> > There is conflicting information about this in the documentation.
> > However the version read from the hw version register is 1.0.8 and
> > this matches the value listed in the SWI too so I believe 1.0.8 is
> > correct for 8916.
> 
> And this is why we don't use version numbers. Unless you have access
> to the RTL repositories with version tags then it is just error prone.

Yeah we have a HW_VERSION register too, but someone might forget to
populate it, so lets go ahead and use the soc numbers as discussed.

Thanks
-- 
~Vinod
