From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/7] dt-bindings: arm: mediatek: add support for MT7622
 BPI-R64 and MT7629 RFB
Date: Wed, 13 Feb 2019 14:12:23 -0600
Message-ID: <CAL_JsqLan+-p661a=p2Ss7tsQHdu7YGqwe3OmYkwAKE=LeqT=w@mail.gmail.com>
References: <d1ab6c89b115ad0582815816490fa0c13ea83178.1548735271.git.ryder.lee@mediatek.com>
 <1421bc57f9f4d5f3e087a1fd38c5fa9ef087dd1b.1548735271.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421bc57f9f4d5f3e087a1fd38c5fa9ef087dd1b.1548735271.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@kernel.org>, Weijie Gao <weijie.gao@mediatek.com>, Roy Luo <roychl666@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 28, 2019 at 10:31 PM Ryder Lee <ryder.lee@mediatek.com> wrote:
>
> Update binding document for MT7622 BPI-R64 and MT7629 reference board.
>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.txt | 7 +++++++
>  1 file changed, 7 insertions(+)

Do you plan to apply my patch converting Mediatek to DT schema[1]? I'm
not planning to rebase it now that this one is applied and resend it.

Rob

[1] https://patchwork.ozlabs.org/patch/1007257/
