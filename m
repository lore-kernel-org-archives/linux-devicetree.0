From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add Qualcomm Synopsys High-Speed
 USB PHY binding
Date: Mon, 19 Nov 2018 17:15:27 +0800
Message-ID: <20181119091523.GC10788@dragon>
References: <20181108070449.23572-1-shawn.guo@linaro.org>
 <20181108070449.23572-2-shawn.guo@linaro.org>
 <5bea0ed8.1c69fb81.8715.38b2@mx.google.com>
 <20181113034200.GD20049@tiger>
 <CAL_JsqKu3kf-zrKNtrtZsQEPi0LN_3jqs08i3-8vbSQDVxuRkA@mail.gmail.com>
 <20181119065503.GB10788@dragon>
 <CAFp+6iGmsLT8UOk+-4zOKkYxJbkhqy=oDw2ZqrXLDCGbF8uTHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFp+6iGmsLT8UOk+-4zOKkYxJbkhqy=oDw2ZqrXLDCGbF8uTHA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Rob Herring <robh@kernel.org>, kishon <kishon@ti.com>, sallenki@codeaurora.org, anur@codeaurora.org, Bjorn Andersson <bjorn.andersson@linaro.org>, vkoul@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 19, 2018 at 12:40:59PM +0530, Vivek Gautam wrote:
> On Mon, Nov 19, 2018 at 12:29 PM Shawn Guo <shawn.guo@linaro.org> wrote:
> >
> > On Sat, Nov 17, 2018 at 09:13:38AM -0600, Rob Herring wrote:
> > <snip>
> > > > > > +- qcom,init-seq:
> > > > > > +    Value type: <u32 array>
> > > > > > +    Definition: Should contain a sequence of <offset value delay> tuples to
> > > > > > +                program 'value' into phy register at 'offset' with 'delay'
> > > > > > +           in us afterwards.
> > > > >
> > > > > If we wanted this type of thing in DT, we'd have a generic binding (or
> > > > > forth).
> > > >
> > > > Right now, this is a qualcomm usb phy specific bindings - first used in
> > > > qcom,usb-hs-phy.txt and I extended it a bit for my phy.  As this is not
> > > > a so good hardware description, I'm a little hesitated to make it
> > > > generic for other platforms to use in general.  What about we put off it
> > > > a little bit until we see more platforms need the same thing?
> > >
> > > I'm not saying I want it generic. Quite the opposite. I don't think we
> > > should have it either generically or vendor specific. The main thing I
> > > have a problem with is the timing information because then we're more
> > > that just data. Without that we're talking about a bunch of properties
> > > for register fields or just raw register values in DT. That becomes
> > > more of a judgement call. There's not too much value in making a
> > > driver translate a bunch of properties just to stuff them into
> > > registers on init. But then just allowing any raw register value to be
> > > in DT could be easily abused.
> >
> > Rob,
> >
> > I agree with your comments.  Honestly, I'm not comfortable with this
> > 'qcom,init-seq' thing in the first impression.  The similar existence in
> > mainline qcom,usb-hs-phy.txt makes me think it might be acceptable with
> > the timing data added.  Okay, I know your position on this now.
> >
> > @Sriharsha,
> >
> > Seeing that 'qcom,init-seq' is being configured with the exactly same
> > values for both HS phys in SoC level dts file (qcs404.dtsi), I think
> > such settings can be moved into driver code as SoC specific data.
> > Unless you have a different view on this, I will do it with v4.
> 
> phy-qcom-qmp and phy-qcom-qusb2 have been maintaining such SoC specific
> init sequences in the drivers if you would like to have pointers from them.

Thanks for the pointer, Vivek.  That helps.

Shawn
