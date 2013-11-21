From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] driver core: introduce module_platform_driver_match_and_probe
Date: Thu, 21 Nov 2013 23:11:59 +0000
Message-ID: <20131121231159.9CB1BC40753@trevor.secretlab.ca>
References: <1383113571-13029-1-git-send-email-robherring2@gmail.com> < 1383113571-13029-2-git-send-email-robherring2@gmail.com> <20131121124736. 6EBEBC40A2C@trevor.secretlab.ca> < CAL_JsqLK_ivSphWq3xLpQqUjF1nEvPjf2WQ4hJ+hThcTFae-Kg@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLK_ivSphWq3xLpQqUjF1nEvPjf2WQ4hJ+hThcTFae-Kg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 21 Nov 2013 16:33:13 -0600, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Nov 21, 2013 at 6:47 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Wed, 30 Oct 2013 01:12:50 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> >>
> >> Introduce a helper to match, create and probe a platform device. This
> >> is for drivers such as cpuidle or cpufreq that typically don't have a
> >> bus device node and need to match on a system-level compatible property.
> >>
> >> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> >> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> >
> > Oh, ick. Please no. If a platform_device isn't getting created for a
> > device tree node, then we should be asking why it isn't getting created
> > and fix the core logic rather than trying to bodge it in the driver init
> > code.
> >
> > We should never be creating and registering devices in module init code.
> > We've spent the last 4 years trying to get away from that.
> 
> This is for devices that have no DT device node to be associated with
> and therefore will never have a device created by the core DT code.
> Instead the devices are created based off of the root compatible
> property. cpuidle drivers are one such example [1]. We already do this
> today by putting the platform device creation in the
> machine_desc.init_machine function which is a conditional initcall.
> The motivation for changing this is how to support drivers like this
> on arm64 which doesn't want any platform code or machine_desc. At
> least historically, we didn't want DT nodes of Linux specific devices
> in the DT. So, how would you propose to solve this problem?

Honestly? With a machine_desc.  :-)

Actually, I'm totally serious here. That is why machine_desc is still a
good idea. There are always going to be a few per-platform bits that
need to be present, although the hope is the per-platform will be at the
SoC family level instead of the board level.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
