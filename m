From: Iyappan Subramanian <isubramanian@apm.com>
Subject: [PATCH 0/3] Fix backward compatibility of newer firmware with older kernel
Date: Fri, 27 Feb 2015 12:08:27 -0800
Message-ID: <1425067710-14879-1-git-send-email-isubramanian@apm.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, mlangsdo@redhat.com, patches@apm.com, Iyappan Subramanian <isubramanian@apm.com>
List-Id: devicetree@vger.kernel.org

Kernel 3.17 driver supports only RGMII ethernet interface.
Since the Tianocore DT contains same compatibility string for RGMII,
SGMII based 1G and XFI based 10G interfaces, crash happens when probe called
on SGMII based 1G and XFI based 10G interface.

This patch fixes the backward compatibility of the older driver with the
newer firmware by making the binding unique so that the older driver won't
recognize the non-supported interfaces.

---

Iyappan Subramanian (3):
  Documentation: dts: Update compatible field description for APM X-Gene
  dtb: change binding name to match with newer firmware DT
  drivers: net: xgene: fix new firmware backward compatibility with
    older driver

 Documentation/devicetree/bindings/net/apm-xgene-enet.txt | 3 ++-
 arch/arm64/boot/dts/apm/apm-storm.dtsi                   | 4 ++--
 drivers/net/ethernet/apm/xgene/xgene_enet_main.c         | 4 ++++
 3 files changed, 8 insertions(+), 3 deletions(-)

-- 
1.9.1
