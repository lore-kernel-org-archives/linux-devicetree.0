From: Alexey Roslyakov <alexey.roslyakov@gmail.com>
Subject: [PATCH net-next v2 0/2] brcmfmac: add new dt entries for SG SDIO settings
Date: Mon, 19 Mar 2018 08:40:30 +0700
Message-ID: <20180319014032.9394-1-alexey.roslyakov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andrew@lunn.ch, kvalo@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, arend.vanspriel@broadcom.com, franky.lin@broadcom.com, hante.meuleman@broadcom.com, chi-hsien.lin@cypress.com, wright.feng@cypress.com, netdev@vger.kernel.org
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com
List-Id: devicetree@vger.kernel.org

Changes in v2: don't check of_property_read_* return values since it
doesn't change the value if property not found.
Suggested by Andrew Lunn.
