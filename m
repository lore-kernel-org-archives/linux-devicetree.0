From: Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH 0/6]Bluetooth: mediatek: add support for MediaTek
 MT7663U and MT7668U UART devices
Date: Wed, 20 Feb 2019 05:13:22 +0800
Message-ID: <1550610802.8245.1.camel@mtkswgap22>
References: <cover.1550184473.git.sean.wang@mediatek.com>
         <B7EBA86E-B6C2-4301-BA01-004EA83A50A9@holtmann.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <B7EBA86E-B6C2-4301-BA01-004EA83A50A9@holtmann.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, Johan Hedberg <johan.hedberg@gmail.com>, devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Marcel,

I will follow it up. Thank for your help!

	Sean


On Mon, 2019-02-18 at 14:10 +0100, Marcel Holtmann wrote:
> Hi Sean,
> 
> > This adds the support of enabling MT7668U and MT7663U UART based Bluetooth
> > function running on the top of btmtkuart driver.
> > 
> > We are through several patches to reach the goal and also wish applied
> > the same flow in MediaTek btusb [1] for the transport independence.
> > Once [1] and the series is being merged and then in next step I will
> > consider to add a btmtk.c to hold these independent operations among
> > various transport reused by MediaTek UART, USB and SDIO-based Bluetooth.
> > 
> > Firstly,
> > in patch 1/6 to update the dt-binding document for the kind of devices.
> > in patch 2/6, 3/6 to fix the common error issues in the current code.
> > in Patch 4/6, 5/6 to add the general flow which MT7622 and even MT7663U and
> > MT7668U USB devices also utilize.
> > 
> > Finally, in patch 6/6 to add the specific setups for MediaTek UART-based
> > Bluetooth and enable MT7663U and MT7668U device.
> > 
> > [1] http://lists.infradead.org/pipermail/linux-mediatek/2019-January/017074.html 
> > 
> > Sean Wang (6):
> >  dt-bindings: net: bluetooth: add support for MediaTek MT7663U and
> >    MT7668U UART devices
> >  Bluetooth: mediatek: trivial typo fix
> >  Bluetooth: mediatek: fix up an error path to restore bdev->tx_state
> >  Bluetooth: mediatek: pass a pointer to mtk_hci_wmt_sync
> >  Bluetooth: mediatek: update the common setup between MT7622 and other
> >    devices
> >  Bluetooth: mediatek: add support for MediaTek MT7663U and MT7668U UART
> >    devices
> > 
> > .../bindings/net/mediatek-bluetooth.txt       |  64 +++
> > drivers/bluetooth/btmtkuart.c                 | 538 ++++++++++++++++--
> > 2 files changed, 569 insertions(+), 33 deletions(-)
> 
> please re-send 1/6 and 6/6 when the DT changes are ACKed by Rob.
> 
> Regards
> 
> Marcel
> 
