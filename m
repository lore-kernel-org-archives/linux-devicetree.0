From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: [PATCH v2 0/3] Bluetooth: hci_ll: Get BD address from NVMEM (was "bluetooth: hci_ll: Get MAC address from NVMEM")
Date: Thu,  7 Dec 2017 20:57:37 -0600
Message-ID: <1512701860-8321-1-git-send-email-david@lechnology.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds supporting getting the BD address from a NVMEM provider
for "LL" HCI controllers (Texas Instruments).

v2 changes:
* Fixed typos in dt-bindings
* Use "bd-address" instead of "mac-address"
* Updated dt-bindings to specify the byte order of "bd-address"
* New patch "Bluetooth: hci_ll: add support for setting public address"
* Dropped patch "Bluetooth: hci_ll: add constant for vendor-specific command"
  that is already in bluetooth-next
* Rework error handling
* Use bdaddr_t, bacmp and other bluetooth utils

David Lechner (3):
  Bluetooth: hci_ll: add support for setting public address
  dt-bindings: Add optional nvmem BD address bindings to ti,wlink-st
  Bluetooth: hci_ll: Add optional nvmem BD address source

 .../devicetree/bindings/net/ti,wilink-st.txt       |  5 ++
 drivers/bluetooth/hci_ll.c                         | 71 ++++++++++++++++++++++
 2 files changed, 76 insertions(+)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
