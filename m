From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/2] arm64: dts: mt7622: fix console output issue on rfb1
Date: Wed, 07 Nov 2018 07:48:45 -0800
Message-ID: <7hr2fwevmq.fsf@baylibre.com>
References: <8043d487e7bd20a11b14d832702bda214a9a694f.1541566473.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8043d487e7bd20a11b14d832702bda214a9a694f.1541566473.git.ryder.lee@mediatek.com>
        (Ryder Lee's message of "Wed, 7 Nov 2018 12:59:43 +0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Weijie Gao <weijie.gao@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Ryder Lee <ryder.lee@mediatek.com> writes:

> The issue was introduced by Kernel CI:
> https://kernelci.org/boot/id/5bbdcbad59b5146fc5b43592/

The issue was *found* by kernelCI, not introduced by kernelCI. ;)

> Fix this by using a 'stdout-path' property that points to the device.
>
> Fixes: c0d9f9ad4f76 ("arm64: dts: mt7622: add earlycon to mt7622-rfb1 board")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

Tested-by: Kevin Hilman <khilman@baylibre.com>

Note that this patch fixes the problem where there is no more console
output, but current mainline still doesn't boot as there's another
crash: http://termbin.com/zitb

Kevin
