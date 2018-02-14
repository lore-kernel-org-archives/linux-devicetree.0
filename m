From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] vfio: platform: Fix reset module leak in error path
Date: Wed, 14 Feb 2018 10:32:11 +0100
Message-ID: <CAMuHMdXm97QFTC8VYDoByHsXaG5BQqFdhwqMTuGVRKDe-oh8EQ@mail.gmail.com>
References: <1518539815-13774-1-git-send-email-geert+renesas@glider.be>
 <1518539815-13774-2-git-send-email-geert+renesas@glider.be> <2fe86be6-a3e2-9bd6-1d72-63cf0fe3a731@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2fe86be6-a3e2-9bd6-1d72-63cf0fe3a731@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Auger Eric <eric.auger@redhat.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Baptiste Reynal <b.reynal@virtualopensystems.com>, Alex Williamson <alex.williamson@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, KVM list <kvm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Eric,

On Wed, Feb 14, 2018 at 9:36 AM, Auger Eric <eric.auger@redhat.com> wrote:
> If I am not wrong we also leak the reset_module if
> vfio_platform_get_reset() fails to find the reset function (of_reset ==
> NULL), in which case we should do the module_put() in
> vfio_platform_get_reset().

Correct. Will look into fixing it...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
