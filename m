From: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: Re: [PATCH 2/4] arm64: dts: mt8183: add pintcrl file
Date: Tue, 26 Mar 2019 10:54:35 +0800
Message-ID: <1553568875.21970.5.camel@mhfsdcap03>
References: <20190325122302.5483-1-zhiyong.tao@mediatek.com>
         <20190325122302.5483-3-zhiyong.tao@mediatek.com>
         <20190325193005.GA18114@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190325193005.GA18114@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, matthias.bgg@gmail.com, sean.wang@kernel.org, srv_heupstream@mediatek.com, hui.liu@mediatek.com, eddie.huang@mediatek.com, chuanjia.liu@mediatek.com, biao.huang@mediatek.com, hongzhou.yang@mediatek.com, erin.lo@mediatek.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 2019-03-25 at 14:30 -0500, Rob Herring wrote:
> On Mon, Mar 25, 2019 at 08:23:00PM +0800, Zhiyong Tao wrote:
> > This patch adds pinctrl file for mt8183.
> 
> Still has a typo in the subject.

==>we will change it in next version
> 
> > 
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8183-pinfunc.h | 1120 +++++++++++++++++++++++++
> >  1 file changed, 1120 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-pinfunc.h
> 
> Add acks/reviewed-bys when posting new versions. This should also be 
> called v8 even though a different person sent it.

==>we will add acks/reviewed-bys when posting new versions in nxet
version.
This patch is based on "https://patchwork.kernel.org/patch/10814251/".
If it is based on the patch
"https://patchwork.kernel.org/patch/10814251/", it should called v8.
But I send this patch, we call it v3. Because it it is based on the
patch "https://patchwork.kernel.org/patch/10836969/".

In these v3 patches, we send 4 patches. So we should call 1/4,2/4,3/4 as
v9 in next patch, and call 4/4 patch as v5. is it right?

Thanks.
> 
> Rob
> 
