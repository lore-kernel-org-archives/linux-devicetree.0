From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH 5/6] Bluetooth: mediatek: update the common setup between
 MT7622 and other devices
Date: Mon, 18 Feb 2019 14:09:31 +0100
Message-ID: <B862A902-56CD-4397-9326-BAB3CB71D60F@holtmann.org>
References: <cover.1550184473.git.sean.wang@mediatek.com>
 <9ea118140651636b3b868e28004d474ded4af5b6.1550184473.git.sean.wang@mediatek.com>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9ea118140651636b3b868e28004d474ded4af5b6.1550184473.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, Johan Hedberg <johan.hedberg@gmail.com>, devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sean,

> Update the setup sequence on MT7622 to apply the same flow with MT7663U
> and MT7668U USB [1] as much as possible. These additional commands are
> required to parse the corresponding event to determine what current state
> the Bluetooth device is on and thus it's necessary to extend
> mtk_hci_wmt_sync to support the reading status in the same patch.
> 
> [1] http://lists.infradead.org/pipermail/linux-mediatek/2019-January/017074.html
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> drivers/bluetooth/btmtkuart.c | 204 +++++++++++++++++++++++++++++++---
> 1 file changed, 190 insertions(+), 14 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
