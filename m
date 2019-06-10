From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v4 01/14] dt-bindings: Add binding for MT2712 MIPI-CSI2
Date: Mon, 10 Jun 2019 12:32:06 +0900
Message-ID: <CAHD77H=vuPi2Rj4Mw-CQ2=UYX7YnS8w8FpUk0QTVxNUVLWKbJg@mail.gmail.com>
References: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
 <1559643115-15124-2-git-send-email-stu.hsieh@mediatek.com>
 <1560134057.28527.5.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1560134057.28527.5.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream <srv_heupstream@mediatek.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Stu Hsieh <stu.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi CK, Stu,

On Mon, Jun 10, 2019 at 11:34 AM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Stu:
>
> "mediatek,mt2712-mipicsi" and "mediatek,mt2712-mipicsi-common" have many
> common part with "mediatek,mt8183-seninf", and I've a discussion in [1],
> so I would like these two to be merged together.
>
> [1] https://patchwork.kernel.org/patch/10979131/
>

Thanks CK for spotting this.

I also noticed that the driver in fact handles two hardware blocks at
the same time - SenInf and CamSV. Unless the architecture is very
different from MT8183, I'd suggest splitting it.

On a general note, the MT8183 SenInf driver has received several
rounds of review comments already, but I couldn't find any comments
posted for this one.

Given the two aspects above and also based on my quick look at code
added by this series, I'd recommend adding MT2712 support on top of
the MT8183 series.

Best regards,
Tomasz
