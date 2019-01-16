From: Min Guo <min.guo@mediatek.com>
Subject: Re: [PATCH v2 3/4] usb: musb: Extract set toggle as a separate
 interface
Date: Wed, 16 Jan 2019 10:43:54 +0800
Message-ID: <1547606634.4433.179.camel@mhfsdcap03>
References: <1547516626-5084-1-git-send-email-min.guo@mediatek.com>
 <1547516626-5084-4-git-send-email-min.guo@mediatek.com>
 <a4e71c59-8e25-b3e9-797f-46d918121dd4@gmail.com>
 <20190115204049.GE18026@uda0271908>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190115204049.GE18026@uda0271908>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bin Liu <b-liu@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, chunfeng.yun@mediatek.com, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Bin,

On Tue, 2019-01-15 at 14:40 -0600, Bin Liu wrote:
> Hi Min,
> 
> On Tue, Jan 15, 2019 at 04:19:42PM +0100, Matthias Brugger wrote:
> > 
> > 
> > On 15/01/2019 02:43, min.guo@mediatek.com wrote:
> > > From: Min Guo <min.guo@mediatek.com>
> > > 
> > > Add a common interface for set data toggle
> > > 
> > > Signed-off-by: Min Guo <min.guo@mediatek.com>
> > > ---
> > >  drivers/usb/musb/musb_host.c | 37 +++++++++++++++++++++++--------------
> > >  1 file changed, 23 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
> > > index b59ce9a..16d0ba4 100644
> > > --- a/drivers/usb/musb/musb_host.c
> > > +++ b/drivers/usb/musb/musb_host.c
> > > @@ -306,6 +306,25 @@ static inline void musb_save_toggle(struct musb_qh *qh, int is_in,
> > >  	usb_settoggle(urb->dev, qh->epnum, !is_in, csr ? 1 : 0);
> > >  }
> > >  
> > > +static inline u16 musb_set_toggle(struct musb_qh *qh, int is_in,
> > > +	struct urb *urb)
> > > +{
> > > +	u16 csr = 0;
> > > +	u16 toggle = 0;
> > > +
> > > +	toggle = usb_gettoggle(urb->dev, qh->epnum, !is_in);
> > > +
> > > +	if (is_in)
> > > +		csr = toggle ? (MUSB_RXCSR_H_WR_DATATOGGLE
> > > +				| MUSB_RXCSR_H_DATATOGGLE) : 0;
> > > +	else
> > > +		csr = toggle ? (MUSB_TXCSR_H_WR_DATATOGGLE
> > > +				| MUSB_TXCSR_H_DATATOGGLE)
> > > +				: MUSB_TXCSR_CLRDATATOG;
> > 
> > Can we switch the if and use is_out logic as function parameter. This would make
> > the code easier to understand.
> 
> based on the current implementation in patch 4/4, I don't think we need
> this separate patch any more, but Matthias' comments still apply.

Okay.

> Regards,
> -Bin.
