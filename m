From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH 4/6] Bluetooth: mediatek: pass a pointer to
 mtk_hci_wmt_sync
Date: Mon, 18 Feb 2019 14:08:10 +0100
Message-ID: <7A2615D4-1497-4BE2-8E89-66447370E31E@holtmann.org>
References: <cover.1550184473.git.sean.wang@mediatek.com>
 <614e7741328e835071099ddcd4f9c2afd9528534.1550184473.git.sean.wang@mediatek.com>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <614e7741328e835071099ddcd4f9c2afd9528534.1550184473.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, Johan Hedberg <johan.hedberg@gmail.com>, devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sean,

> Pass a structure pointer to mtk_hci_wmt_sync rather than several arguments
> to avoid take up additional stack area and be better to read the code.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> drivers/bluetooth/btmtkuart.c | 63 ++++++++++++++++++++++++++---------
> 1 file changed, 48 insertions(+), 15 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
