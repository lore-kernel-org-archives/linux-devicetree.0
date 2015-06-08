From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 5/6] drivers: firmware: psci: add extended stateid
 power_state support
Date: Mon, 8 Jun 2015 12:03:52 +0100
Message-ID: <20150608110352.GB682@red-moon>
References: <1432901799-18359-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1432901799-18359-6-git-send-email-lorenzo.pieralisi@arm.com>
 <CAJ5Y-eYLAjOcTU1Md3Rmc0E49A5Dby1aoBzwtpKpD4Rg=XAYfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJ5Y-eYLAjOcTU1Md3Rmc0E49A5Dby1aoBzwtpKpD4Rg=XAYfA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Anup Patel <anup.patel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 05, 2015 at 03:16:36PM +0100, Ashwin Chaugule wrote:
> On 29 May 2015 at 08:16, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:

[...]

> > diff --git a/include/uapi/linux/psci.h b/include/uapi/linux/psci.h
> > index 187b828d..2598d7c 100644
> > --- a/include/uapi/linux/psci.h
> > +++ b/include/uapi/linux/psci.h
> > @@ -58,6 +58,13 @@
> >  #define PSCI_0_2_POWER_STATE_AFFL_MASK         \
> >                                 (0x3 << PSCI_0_2_POWER_STATE_AFFL_SHIFT)
> >
> > +/* PSCI extended power state encoding for CPU_SUSPEND function */
> > +#define PSCI_EXT_POWER_STATE_ID_MASK           0xfffffff
> > +#define PSCI_EXT_POWER_STATE_ID_SHIFT          0
> > +#define PSCI_EXT_POWER_STATE_TYPE_SHIFT                30
> > +#define PSCI_EXT_POWER_STATE_TYPE_MASK         \
> > +                               (0x1 << PSCI_EXT_POWER_STATE_TYPE_SHIFT)
> > +
> 
> For consistency, dont you need version numbers here, like we have for v0.2?

According to the docs (page 49, 5.12.2 Implementation responsibilities)
the choice is between "Original Format(PSCI0.2)" and "extended stateid"
parameter.

Do we really need to add a version number to the extended stateid defines ?
I could add it, I am not not fussed about this.

> >  /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
> >  #define PSCI_0_2_AFFINITY_LEVEL_ON             0
> >  #define PSCI_0_2_AFFINITY_LEVEL_OFF            1
> > @@ -78,6 +85,11 @@
> >  #define PSCI_VERSION_MINOR(ver)                        \
> >                 ((ver) & PSCI_VERSION_MINOR_MASK)
> >
> > +/* PSCI features decoding (>=1.0) */
> > +#define PSCI_FEATURES_CPU_SUSPEND_PF_SHIFT     1
> > +#define PSCI_FEATURES_CPU_SUSPEND_PF_MASK      \
> > +                       (0x1 << PSCI_FEATURES_CPU_SUSPEND_PF_SHIFT)
> > +
> 
> Likewise.

I could do, yes.

Thanks,
Lorenzo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
