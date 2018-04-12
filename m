From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 2/2] vfio: platform: Add generic DT reset controller
 support
Date: Thu, 12 Apr 2018 08:54:23 +0200
Message-ID: <20180412065422.zsm4ztlet4zgober@verge.net.au>
References: <1523375627-23746-1-git-send-email-geert+renesas@glider.be>
 <1523375627-23746-3-git-send-email-geert+renesas@glider.be>
 <20180411082226.qbhf7hcvtcns7ge3@verge.net.au>
 <CAMuHMdXq5gTrYBGnP8EfL4s_c+=JA6vXgrmgs3Wa_+8cS3jYNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXq5gTrYBGnP8EfL4s_c+=JA6vXgrmgs3Wa_+8cS3jYNA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Baptiste Reynal <b.reynal@virtualopensystems.com>, Alex Williamson <alex.williamson@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, KVM list <kvm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On Wed, Apr 11, 2018 at 10:39:19AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Wed, Apr 11, 2018 at 10:22 AM, Simon Horman <horms@verge.net.au> wrote:
> > On Tue, Apr 10, 2018 at 05:53:47PM +0200, Geert Uytterhoeven wrote:

...

> >> @@ -217,6 +236,9 @@ static int vfio_platform_call_reset(struct vfio_platform_device *vdev,
> >>       } else if (vdev->of_reset) {
> >>               dev_info(vdev->device, "reset\n");
> >>               return vdev->of_reset(vdev);
> >> +     } else if (vdev->reset_control) {
> >> +             dev_info(vdev->device, "reset\n");
> >
> > Would it be useful to differentiate between the above two informational
> > messages?
> 
> Probably not, there's also no differentiation with the message for the
> ACPI case above (out of visible context).

Thanks, I agree that it seems fine to leave things as you have them above.
