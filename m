From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] soc: qcom: Add SoC info driver
Date: Thu, 27 Oct 2016 15:41:51 +0200
Message-ID: <9172138.R1PTFlLtP9@wuerfel>
References: <1476972386-28655-1-git-send-email-kimran@codeaurora.org> <4173870.AkctyO62lp@wuerfel> <fd34e299-a3c2-e981-a92e-b61638a98e5f@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fd34e299-a3c2-e981-a92e-b61638a98e5f@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Imran Khan <kimran@codeaurora.org>
Cc: andy.gross@linaro.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thursday, October 27, 2016 6:40:27 PM CEST Imran Khan wrote:
> On 10/26/2016 8:16 PM, Arnd Bergmann wrote:
> > On Wednesday, October 26, 2016 7:42:08 PM CEST Imran Khan wrote:
> >> On 10/26/2016 7:35 PM, Arnd Bergmann wrote:
> >>>>> As we are talking about generic soc_device_attribute fields, I was hoping that
> >>>>> having a vendor field would be helpful as along with family it would provide
> >>>>> a more thorough information. Also as more than one foundries may be used for 
> >>>>> a soc, can we have a field say foundry_id to provide this information.
> >>> My first feeling is that this 'vendor' information can should be
> >>> derived from the family. It's also not clear what would happen
> >>> to this when a company gets bought. E.g. the Oxnas product family
> >>> was subsequently owned by Oxford, PLX, Avago and Broadcom, and the
> >>> mxs family was Sigmatel, Freescale, now NXP and might soon be
> >>> Qualcomm. What would you put in there in this case?
> >>
> >> Okay, not having vendor field is fine for me. Could you also suggest
> >> something about the foundry_id field.
> > 
> > This one seems more well-defined, so it's probably ok to add. What
> > would be the use case of reading this? Would you want to read it
> > just from user space or also from the kernel?
> > 
> 
> As of now the use case I can think of, only involve reading this from user
> space. For example for the same soc, coming from different foundries with
> different manufacturing process, we may have a situation where some inconsistent
> h/w behavior is being observed only on parts received from a certain foundry
> and in those cases this information may help in segregation of problematic socs
> and may also be used in testing these socs under a different set of settings like
> voltage, frequency etc.
>
> > Maybe this can be combined with a manufacturing process, which probably
> > falls into a similar category, so we could have something like
> > "TSMC 28ULP" as a string in there.
> >
> 
> Yes. Having a manufacturing process as part of foundry-id can provide a more
> thorough information.

Ok, sounds good. Let's do it like this. We can always add support for
in-kernel matching of this string if needed later.

	Arnd
