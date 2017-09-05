From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [RFC/PATCH] drivers/of/platform: Add powerpc 4xx embedded
 busses to default list
Date: Wed, 06 Sep 2017 08:00:08 +1000
Message-ID: <1504648808.4073.15.camel@kernel.crashing.org>
References: <1504237861.4974.59.camel@kernel.crashing.org>
         <CAL_JsqLYMeV6XsBOtZKJHFbC2+_cG+gF7L+LurH5keTtzp2wVQ@mail.gmail.com>
         <1504309672.4974.93.camel@kernel.crashing.org>
         <CAL_JsqKv-nU7Am=Jz+PFnmpiXWfwscHNFdb0KfYdROOHmTrSHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKv-nU7Am=Jz+PFnmpiXWfwscHNFdb0KfYdROOHmTrSHg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2017-09-05 at 09:25 -0500, Rob Herring wrote:
> > So in the meantime, I'm thinking adding some kind of runtime way
> > of disabling this default populate. Would you be ok with that ?
> > 
> > Something like:
> > 
> >          bool arch_wants_of_platform_defaults(void)
> > 
> > With a weak implementation returning true.
> 
> That seems fine. The intention was that you can call
> of_platform_default_populate multiple times with arch specific match
> lists and the default. There could be ordering issues both with
> initcall levels and device creation ordering.

Right but I want to skip the default completely on things like old macs
because they manually create their own cherry-picks and I worry about
conflicts here. Also Apple has history of random crap in the root of
the DT.

Cheers,
Ben.
