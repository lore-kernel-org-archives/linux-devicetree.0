MIME-Version: 1.0
Date: Wed, 8 Aug 2018 08:48:55 -0600
References: <20180806110416.4288-1-vkoul@kernel.org>
	<20180806110416.4288-2-vkoul@kernel.org>
	<20180806180337.GB21235@tuxbook-pro>
	<20180807041826.GE2395@vkoul-mobl>
	<20180807173913.GA1567@rob-hp-laptop>
	<20180807180750.GR30024@minitux>
	<7a5076a6-9a63-8e13-24a5-e486f2b464cc@linaro.org>
In-Reply-To: <7a5076a6-9a63-8e13-24a5-e486f2b464cc@linaro.org>
Message-ID: <CAL_JsqLu9Au37Fz5-GS9NoJkAXwH+jjPTqUZCzxhd7pZKTLgXw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: Add binding for Qualcomm CCI I2C controller
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Todor Tomov <todor.tomov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Linux I2C <linux-i2c@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Aug 8, 2018 at 8:03 AM Todor Tomov <todor.tomov@linaro.org> wrote:
>
> Hi Bjorn,
>
> On  7.08.2018 21:07, Bjorn Andersson wrote:
> > On Tue 07 Aug 10:39 PDT 2018, Rob Herring wrote:
> >
> >> On Tue, Aug 07, 2018 at 09:48:26AM +0530, Vinod wrote:
> >>> On 06-08-18, 11:03, Bjorn Andersson wrote:
> >>>> On Mon 06 Aug 04:04 PDT 2018, Vinod Koul wrote:
> >>>>
> >>>>> From: Todor Tomov <todor.tomov@linaro.org>
> >>>>>
> >>>>> Add DT binding document for Qualcomm Camera Control Interface (CCI)
> >>>>> I2C controller.
> >>>>>
> >>>>> Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
> >>>>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> >>>>> ---
> >>>>>  .../devicetree/bindings/i2c/i2c-qcom-cci.txt       | 55 ++++++++++++++++++++++
> >>>>>  1 file changed, 55 insertions(+)
> >>>>>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> >>>>> new file mode 100644
> >>>>> index 000000000000..977978dd4444
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> >>>>> @@ -0,0 +1,55 @@
> >>>>> +Qualcomm Camera Control Interface (CCI) I2C controller
> >>>>> +
> >>>>> +Required properties:
> >>>>> + - compatible: Should be one of:
> >>>>> +   - "qcom,cci-v1.0.8" for 8916;
> >>>>> +   - "qcom,cci-v1.4.0" for 8996.
> >>>>
> >>>> As pointed out by Rob previously we should either use version numbers or
> >>>> platform numbers, not both.
> >>
> >> Not really what I said...
> >>
> >
> > Sorry, I thought this was part of your concern.
> >
> > Then I'll revise my statement to: if we're going to list the platforms
> > here anyways I think we should just use the platform numbering as
> > compatible directly.
> >
> >>>>
> >>>> So this should either be:
> >>>>
> >>>>    - "qcom,cci-v1.0.8"
> >
> > This is supposed to be 1.1.0 for 8916...
>
> There is conflicting information about this in the documentation. However the version read from the hw version register is 1.0.8 and this matches the value listed in the SWI too so I believe 1.0.8 is correct for 8916.

And this is why we don't use version numbers. Unless you have access
to the RTL repositories with version tags then it is just error prone.

Rob
