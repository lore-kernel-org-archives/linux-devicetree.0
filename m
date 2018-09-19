From: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH/RFC v4 2/2] vfio: platform: Add generic reset controller
 support
Date: Wed, 19 Sep 2018 12:19:37 -0600
Message-ID: <20180919121937.4c7fac9c@t450s.home>
References: <20180917163955.19023-1-geert+renesas@glider.be>
        <20180917163955.19023-3-geert+renesas@glider.be>
        <b7c4f5d1-020b-4a64-d511-b8e89f8c9196@redhat.com>
        <CAMuHMdXM9eog_+1oV_YCmSbOfBSFWOXy+YXwKGvfJA65rDqtzA@mail.gmail.com>
        <9dc74e23-2f57-7db3-6fb6-4f75ed61575f@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9dc74e23-2f57-7db3-6fb6-4f75ed61575f@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Auger Eric <eric.auger@redhat.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Philipp Zabel <p.zabel@pengutronix.de>, KVM list <kvm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 19 Sep 2018 17:31:43 +0200
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Geert,
> 
> On 9/19/18 2:54 PM, Geert Uytterhoeven wrote:
> > Hi Eric,
> > 
> > On Wed, Sep 19, 2018 at 2:36 PM Auger Eric <eric.auger@redhat.com> wrote:  
> >> On 9/17/18 6:39 PM, Geert Uytterhoeven wrote:  
> >>> Vfio-platform requires dedicated reset support, provided either by ACPI,
> >>> or, on DT platforms, by a device-specific reset driver matching against
> >>> the device's compatible value.
> >>>
> >>> On many SoCs, devices are connected to an SoC-internal reset controller.
> >>> If the reset hierarchy is described in DT using "resets" properties, or
> >>> in lookup tables in platform code, such devices can be reset in a
> >>> generic way through the reset controller subsystem.  Hence add support
> >>> for this, avoiding the need to write device-specific reset drivers for
> >>> each single device on affected SoCs.
> >>>
> >>> Devices that do require a more complex reset procedure can still provide
> >>> a device-specific reset driver, as that takes precedence.
> >>>
> >>> Note that this functionality depends on CONFIG_RESET_CONTROLLER=y, and
> >>> becomes a no-op (as in: "No reset function found for device") if reset
> >>> controller support is disabled.
> >>>
> >>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> >>> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>  
> >   
> >>> --- a/drivers/vfio/platform/vfio_platform_common.c
> >>> +++ b/drivers/vfio/platform/vfio_platform_common.c  
> >   
> >>> @@ -128,8 +131,16 @@ static int vfio_platform_get_reset(struct vfio_platform_device *vdev)
> >>>               vdev->of_reset = vfio_platform_lookup_reset(vdev->compat,
> >>>                                                       &vdev->reset_module);
> >>>       }
> >>> +     if (vdev->of_reset)
> >>> +             return 0;
> >>> +
> >>> +     rstc = reset_control_get_dedicated(vdev->device, NULL);
> >>> +     if (!IS_ERR(rstc)) {
> >>> +             vdev->reset_control = rstc;
> >>> +             return 0;
> >>> +     }
> >>>
> >>> -     return vdev->of_reset ? 0 : -ENOENT;
> >>> +     return PTR_ERR(rstc);  
> >> This changes the returned value as seen by the user (probe returned
> >> valud). Can we keep -ENOENT in case of no reset controller found?  
> > 
> > On success, it still returns 0.
> > On failure, it forwards the error from reset_control_get_dedicated(), which
> > is IMHO better than replacing it by -ENOENT: we try to propagate error
> > codes as much as possible.  It could e.g. return -EPROBE_DEFER.
> > 
> > Is there anything that relies on the function returning -ENOENT?  
> None I am aware of actually. I was afraid about compatibility break but
> here we would change an errno by another one so maybe that's not a big
> deal at that stage of vfio_platform usage?

Yeah, I don't see that one errno vs another really matters in the grand
scheme of things.  I also don't see that propagating this particular
errno adds much value, but it is good general practice, so seems ok to
me unless there are other concerns.  Thanks,

Alex
