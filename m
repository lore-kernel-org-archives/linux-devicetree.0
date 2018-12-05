From: Peter Chen <hzpeterchen@gmail.com>
Subject: Re: [RFC PATCH v2 04/15] usb:cdns3: Driver initialization code.
Date: Wed, 5 Dec 2018 17:07:37 +0800
Message-ID: <CAL411-p+ShK7+T+QkebGit7LaUtgnrCs1_Uy04KrKvwUDfh3oQ@mail.gmail.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-5-git-send-email-pawell@cadence.com> <CAL411-rWbQ6yj1r_aaLP8UagVRJhsn7xdznQwXS9enkxXTs2LA@mail.gmail.com>
 <BYAPR07MB4709A8E4B0B0CC05A842B708DDAD0@BYAPR07MB4709.namprd07.prod.outlook.com>
 <CAL411-rzhH+y-b0-xze4-WmeVtey4bXt4Jc6TWYyfw6E8x-5Eg@mail.gmail.com>
 <BYAPR07MB47090A16A7A8A85C6C3FD46ADDA80@BYAPR07MB4709.namprd07.prod.outlook.com>
 <MWHPR07MB3502A7A07AD114D6343BD6C0D8A80@MWHPR07MB3502.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <MWHPR07MB3502A7A07AD114D6343BD6C0D8A80@MWHPR07MB3502.namprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: adouglas@cadence.com
Cc: pawell@cadence.com, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, rogerq@ti.com, lkml <linux-kernel@vger.kernel.org>, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

On Wed, Dec 5, 2018 at 4:55 PM Alan Douglas <adouglas@cadence.com> wrote:
>
> Hi Peter,
>
> On 05 December 2018 07:20, Pawel Laszczak wrote:
> > Hi,
> >
> > >> >>
> > >> >> Patch adds core.c and core.h file that implements initialization
> > >> >> of platform driver and adds function responsible for selecting,
> > >> >> switching and running appropriate Device/Host mode.
> > >> >>
> > >> >> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> > >> >> ---
> > >> >>  drivers/usb/cdns3/Makefile |   2 +
> > >> >>  drivers/usb/cdns3/core.c   | 413 +++++++++++++++++++++++++++++++++++++
> > >> >>  drivers/usb/cdns3/core.h   | 100 +++++++++
> > >> >>  3 files changed, 515 insertions(+)
> > >> >>  create mode 100644 drivers/usb/cdns3/core.c
> > >> >>  create mode 100644 drivers/usb/cdns3/core.h
> > >> >>
> > >> >> diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
> > >> >> index dcdd62003c6a..02d25b23c5d3 100644
> > >> >> --- a/drivers/usb/cdns3/Makefile
> > >> >> +++ b/drivers/usb/cdns3/Makefile
> > >> >> @@ -1,3 +1,5 @@
> > >> >> +obj-$(CONFIG_USB_CDNS3)                        += cdns3.o
> > >> >>  obj-$(CONFIG_USB_CDNS3_PCI_WRAP)       += cdns3-pci.o
> > >> >>
> > >> >> +cdns3-y                                        := core.o
> > >> >>  cdns3-pci-y                            := cdns3-pci-wrap.o
> > >> >> diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> > >> >> new file mode 100644
> > >> >> index 000000000000..f9055d4da67f
> > >> >> --- /dev/null
> > >> >> +++ b/drivers/usb/cdns3/core.c
> > >> >> @@ -0,0 +1,413 @@
> > >> >> +// SPDX-License-Identifier: GPL-2.0
> > >> >> +/*
> > >> >> + * Cadence USBSS DRD Driver.
> > >> >> + *
> > >> >> + * Copyright (C) 2018 Cadence.
> > >> >> + *
> > >> >
> > >> >Please add NXP copyright too.
> > >>
> > >> Ok, I don't know why I omitted this.
> > >> I know that you are the main author of this file
> > >> Sorry for that.
> > >>
> > >> One additional question. What year I should add in Copyright for NXP?.
> > >> The original year 2017 or I should modified all to 2018.
> > >>
> > >Please use below copyright, thanks.
> > >
> > >Copyright 2017-2018 NXP
> >
> > I add this in all files  modified or created by you.
> > >
> > >
> > >
> > >> >> +       mutex_init(&cdns->mutex);
> > >> >> +
> > >> >> +       cdns->phy = devm_phy_get(dev, "cdns3,usbphy");
> > >> >> +       if (IS_ERR(cdns->phy)) {
> > >> >> +               dev_info(dev, "no generic phy found\n");
> > >> >> +               cdns->phy = NULL;
> > >> >> +               /*
> > >> >> +                * fall through here!
> > >> >> +                * if no generic phy found, phy init
> > >> >> +                * should be done under boot!
> > >> >> +                */
> > >> >
> > >> >If the phy driver is defer-probed, it will be here, it is not an error.
> > >> >I think you could have a generic phy driver or usb generic phy driver
> > >> >(drivers/usb/phy/phy-generic.c) even you don't need any operations for
> > >> >PHY. It will be easy for other platforms.
> > >>
> > >> Yes, Roger ask me to modify this fragment. In next version it will look like:
> > >>         cdns->phy = devm_phy_get(dev, "cdns3,usbphy");
> > >>         if (IS_ERR(cdns->phy)) {
> > >>                 ret = PTR_ERR(cdns->phy);
> > >>                 if (ret == -ENOSYS || ret == -ENODEV) {
> > >>                         cdns->phy = NULL;
> > >>                 } else if (ret == -EPROBE_DEFER) {
> > >>                         return ret;
> > >>                 } else {
> > >>                         dev_err(dev, "no phy found\n");
> > >>                         goto err0;
> > >>                 }
> > >>         }
> > >>
> > >>         phy_init(cdns->phy);
> > >>
> > >> We are going to use phy driver. I don't know if it correct.
> > >> I don't have experience in this filed.
> > >> We need phy initialization but I don't have testing platform now.
> > >> In most usb drivers I see that there are used usb phy driverd instead phy dirverd.
> > >>
> > >
> > >At my CDNS3 platform, there are some USB PHY initialization for register setting
> > >and clock enable. You could add generic PHY driver under: drivers/phy/cadence/.
> > >
> > >Above PHY initialization code is OK for me.
> >
> > It will be added as separate driver.
> > I think that Allan Douglas working on it.
> > I ask him to add you to -cc in patch for phy.
> Patch series for the cadence Sierra generic PHY driver can be found here:
> https://lore.kernel.org/patchwork/cover/1011486/
>
> It can also be found in Kishon's linux-phy git tree at
>     git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git
> in the 'next' branch.
>
> It will be great if you are able to take a look at it.

I will test it, and submit some changes if needed, thanks.

Peter
