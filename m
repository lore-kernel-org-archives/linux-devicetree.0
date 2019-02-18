From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH 3/6] Bluetooth: mediatek: fix up an error path to restore
 bdev->tx_state
Date: Mon, 18 Feb 2019 14:07:05 +0100
Message-ID: <DA63C054-59A4-4881-A475-7345A644D4FF@holtmann.org>
References: <cover.1550184473.git.sean.wang@mediatek.com>
 <b1a496748170af6a89d8ba19db9412787ef53668.1550184473.git.sean.wang@mediatek.com>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b1a496748170af6a89d8ba19db9412787ef53668.1550184473.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, Johan Hedberg <johan.hedberg@gmail.com>, devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sean,

> Restore bdev->tx_state with clearing bit BTMTKUART_TX_WAIT_VND_EVT
> when there is an error on waiting for the corresponding event.
> 
> Fixes: 7237c4c9ec92 ("Bluetooth: mediatek: Add protocol support for MediaTek serial devices")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> drivers/bluetooth/btmtkuart.c | 2 ++
> 1 file changed, 2 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel
