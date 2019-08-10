From: houlong wei <houlong.wei@mediatek.com>
Subject: Re: [PATCH v11 09/12] soc: mediatek: cmdq: define the instruction
 struct
Date: Sun, 11 Aug 2019 00:38:01 +0800
Message-ID: <1565455081.19079.36.camel@mhfsdcap03>
References: <20190729070106.9332-1-bibby.hsieh@mediatek.com>
 <20190729070106.9332-10-bibby.hsieh@mediatek.com>
 <1565453520.19079.17.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1565453520.19079.17.camel@mhfsdcap03>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bibby Hsieh =?UTF-8?Q?=28=E8=AC=9D=E6=BF=9F=E9=81=A0=29?= <Bibby.Hsieh@mediatek.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, srv_heupstream <srv_heupstream@mediatek.com>, Daoyuan Huang =?UTF-8?Q?=28=E9=BB=83=E9=81=93=E5=8E=9F=29?= <Daoyuan.Huang@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Kurtz <djkurtz@chromium.org>, houlong.wei@mediatek.com, YT Shen =?UTF-8?Q?=28=E6=B2=88=E5=B2=B3=E9=9C=86=29?= <Yt.Shen@mediatek.com>, CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Ginny Chen =?UTF-8?Q?=28=E9=99=B3=E6=B2=BB=E5=82=91=29?= <ginny.chen@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>Matthias Brugger <m>
List-Id: devicetree@vger.kernel.org

On Sun, 2019-08-11 at 00:12 +0800, houlong wei wrote:
> Hi Bibby, I have inline comment in function cmdq_pkt_write_mask().
> 
> On Mon, 2019-07-29 at 15:01 +0800, Bibby Hsieh wrote:
> > Define an instruction structure for gce driver to append command.
> > This structure can make the client's code more readability.
> > 
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-cmdq-helper.c   | 103 +++++++++++++++--------
> >  include/linux/mailbox/mtk-cmdq-mailbox.h |   2 +
> >  2 files changed, 72 insertions(+), 33 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index 7aa0517ff2f3..0886c4967ca4 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -9,12 +9,24 @@
> >  #include <linux/mailbox_controller.h>
> >  #include <linux/soc/mediatek/mtk-cmdq.h>
[...]
> >  
> >  int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
> >  			u16 offset, u32 value, u32 mask)
> >  {
> > +	struct cmdq_instruction *inst;
> >  	u32 offset_mask = offset;
> > -	int err = 0;
> >  
> >  	if (mask != 0xffffffff) {
> > -		err = cmdq_pkt_append_command(pkt, CMDQ_CODE_MASK, 0, ~mask);
> > +		inst = cmdq_pkt_append_command(pkt);
> > +		if (!inst)
> > +			return -ENOMEM;
> > +
> > +		inst->op = CMDQ_CODE_MASK;
> > +		inst->mask = ~mask;

> >  		offset_mask |= CMDQ_WRITE_ENABLE_MASK;
> >  	}
> > -	err |= cmdq_pkt_write(pkt, value, subsys, offset_mask);
> >  
> > -	return err;
> > +	return cmdq_pkt_write(pkt, subsys, offset_mask, value);

We need add a type conversion here, (u8)offset_mask, for your new
function type. Er... it's better to remove local variable 'offset_mask'
and replace it with 'offset'.

> >  }
[...]
