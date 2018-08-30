From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2] usb: core: phy: fix return value checking about
 devm_of_phy_get_by_index()
Date: Thu, 30 Aug 2018 09:12:03 +0800
Message-ID: <1535591523.32173.32.camel@mhfsdcap03>
References: <8263a8d0f87d595dd35efa5432d294d9f7b38719.1535507412.git.chunfeng.yun@mediatek.com>
         <20180829083050.GG28861@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829083050.GG28861@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 2018-08-29 at 10:30 +0200, Johan Hovold wrote:
> On Wed, Aug 29, 2018 at 10:10:48AM +0800, Chunfeng Yun wrote:
> > Use IS_ERR() instead of IS_ERR_OR_NULL() because devm_of_phy_get_by_index()
> > never return NULL value;
> > But still need ignore the error of -ENODEV, for more information, please
> > refer to:
> > [0] https://lkml.org/lkml/2018/4/19/88
> > [1] https://patchwork.kernel.org/patch/10160181/
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > V2: keep the -ENODEV check
> > ---
> >  drivers/usb/core/phy.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
> > index 9879767..e3cc743 100644
> > --- a/drivers/usb/core/phy.c
> > +++ b/drivers/usb/core/phy.c
> > @@ -23,14 +23,11 @@ static int usb_phy_roothub_add_phy(struct device *dev, int index,
> >  				   struct list_head *list)
> >  {
> >  	struct usb_phy_roothub *roothub_entry;
> > -	struct phy *phy = devm_of_phy_get_by_index(dev, dev->of_node, index);
> > +	struct phy *phy;
> >  
> > -	if (IS_ERR_OR_NULL(phy)) {
> > -		if (!phy || PTR_ERR(phy) == -ENODEV)
> > -			return 0;
> > -		else
> > -			return PTR_ERR(phy);
> > -	}
> > +	phy = devm_of_phy_get_by_index(dev, dev->of_node, index);
> > +	if (IS_ERR(phy))
> > +		return (PTR_ERR(phy) == -ENODEV) ? 0 : PTR_ERR(phy);
> 
> I prefer not to use the terse ternary operator in general, and
> especially so in this case where we are doing something unexpected (i.e.
> we want to highlight that the -ENODEV case is special).
> 
> So please keep the current construct, and just replace IS_ERR_OR_NULL
> and drop the !phy test.
> 
> I think separating the declaration and (non-trivial) initialisation of
> phy here is a good thing that can remain in the patch, even if it's
> arguable separate change.
> 
Ok, thanks
> >  
> >  	roothub_entry = devm_kzalloc(dev, sizeof(*roothub_entry), GFP_KERNEL);
> >  	if (!roothub_entry)
> 
> Thanks,
> Johan
