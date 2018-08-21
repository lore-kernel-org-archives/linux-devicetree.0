Return-Path: <vkoul@kernel.org>
Date: Tue, 21 Aug 2018 21:30:04 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: i2c: Add binding for Qualcomm CCI
 I2C controller
Message-ID: <20180821160004.GJ2388@vkoul-mobl>
References: <20180820063953.6866-1-vkoul@kernel.org>
 <20180820063953.6866-2-vkoul@kernel.org>
 <20180820181859.GA3439@bogus>
 <20180821092803.GC2388@vkoul-mobl>
 <CAL_Jsq+VhmTPgsXDwFV96=78UT2Ld_mvZ=KNNnN3E7rcaqVRoQ@mail.gmail.com>
 <CAL_Jsq+4aS25RdwEpw0KWkhDB5E62gZoWQY=AvvSLDpvVUUEXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+4aS25RdwEpw0KWkhDB5E62gZoWQY=AvvSLDpvVUUEXg@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Linux I2C <linux-i2c@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On 21-08-18, 08:12, Rob Herring wrote:
> Hit send too soon...
> 
> On Tue, Aug 21, 2018 at 8:11 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Aug 21, 2018 at 4:28 AM Vinod <vkoul@kernel.org> wrote:
> > >
> > > On 20-08-18, 13:18, Rob Herring wrote:
> > > > On Mon, Aug 20, 2018 at 12:09:52PM +0530, Vinod Koul wrote:
> > >
> > > > > +PROPERTIES:
> > > > > +
> > > > > +- compatible:
> > > > > +   Usage: required
> > > > > +   Value type: <string>
> > > > > +   Definition: must be one of:
> > > > > +           "qcom,msm-8916-cci"
> > > > > +           "qcom,msm-8996-cci"
> > > >
> > > > I think everywhere else is 'msm8916' and 'msm8996'.
> > >
> > > Quick grep told me that is the case, so will update.
> > >
> > > > > +SUBNODES:
> > > > > +
> > > > > +The CCI provides I2C masters for one or two i2c busses, described as
> > > > > +subdevices named "i2c-bus0" and "i2c-bus1".
> > > >
> > > > Use a unit-address and reg property with 0 and 1 here.
> > >
> > > Am not sure I understood that properly, still learning DT nuisances,
> > > care to elaborate a bit please.
> >
> > Node names are supposed to be standard (there's a list in the DT spec)
> > and i2c-bus is for cases where the controller is not the bus parent.
> > So you just need it to look like this:
> >
> > i2c-bus@0 {
> >   reg = <0>;
> >   ...
> > };
> >
> > i2c-bus@1 {
> >   reg = <1>;
> >   ...
> > };
> >
> > It's similar to how i2c muxes are done where you have multiple
> > downstream i2c buses. Following this will enable some i2c bus checks
> > in dtc (current master, not kernel copy yet) as node names are the
> > only way
> 
> ...we can match i2c buses in a generic way.

I tried i2c-bus@0, but wasn't able to do it properly, let me try again
with this approach. It does sound great to me, will update..

-- 
~Vinod
