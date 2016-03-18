From: "Jon Medhurst (Tixy)" <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: dts: juno/vexpress: fix node name
 unit-address presence warnings
Date: Fri, 18 Mar 2016 10:32:16 +0000
Message-ID: <1458297136.2812.7.camel@linaro.org>
References: <1457352735-24453-1-git-send-email-sudeep.holla@arm.com>
	 <CAL_JsqJeeZ58at95gSRwOMnce_DjDsXVRYH_bMKaX=uDHtZAAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJeeZ58at95gSRwOMnce_DjDsXVRYH_bMKaX=uDHtZAAA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2016-03-17 at 16:44 -0500, Rob Herring wrote:
> On Mon, Mar 7, 2016 at 6:12 AM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
> > Commit fa38a82096a1 ("scripts/dtc: Update to upstream version
> > 53bf130b1cdd") added warnings on node name unit-address presence/absence
> > mismatch in device trees.
> >
> > This patch fixes those warning on all the juno/vexpress platforms where
> > unit-address is present in node name while the reg/ranges property is
> > not present.
> >
> > Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/arm/foundation-v8.dtsi         |  2 +-
> >  arch/arm64/boot/dts/arm/juno-base.dtsi             | 14 +++++-----
> >  arch/arm64/boot/dts/arm/juno-motherboard.dtsi      | 30 +++++++++++-----------
> >  arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts         |  2 +-
> >  arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi   | 14 +++++-----
> >  .../boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts      | 10 ++++----
> >  6 files changed, 36 insertions(+), 36 deletions(-)
> >
> > Hi Rob,
> >
> > I am not sure if the intention of commit fa38a82096a1 is to fix even
> > existing warnings or not. I saw warning with today's -next branch.
> 
> Yes. I'm dropping it for 4.6 though.
> 
> > Let me know.
> >
> > Regards,
> > Sudeep
> >
> > diff --git a/arch/arm64/boot/dts/arm/foundation-v8.dtsi b/arch/arm64/boot/dts/arm/foundation-v8.dtsi
> > index 9314f3943269..ba03c934a861 100644
> > --- a/arch/arm64/boot/dts/arm/foundation-v8.dtsi
> > +++ b/arch/arm64/boot/dts/arm/foundation-v8.dtsi
> > @@ -89,7 +89,7 @@
> >                              <0 63 4>;
> >         };
> >
> > -       smb {
> > +       smb@0,08000000 {
> 
> Drop the comma and leading zeros. Comma is for distinct fields like
> bus,dev,func on PCI.

So what is the correct way of representing 2 cell addresses? Not just
those that are logically 64-bit addresses, (which I guess could be just
a single number), but things like vexpress motherboard where we have
Chip-select and Offset values?

I looked at ePAPR but it just says 'The unit-address must
match the first address specified in the reg property of the node.' and
lists valid characters for unit address, which includes ,._+-

-- 
Tixy

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
