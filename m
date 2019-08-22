From: Mars Cheng <mars.cheng@mediatek.com>
Subject: Re: [PATCH 04/11] pinctrl: mediatek: update pinmux defintions for
 mt6779
Date: Thu, 22 Aug 2019 08:43:37 +0800
Message-ID: <1566434617.14794.0.camel@mtkswgap22>
References: <1564996320-10897-1-git-send-email-mars.cheng@mediatek.com>
         <1564996320-10897-5-git-send-email-mars.cheng@mediatek.com>
         <20190821185025.GA18525@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821185025.GA18525@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, Wendell Lin <wendell.lin@mediatek.com>, Ivan Tseng <ivan.tseng@mediatek.com>, Andy Teng <andy.teng@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Wed, 2019-08-21 at 13:50 -0500, Rob Herring wrote:
> On Mon, Aug 05, 2019 at 05:11:53PM +0800, Mars Cheng wrote:
> > Add devicetree bindings for Mediatek mt6779 SoC Pin Controller.
> 
> checkpatch.pl reports typo in subject.
> 
> Otherwise,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

got it, will fix the typo in v3. Thanks for reviewing.

> > 
> > Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> > Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> > ---
> >  include/dt-bindings/pinctrl/mt6779-pinfunc.h | 1242 ++++++++++++++++++++++++++
> >  1 file changed, 1242 insertions(+)
> >  create mode 100644 include/dt-bindings/pinctrl/mt6779-pinfunc.h
