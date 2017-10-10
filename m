From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2] pinctrl: intel: merrifield: Introduce OF device table
Date: Tue, 10 Oct 2017 19:36:30 +0300
Message-ID: <1507653390.16112.422.camel@linux.intel.com>
References: <20170929135539.4046-1-andriy.shevchenko@linux.intel.com>
         <20171010160155.GK27659@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171010160155.GK27659@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mika Westerberg <mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lv.zheng-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2017-10-10 at 17:01 +0100, Mark Rutland wrote:
> Hi,
> 
> On Fri, Sep 29, 2017 at 04:55:39PM +0300, Andy Shevchenko wrote:
> > On Intel Merrifield the pin control device is a separate IP block
> > without any PCI or ACPI ID assigned. We need some means to allow the
> > device be enumerated in ACPI environment (*).
> > 
> > To achieve this without allocation special ACPI ID, which is really
> > long
> > and pretty much unachievable procedure, we just re-use special ACPI
> > ID
> > and standard compatible string.
> > 
> > (*) ACPI is enabled via second bootloader, i.e. U-Boot,
> >     firmware is still left untouched and being SFI enabled.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > ---
> > In v2:
> > - add DT binding
> > - we asked internally for ACPI ID about month ago with full silence
> > in response
> 
> Just so that I understand, this means that you asked within Intel for
> an
> ACPI ID, but couldn't get one allocated?

Correct. There are few reasons:
1. Platform was never designed as ACPI
2. Platform is EOL.
3. We tried, we pulled some strings, no ID.

> This sounds like a workaround for an internal process issue.

See above. Partially I can agree with you, but technically speaking the
platform wasn't designed to be ACPI.

> Surely there are other ACPI folk within Intel you can poke to move
> that
> along?

I dunno. Mika, do you know anyone else we may ask about?

> > +There is an ongoing effort to emulate ACPI on that kind of boards
> > +and, since it is near to impossible to allocate an ACPI ID for the
> > +such controller, the compatible string may be used along with
> > special
> > +PRP0001 ACPI ID.
> 
> This paragraph is not relevant to the description of the device,

I agree, so, I exclude it in new version.

>  nor is
> any of this relvevant to DT, given (AFAICT), this is only intended to
> be
> used with ACPI.

Though, no one prevents to use it in DT environment. We chose to bring
ACPI support to that platform.

Are you implying we should chose DT over ACPI?

> > +
> > +Required properties for FLIS pin controller:
> > +- compatible: "intel,merrifield-pinctrl"
> 
> This only has a compatible string?

Should it have anything else? Perhaps register base and length? Sure, I
will add them.

> As I've mentioned in the past, I'm not a fan of the whole PRP0001
> approach, especially given that little care seems to be taken to
> actually comply with DT standards.

Believe me, we also try to do the right things right, though there is an
obstacle we can't jump over as easily as in DT world.

-- 
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
