From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: [PATCH 0/3] bluetooth: hci_ll: Get MAC address from NVMEM
Date: Sun,  3 Dec 2017 21:21:19 -0600
Message-ID: <1512357682-8911-1-git-send-email-david@lechnology.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds supporting getting the MAC address from a NVMEM provider
for "LL" HCI controllers (Texas Instruments).

The second patch is just cleaning things up before I add another similar
vendor-specific HCI command constant in the final patch.

David Lechner (3):
  dt-bindings: Add optional nvmem MAC address bindings to ti,wlink-st
  bluetooth: hci_ll: add constant for vendor-specific command
  bluetooth: hci_ll: Add optional nvmem MAC address source

 .../devicetree/bindings/net/ti,wilink-st.txt       |  4 ++
 drivers/bluetooth/hci_ll.c                         | 43 +++++++++++++++++++++-
 2 files changed, 45 insertions(+), 2 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
