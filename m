From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v1 06/19] arm: dts: mt7623: fix USB initialization fails
 on bananapi-r2
Date: Mon, 12 Mar 2018 12:03:57 +0100
Message-ID: <81aab78c-a921-3d80-1636-fc4b797b4517@gmail.com>
References: <cover.1519378871.git.sean.wang@mediatek.com>
 <bcb9dbeb1389e71f4eaba0c2def1c991703e10c4.1519378872.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bcb9dbeb1389e71f4eaba0c2def1c991703e10c4.1519378872.git.sean.wang@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 02/23/2018 11:16 AM, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Fix that USB initialization fails as below runtime log is present during
> booting on bananapi-r2 board by adding missing regulators the USB device
> requires. Current regulators USB device uses are being updated with the
> correct ones to reflect real configurations which are all from fixed
> regulators rather than MT6323 one's output.
> 
> [    6.473958] xhci-mtk 1a1c0000.usb: fail to get vbus
> [    6.479313] xhci-mtk 1a240000.usb: fail to get vbus
> 
> Cc: stable@vger.kernel.org
> Fixes: f4ff257cd160 ("arm: dts: mt7623: add support for Bananapi R2 (BPI-R2) board")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 

Pushed to v4.16-next/dts32
