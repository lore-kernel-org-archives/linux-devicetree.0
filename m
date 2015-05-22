From: Ilya Faenson <ifaenson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [RFC v4 0/4] Broadcom Bluetooth UART device driver
Date: Fri, 22 May 2015 16:10:16 -0400
Message-ID: <1432325420-12782-1-git-send-email-ifaenson@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Cc: linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ilya Faenson <ifaenson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The next version of the driver changed as per Arend's comments.
The next step should be integration with the H4 line discipline
and BlueZ protocol enhancements from Intel. 

Ilya Faenson (4):
  Broadcom Bluetooth UART Device Tree bindings
  Broadcom Bluetooth UART Platform Driver
  Broadcom Bluetooth protocol UART support
  BlueZ Broadcom UART Protocol

 .../devicetree/bindings/net/bluetooth/btbcm.txt    |  82 +++
 drivers/bluetooth/Kconfig                          |   9 +
 drivers/bluetooth/Makefile                         |   1 +
 drivers/bluetooth/btbcm.c                          | 155 ++++-
 drivers/bluetooth/btbcm_uart.c                     | 674 +++++++++++++++++++++
 drivers/bluetooth/btbcm_uart.h                     |  89 +++
 drivers/bluetooth/hci_bcm.c                        | 528 +++++++++++++++-
 7 files changed, 1518 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/btbcm.txt
 create mode 100644 drivers/bluetooth/btbcm_uart.c
 create mode 100644 drivers/bluetooth/btbcm_uart.h

-- 
1.9.1
