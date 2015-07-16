From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH 1/3] ARM: dts: qcom: Add binding for the qcom coincell
 charger
Date: Wed, 15 Jul 2015 17:53:58 -0700
Message-ID: <20150716005358.GJ32767@usrtlx11787.corpusers.net>
References: <1436830772-32632-1-git-send-email-tim.bird@sonymobile.com>
 <CAL_JsqJ4poHe_644aOooAXJqwSvTW-3NPCFJ7LmaBj=wAQQp1w@mail.gmail.com>
 <55A58221.7040004@sonymobile.com>
 <CAL_Jsq+FUCvQgicWkJLQOVTSijWxqDyWDKwJgFr85KAvtC=bkg@mail.gmail.com>
 <55A6A55D.8000209@sonymobile.com>
 <CAL_Jsq+U7q1=BbRY47b077ys2NWMCTVE5SvgnWW4N2yKUAm95w@mail.gmail.com>
 <55A6DE5C.7020005@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55A6DE5C.7020005@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Tim Bird <tim.bird@sonymobile.com>
Cc: Rob Herring <robherring2@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed 15 Jul 15:27 PDT 2015, Tim Bird wrote:

> 
> 
> On 07/15/2015 02:22 PM, Rob Herring wrote:
> > On Wed, Jul 15, 2015 at 1:24 PM, Tim Bird <tim.bird@sonymobile.com> wrote:
> >> On 07/14/2015 06:07 PM, Rob Herring wrote:
> >>> On Tue, Jul 14, 2015 at 4:41 PM, Tim Bird <tim.bird@sonymobile.com> wrote:
> >>>> On 07/13/2015 08:59 PM, Rob Herring wrote:
> >>>>> On Mon, Jul 13, 2015 at 6:39 PM, Tim Bird <tim.bird@sonymobile.com> wrote:
> >>>>>> This binding is used to configure the driver for the coincell charger
> >>>>>> found in Qualcomm PMICs.
> > 
> > [...]
> > 
> >>>>>> +- qcom,charge-enable:
> >>>>>> +       Usage: optional
> >>>>>> +       Value type: <u32> or <none>
> >>>>>> +       Definition: definining this property, with an optional non-zero
> >>>>>> +               value, enables charging
> >>>>>
> >>>>> I'm not sure that this belongs in DT. Don't you want to enable
> >>>>> charging when plugged in perhaps or at some voltage threshold?
> >>>>
> >>>> In practice this is never changed at runtime. It's only set at kernel boot.
> >>>> The main use of this is to override (either on or off) whatever the firmware
> >>>> did.
> >>>
> >>> If your firmware and dtb are separate from your kernel, then ... (well
> >>> you know where I'm headed :) ).
> >>
> >> Sorry, I have no idea how the sentence would end, so I think I'm missing
> >> where you are headed.
> > 
> > dtbs should be separate from the kernel and part of the firmware. I'm
> > certain you recall those discussions or have sucessfully blocked them
> > from memory.
> 
> Ah yes, those discussions. :-)
> 
> Having dtbs come from firmware is not on the horizon yet
> for projects I'm working on, so I haven't really considered
> the ramifications.
> 

This has nothing to do about how the dtb, kernel and boot is stored on
the device; we already store them as 3 separate entities and they can be
upgraded independently. Neither one of them is read only and they will
never be!

We've already passed the point where we've gotten the pieces into
mainline that would make it possible to run all devices on e.g. the 8974
platform from a single zImage. The fact that we store the dtb in
adjacent blocks is simply a convenience thing.

Regards,
Bjorn
