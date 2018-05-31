From: Avi Fishman <avifishman70@gmail.com>
Subject: Re: [PATCH v2 0/3] USB host: Add USB ehci support for nuvoton npcm7xx
Date: Thu, 31 May 2018 16:31:35 +0300
Message-ID: <CAKKbWA7iyokX8sC=EyCB+53TsmD-aHZegX0kcsNpmfpyRhhSeg@mail.gmail.com>
References: <1527773132-7491-1-git-send-email-AviFishman70@gmail.com> <CAKKbWA6CF3M7+ohT5dsrmQbR_S1om+zQVgakAsYb165PBctadA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKKbWA6CF3M7+ohT5dsrmQbR_S1om+zQVgakAsYb165PBctadA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>, mathias.nyman@linux.intel.com, bjorn.andersson@linaro.org, jhogan@kernel.org, albeu@free.fr, chunfeng.yun@mediatek.com, Tony Lindgren <tony@atomide.com>, baolu.lu@linux.intel.com, Alex Elder <elder@linaro.org>, Dmitry Osipenko <digetx@gmail.com>, Kate Stewart <kstewart@linuxfoundation.org>, hdegoede@redhat.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, davem@davemloft.n
List-Id: devicetree@vger.kernel.org

Changes since version 1:
- Follow Rob comments in device tree documentation
- minor log error fix in ehci-npcm7xx.c

This patch adds support for ehci controller for the Nuvoton npcm7xx platform.
Most of the code was taken from ehci-spear.c + specific initialization code

Avi Fishman (3):
  USB host: Add USB ehci support for nuvoton npcm7xx platform
  USB: DT probing support to ehci-npcm7xx
  MAINTAINERS: add subfolders for nuvoton *npcm*

 .../devicetree/bindings/usb/npcm7xx-usb.txt        |  17 ++
 MAINTAINERS                                        |   3 +
 drivers/usb/host/Kconfig                           |   8 +
 drivers/usb/host/Makefile                          |   1 +
 drivers/usb/host/ehci-npcm7xx.c                    | 212 +++++++++++++++++++++
 5 files changed, 241 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
 create mode 100644 drivers/usb/host/ehci-npcm7xx.c


-- 
2.14.1
