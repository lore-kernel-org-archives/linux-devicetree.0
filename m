From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH v2 0/2] Bluetooth: mediatek: add support for MediaTek
 MT7663U and MT7668U UART devices
Date: Sat, 2 Mar 2019 17:50:26 +0100
Message-ID: <172BBF8E-16EC-4DF8-99D6-B991FADA91B6@holtmann.org>
References: <cover.1551405664.git.sean.wang@mediatek.com>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1551405664.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Johan Hedberg <johan.hedberg@gmail.com>, devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sean,

> v2: changes since v1
> - add Rob's review tag
> - removed these merged patches
> 
> This adds the support of enabling MT7668U and MT7663U UART based Bluetooth
> function running on the top of btmtkuart driver.
> 
> We are through several patches to reach the goal and also wish applied
> the same flow in MediaTek btusb [1] for the transport independence.
> Once [1] and the series is being merged and then in next step I will
> consider to add a btmtk.c to hold these independent operations among
> various transport reused by MediaTek UART, USB and SDIO-based Bluetooth.
> 
> Firstly,
> in patch 1/6 to update the dt-binding document for the kind of devices.
> in patch 2/6, 3/6 to fix the common error issues in the current code.
> in Patch 4/6, 5/6 to add the general flow which MT7622 and even MT7663U and
> MT7668U USB devices also utilize.
> 
> Finally, in patch 6/6 to add the specific setups for MediaTek UART-based
> Bluetooth and enable MT7663U and MT7668U device.
> 
> [1] http://lists.infradead.org/pipermail/linux-mediatek/2019-January/017074.html 
> 
> Sean Wang (2):
>  dt-bindings: net: bluetooth: add support for MediaTek MT7663U and
>    MT7668U UART devices
>  Bluetooth: mediatek: add support for MediaTek MT7663U and MT7668U UART
>    devices
> 
> .../bindings/net/mediatek-bluetooth.txt       |  64 ++++
> drivers/bluetooth/btmtkuart.c                 | 281 +++++++++++++++++-
> 2 files changed, 335 insertions(+), 10 deletions(-)

I applied patch 1/2 but it seems patch 2/2 is missing. Please re-send.

Regards

Marcel
