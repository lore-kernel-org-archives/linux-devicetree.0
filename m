From: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/5 v10] dt/bindings: Add binding for the DA8xx MUSB
 driver
Date: Fri, 11 Mar 2016 10:06:03 -0600
Message-ID: <20160311160603.GF20204@uda0271908>
References: <1457684989-13318-1-git-send-email-petr@barix.com>
 <20160311155115.GC20204@uda0271908>
 <56E2EB3C.6080602@barix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56E2EB3C.6080602-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Mar 11, 2016 at 04:58:52PM +0100, Petr Kulhavy wrote:
> 
> 
> On 11.03.2016 16:51, Bin Liu wrote:
> >Hi,
> >
> >On Fri, Mar 11, 2016 at 09:29:45AM +0100, Petr Kulhavy wrote:
> >>DT binding for the TI DA8xx/OMAP-L1x/AM17xx/AM18xx MUSB driver.
> >It seems the dts(i) file is not touched in this patch set, so DA8xx MUSB
> >still does not use DT with these patches?  Or did I miss anything?
> >
> >Thanks,
> >-Bin.
> Hi Bin,
> 
> I have not touched the DA8xx dtsi file as I have these changes in my
> own board specific dts.
> But I can create another patch if you find it sensible. For me it
> makes sense.

Okay, that is up to you, you can submit that patch whenever you are
ready. I will take this patch set when all comments are sorted out.

I am having 2nd thought on parsing the clock prop, Sergei's comment
might be better. I will look more on this over this weekend. (DT is not
in my expertise...)

Regards,
-Bin.

> 
> Petr
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
