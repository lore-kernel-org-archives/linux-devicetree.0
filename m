From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] device-tree: nexus7: Add IMEM syscon and reboot
 reason support
Date: Tue, 9 Aug 2016 22:27:54 -0700
Message-ID: <20160810052754.GK26240@tuxbot>
References: <1470695643-32169-1-git-send-email-john.stultz@linaro.org>
 <1470695643-32169-2-git-send-email-john.stultz@linaro.org>
 <20160810042834.GG26240@tuxbot>
 <CALAqxLWWDQVyMVEP5kB2h0ig0WuX8Vq8TmO_Gd+Yaesa1k3qwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CALAqxLWWDQVyMVEP5kB2h0ig0WuX8Vq8TmO_Gd+Yaesa1k3qwA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue 09 Aug 22:04 PDT 2016, John Stultz wrote:

> On Tue, Aug 9, 2016 at 9:28 PM, Bjorn Andersson
> <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Mon 08 Aug 15:34 PDT 2016, John Stultz wrote:
> >
> >> This patch add the IMEM syscon memory region to the DT,
> >> as well as addds support for the magic reboot reason
> >> values that are written to the address for each mode.
> >>
> >
> > This looks good, double checked the addresses and magics. But I think
> > you should move the entire thing to qcom-apq8064.dtsi, as this is common
> > to the base platform.
> 
> Interesting, so do all 8064's use the same bootloader?
> 

As far as I can tell, the APQ8064 comes with 4kb of IMEM, so that part
is common regardless.

There is no indication of the restart reason being "optional" in the
downstream kernel, but that's not necessarily a "yes" to your question.

So, please move it to the apq8064.dtsi, as there are no indications of
systems not having this setup. Worst case would be that I'm wrong and we
have to move it out to all current targets sometime in the future.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
