From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2.1 1/9] dt-binding: remoteproc: Introduce Qualcomm
 WCNSS loader binding
Date: Fri, 22 Apr 2016 09:54:31 -0700
Message-ID: <20160422165431.GC3202@tuxbot>
References: <1459222625-11440-2-git-send-email-bjorn.andersson@linaro.org>
 <1461259256-28529-1-git-send-email-bjorn.andersson@linaro.org>
 <CAL_JsqLgehfMVXgDQdHaC6SJ7MU3oRKFn4ogLbtgp_31keX95g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLgehfMVXgDQdHaC6SJ7MU3oRKFn4ogLbtgp_31keX95g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri 22 Apr 09:22 PDT 2016, Rob Herring wrote:

> On Thu, Apr 21, 2016 at 12:20 PM, Bjorn Andersson
> <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> >
> > The document defines the binding for a component that loads firmware for
> > and boots the Qualcomm WCNSS core.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >
> > Rob,
> >
> > I got your Ack on v2, but I would like to make a small amendment before merging
> > this.
> >
> >
> > As we discussed related to the WiFi binding I should reference the mmio
> > registers by a phandle to a DT node specifying the two necessary register
> > blocks (ccu & dxe).
> >
> > These two register blocks are part of the riva/pronto (the two major versions)
> > subsystem, that also contains the "pmu" register block, which is what I access
> > here.
> >
> > Further more, the ccu block contains valuable information for debugging
> > purposes that the implementation of this binding would find useful.
> >
> >
> > I would therefor like to double this node (in the dts) as both the
> > riva/pronto-pil and the target for the mmio phandle reference from the WiFi
> > node.
> >
> > This works fine, but unless using reg-names for defining the order or the regs
> > I get a messy ordering dependency between the two bindings. I do not know which
> > of the other 7-8 register blocks we will add for debugging, but with the below
> > change I can keep them in block order regardless of the order we implement them
> > in.
> 
> You should know based on the compatible string what the number and
> order of register ranges are. reg is not something we want evolving
> over time.
> 

At best I can make an educated guess based on some downstream debug code
on what regs we do have. But I've already found two of the ranges being
incorrect.

> > So, can I update the "reg" and add "reg-names" as below to the binding and
> > depend on reg-names for the ordering of reg? Or should I speculatively add all
> > ranges I know of to keep the order sane?
> 
> I'm okay with using this for convenience of the client not having to
> care which compatible the block is, but the above should still be met.
> 

Okay, I will throw in the 3 I know for now, saying those are required.
And then we add the debug regions as optionals after those, based on
which ones we need. Hopefully I haven't missed any required regions...

> Also, you could add a cell which is the index to the register range you need.
> 

I'm afraid I feel that is just reimplementing reg-names, for the sake of
not using reg-names.


Thanks for your answer, I'll spin the two bindings and send them about
again.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
