From: Avi Fishman <avifishman70@gmail.com>
Subject: Re: [PATCH v6 1/3] USB host: Add USB ehci support for nuvoton npcm7xx platform
Date: Tue, 19 Jun 2018 20:47:54 +0300
Message-ID: <CAKKbWA79=k-HEinMNNw7y8bCg2s2M+_S8uFDuR-sQz7A7zFSPg@mail.gmail.com>
References: <20180619142246.104469-2-avifishman70@gmail.com> <Pine.LNX.4.44L0.1806191044530.1473-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44L0.1806191044530.1473-100000@iolanthe.rowland.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>, mathias.nyman@linux.intel.com, bjorn.andersson@linaro.org, jhogan@kernel.org, albeu@free.fr, chunfeng.yun@mediatek.com, Tony Lindgren <tony@atomide.com>, baolu.lu@linux.intel.com, Alex Elder <elder@linaro.org>, Dmitry Osipenko <digetx@gmail.com>, Kate Stewart <kstewart@linuxfoundation.org>, hdegoede@redhat.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 19, 2018 at 5:49 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, 19 Jun 2018 avifishman70@gmail.com wrote:
>
> > From: Avi Fishman <AviFishman70@gmail.com>
> >
> > This patch adds support for ehci controller for the Nuvoton
> > npcm7xx platform.
> > Most of the code was taken from ehci-spear.c + specific initialization
> > code
> >
> > Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
> > ---
> >  drivers/usb/host/Kconfig        |   8 ++
> >  drivers/usb/host/Makefile       |   1 +
> >  drivers/usb/host/ehci-npcm7xx.c | 212 ++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 221 insertions(+)
> >  create mode 100644 drivers/usb/host/ehci-npcm7xx.c
> >
> > diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> > index 9f0aeb068acb..e3100b249f0f 100644
> > --- a/drivers/usb/host/Kconfig
> > +++ b/drivers/usb/host/Kconfig
> > @@ -185,6 +185,14 @@ config USB_EHCI_MXC
> >       ---help---
> >         Variation of ARC USB block used in some Freescale chips.
> >
> > +config USB_EHCI_HCD_NPCM7XX
> > +     tristate "Support for Nuvoton NPCM7XX on-chip EHCI USB controller"
> > +     depends on (USB_EHCI_HCD && ARCH_NPCM7XX) || COMPILE_TEST
> > +     default y
>
> Are you sure this is what you want?  The value defaults to Y whenever
> COMPILE_TEST is enabled?  Will that annoy people doing compile tests?
>

Do you recomment to change to:
default y if (USB_EHCI_HCD && ARCH_NPCM7XX)

> Aside from that one issue,
>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
>
> Alan Stern
>
