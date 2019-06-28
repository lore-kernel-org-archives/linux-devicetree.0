From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v1] arm: dts: mediatek: add basic support for MT7629 SoC
Date: Fri, 28 Jun 2019 16:32:18 -0700
Message-ID: <7hy31lp9q5.fsf@baylibre.com>
References: <a8ca0018ac8a4c5f61a7a1efc9dc5dccd768628b.1552449524.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a8ca0018ac8a4c5f61a7a1efc9dc5dccd768628b.1552449524.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ryder.lee@kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Weijie Gao <weijie.gao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Steven Liu <steven.liu@mediatek.com>
List-Id: devicetree@vger.kernel.org

<ryder.lee@kernel.org> writes:

> From: Ryder Lee <ryder.lee@mediatek.com>
>
> This adds basic support for MT7629 reference board.
>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

Just noticing this is not upstream yet.

I did a basic boot test to ramdisk on the mt7629-rfb board donated for
kernelCI (thanks MediaTek!) and it boots just fine.

Tested-by: Kevin Hilman <khilman@baylibre.com>

Kevin
