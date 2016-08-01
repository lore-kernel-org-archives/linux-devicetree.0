From: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH v16 6/6] ARM: socfpga: fpga bridge driver support
Date: Mon, 1 Aug 2016 09:07:34 -0500
Message-ID: <alpine.DEB.2.02.1608010907110.2521@linuxheads99>
References: <1454707803-27947-1-git-send-email-atull@opensource.altera.com>  <1454707803-27947-7-git-send-email-atull@opensource.altera.com>  <1465525089.15779.203.camel@rtred1test09.kymeta.local>  <CAC+thW3U_vEre0DovmK7t_oiK5v1evZCBPqpahf+e6aCvmhqLA@mail.gmail.com>
  <alpine.DEB.2.02.1607281019100.1032@linuxheads99> <1469737696.30803.152.camel@rtred1test09.kymeta.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469737696.30803.152.camel-dVGoCQn2UwS33l2LyG1otL1RWLrjA2wiZkel5v8DVj8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Trent Piepho <tpiepho-KTxT7QYAYfgCx7yrEBmKXg@public.gmane.org>
Cc: Andrea Galbusera <gizero-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org" <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org" <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, "michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org" <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Matthew Gerlach <mge>
List-Id: devicetree@vger.kernel.org

On Thu, 28 Jul 2016, Trent Piepho wrote:

> On Thu, 2016-07-28 at 10:21 -0500, atull wrote:
> > > >
> > > > This isn't going work if more than one bridge is used.  Each bridge has
> > > > its own priv and thus priv->l3_remap_value.  Each bridge's priv will
> > > > have just the bit for it's own remap set.  The 2nd bridge to be enabled
> > > > will turn off the 1st bridge when it re-write the l3 register.
> > > 
> > > I can confirm this is exactly what happens with tag
> > > "rel_socfpga-4.1.22-ltsi_16.06.02_pr" of socfpga-4.1.22-ltsi branch
> > > from altera-opensource/linux-socfpga which includes more or less the
> > > code in this patch. If you have 2 bridges (lw-hps2fpga and hps2fpga)
> > > you end up with only one of them being visible. Easily spot by logging
> > > l3_remap_value being passed to regmap_write()...
> > > 
> > 
> > Anatolij kindly provided a patch for this issue.  I'll push it
> > to my github repo when I can.
> 
> I still think a better solution would be to allow the syscon driver
> manage shared access.  The purpose of syscon is to manage access to a
> shared resource from multiple devices.  And regmap already has the
> ability to cache a write-only register and allow thread safe access to
> modify bits in said register.  The problem is just the pain of trying to
> do anything to syscon DT bindings.  Something like "write-only" in the
> syscon binding that sets a couple values in the regmap_config is all
> that's necessary.
> 
> Might as well not use syscon at all and have the bridge driver map the
> l3regs itself, since it doesn't really use syscon for anything.
> 

I agree.  Just need time to do it.

Alan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
