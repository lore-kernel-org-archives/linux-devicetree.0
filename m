From: jmondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and
 output-enable
Date: Tue, 23 May 2017 20:37:35 +0200
Message-ID: <20170523183735.GC13664@w540>
References: <SG2PR06MB1165E7E651BE96CD7B7738B08A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75Vcp_eMWrjZRX-x3=Tt3JRXcL_wWG43MymF=oyLLP4EJwg@mail.gmail.com>
 <SG2PR06MB11658EC3A3A80C57E6F539AC8A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75VeLtOuty=iaxuCaH43rnBZDTT03iH7JyjDJBQhTD-EjzA@mail.gmail.com>
 <CACRpkdZkNGSUvTrEdjbGKO1hr799QpJBGSHPVbsBibph7Jx61A@mail.gmail.com>
 <20170508160120.GB25206@w540>
 <CAHp75VfOMKOhpkec+htA6DRQhivpSmNXy1=Ayig1W+ZC84gTLw@mail.gmail.com>
 <20170508172516.GC25206@w540>
 <CACRpkdY1h+yfFuk2y9=nZqqvW9=G33_eHCisvuMkJ5b3zizY7Q@mail.gmail.com>
 <CAA+hA=Q9hwe7_xL440Reoi7z7m8-SScZ5E057419KSA7dQK=tQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAA+hA=Q9hwe7_xL440Reoi7z7m8-SScZ5E057419KSA7dQK=tQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Tue, May 23, 2017 at 06:08:31PM +0800, Dong Aisheng wrote:
> On Tue, May 9, 2017 at 5:19 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Mon, May 8, 2017 at 7:25 PM, jmondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org> wrote:
> >
> >> From my perspective these flags are configurations internal to the pin
> >> controller hardware used to enable/disable input buffers when a pin needs to
> >> perform in both direction.
> >> The level of detail I can provide on this is the logical diagram we have pointed
> >> you to already.
> >>
> >> As I assume you are trying to get this answer from us in order to
> >> avoid duplicating things in pin controller sub-system, and I
> >> understand this, but my question here was "can we have those flags as part
> >> of the pinmux property argument list, as that property description
> >> seems to allow us to do that, instead of making them generic pin
> >> configuration properties and upset other developers?"
> >
> > Pinmux with all it's magic flags baked into one is not any better
> > or any more readable. The solution is already very pretty except
> > for these two flags which I am sure we can agree on a way forward
> > for.
> >
> > What we choose between is not this or another less transparent
> > pin configuration mechanism, the mechanism (whether magic bits
> > to pinmux or reasonable properties) does not matter.
> >
> > There is a strong preference to use the generic bindings.
> >
> > So the discussion is whether to use:
> >
> > bi-directional;
> > output-enable;
> >
> > Or some already defined config flags.
> >
> > If these are too idiomatic to be used by others, they should anyways
> > look similar, like:
> >
> > renesas,bi-directional;
> > renesas,output-enable;
> >
> > Like the Qualcomm weirdness found in drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> >
> > qcom,pull-up-strength = <..>;
> >
> > Check how they use
> > #define PMIC_GPIO_CONF_PULL_UP                 (PIN_CONFIG_END + 1)
> >
> > Etc.
> >
> >> Anyway, I still fail to see why those configuration flags, only
> >> affecting the way the pin controller hardware enables/disables
> >> its internal buffers and its internal operations have to be
> >> described in term of their externally visible electrically characteristics.
> >
> > To me internal vs external is not what matters. What matters is
> > if this is likely to pop up in more platforms, and then the property
> > should be generic.
> >
> > The generic pin config definitions are likely to be picked up by other
> > standards and even be inspiration to hardware engineers so that
> > is why it matters so much.
> >
> >> To me, what already exists are pin configuration properties generic to
> >> the whole pin controller subsystem, and I understand you don't want to
> >> see duplication there.
> >>
> >> At the same time, to me, those flags are settings the pin controller
> >> wants to have specified by software to overcome its hw design flaws,
> >> and are intended to configure its internal buffers in a way it cannot
> >> do by itself for some very specific operation modes (they are listed
> >> in the hw reference manual, it's not something you can chose to
> >> configure or not, if you want a pin working in i2c mode, you HAVE to
> >> pass those flags to pin controller).
> >
> > Sounds like a case for
> >
> > renesas,bi-directional;
> > renesas,output-enable;
> >
> > following the Qualcomm pattern in that case.
> >
> > But let's see if something else comes out of this discussion.
> >
>
> I did not follow too much.
> But it seems IMX7ULP/Vybrid to be also a fan of generic
> output-enable/input-enable
> property.
>
> See:
> Figure 5-2. GPIO PAD in Page 241
> http://www.nxp.com/assets/documents/data/en/reference-manuals/VFXXXRM.pdf
>
> It has separate register bits to control input buffer enable and
> output buffer enable
> and we need set it property for GPIO function.

As it seems we have another user for 'output-enable' here, what if we just
add that one to the generic bindings properties list, and we keep
'bi-directional' (which seems to be the most debated property we have
added) out of generic properties?

We can handle 'bi-directional' pins with static tables in our pin
controller driver and not have it anywhere in DT.

I see commit 42d5a11200d0[1] has not been reverted yet as Andy asked
in some previous email. I can send another version of that patch with
only 'output-enable' if you wish.

Once we reach consesus, I can then send v6 of our pin controller driver
based on that.

Thanks
   j

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8c58f1a7a4b6d1d723bf25fef9d842d5a11200d0
>
> Regards
> Dong Aisheng
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
