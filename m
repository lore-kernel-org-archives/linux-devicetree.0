From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH RESEND 0/2] Fix STM32F7 DWC2 OTG HS binding
Date: Thu, 1 Mar 2018 11:05:33 +0100
Message-ID: <1519898735-10319-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Youn <johnyoun@synopsys.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

This patchset fixes STM32F7 DWC2 OTG HS binding. It actually
re-applies the v2 former patches adding STM32F7 DWC2 OTG HS support.
Bindings reviewed by Rob Herring.

Amelie Delaunay (2):
  dt-bindings: usb: fix the STM32F7 DWC2 OTG HS core binding
  usb: dwc2: fix STM32F7 USB OTG HS compatible

 Documentation/devicetree/bindings/usb/dwc2.txt | 2 +-
 drivers/usb/dwc2/params.c                      | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.7.4
