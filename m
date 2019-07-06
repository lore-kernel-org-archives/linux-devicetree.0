From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH v1 0/4] add boot-gpios and clock property to btmtkuart
Date: Sat, 6 Jul 2019 13:01:08 +0200
Message-ID: <1E60D580-3D91-4AF0-8CCC-4576C54D2258@holtmann.org>
References: <1559437457-26766-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559437457-26766-1-git-send-email-sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, Johan Hedberg <johan.hedberg@gmail.com>, devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sean,

> Update dt-binding and the corresponding implmentation of boot-gpios and clock
> property to btmtkuart.
> 
> Sean Wang (4):
>  dt-bindings: net: bluetooth: add boot-gpios property to UART-based
>    device
>  dt-bindings: net: bluetooth: add clock property to UART-based device
>  Bluetooth: btmtkuart: add an implementation for boot-gpios property
>  Bluetooth: btmtkuart: add an implementation for clock osc property
> 
> .../bindings/net/mediatek-bluetooth.txt       | 17 +++++++
> drivers/bluetooth/btmtkuart.c                 | 51 +++++++++++++++----
> 2 files changed, 58 insertions(+), 10 deletions(-)

all four patches have been applied to bluetooth-next tree.

Regards

Marcel
