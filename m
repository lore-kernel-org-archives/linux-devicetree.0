From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] vfio: platform: Fix using devices in PM Domains
Date: Wed, 11 Apr 2018 11:21:45 +0200
Message-ID: <CAMuHMdUR0rVNWUeWPr6JE3uKXhGspnzLEb-BBgg_5_+WvMD6=g@mail.gmail.com>
References: <1523438149-16433-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523438149-16433-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Baptiste Reynal <b.reynal@virtualopensystems.com>, Alex Williamson <alex.williamson@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, KVM list <kvm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 11, 2018 at 11:15 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> If a device is part of a PM Domain (e.g. power and/or clock domain), its
> power state is managed using Runtime PM.  Without Runtime PM, the device
> may not be powered up, causing subtle failures, crashes, or system
> lock-ups when the device is accessed by the guest.
>
> Fix this by adding Runtime PM support, powering the device when the VFIO
> device is opened by the guest.
>
> Note that while more fine-grained power management could be implemented
> on the guest side, if exported, this would be inherently unsafe, as
> abusing it may kill the whole system.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Please ignore, this was sent accidentally with another series.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
