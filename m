From: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: Re: [PATCH 2/3] arm64: dts: mt2712: add pintcrl device node.
Date: Thu, 21 Sep 2017 16:13:12 +0800
Message-ID: <1505981592.22452.7.camel@mhfsdcap03>
References: <1501489333-23145-1-git-send-email-zhiyong.tao@mediatek.com>
 <1501489333-23145-3-git-send-email-zhiyong.tao@mediatek.com>
 <2f883a8a-5402-5625-bada-bcfed53c098e@gmail.com>
 <CACRpkdZHyXec+L8ueRHOs=9TLT1Arqe3KeQpRZ6D0K1Ag1c+Zw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZHyXec+L8ueRHOs=9TLT1Arqe3KeQpRZ6D0K1Ag1c+Zw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, hongkun.cao@mediatek.com, srv_heupstream@mediatek.com, Hongzhou Yang <hongzhou.yang@mediatek.com>, Biao Huang <biao.huang@mediatek.com>, Erin Lo <erin.lo@mediatek.com>, Liguo Zhang <liguo.zhang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, YT Shen <yt.shen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Joe.C" <yingjoe.chen@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2017-08-22 at 15:04 +0200, Linus Walleij wrote:
> On Mon, Aug 14, 2017 at 5:23 PM, Matthias Brugger
> <matthias.bgg@gmail.com> wrote:
> > On 07/31/2017 10:22 AM, Zhiyong Tao wrote:
> >>
> >> The commit includes two change:
> >> 1)add pintcrl device node for mt2712.
> >> 2)add pinfunc file for mt2712.
> >>
> >> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> >> ---
> >>   arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h | 1014
> >> +++++++++++++++++++++++++
> >
> >
> > Shouldn't this file be in include/dt-bindings/pinctrl?
> 
> Only if it is also #included in the driver.
> 
> Yours,
> Linus Walleij

==>
Thanks for your comment. 
We see our some ICs(mt7623) which move the file to
"include/dt-bindings/pinctrl". other ICs(mt2701) which is put in
"arch/arm64/boot/dts/mediatek".
In mt2712, mt2712-pinfunc.h is only include by dts file. It won't be
included by driver. So which is better? "arch/arm64/boot/dts/mediatek/"
or "include/dt-bindings/pinctrl".

Thanks.
