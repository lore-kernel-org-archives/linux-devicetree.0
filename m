From: Benoit Parrot <bparrot@ti.com>
Subject: Re: [Patch 02/13] media: am437x-vpfe: Fix missing first line
Date: Fri, 13 Sep 2019 08:25:04 -0500
Message-ID: <20190913132504.sh5fpb4hrv5wqorp@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
 <20190909162743.30114-3-bparrot@ti.com>
 <018a5f55-a750-c86d-da82-2b7c586cb33e@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <018a5f55-a750-c86d-da82-2b7c586cb33e@xs4all.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hans Verkuil <hverkuil@xs4all.nl> wrote on Fri [2019-Sep-13 15:00:08 +0200]:
> On 9/9/19 6:27 PM, Benoit Parrot wrote:
> > Previous generation of this driver were hard coded to handle
> > encoder/decoder were the first line never contains any data and
> 
> were -> where
> 
> > was therefore always skipped, however when dealing with actual
> > camera sensor the first line is always present.
> 
> sensor -> sensors

I'll fix those.

Thanks

Benoit

> 
> Regards,
> 
> 	Hans
> 
> > 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/media/platform/am437x/am437x-vpfe.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> > index ab959d61f9c9..0ecb75bf5abd 100644
> > --- a/drivers/media/platform/am437x/am437x-vpfe.c
> > +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> > @@ -345,13 +345,9 @@ static void vpfe_ccdc_setwin(struct vpfe_ccdc *ccdc,
> >  	if (frm_fmt == CCDC_FRMFMT_INTERLACED) {
> >  		vert_nr_lines = (image_win->height >> 1) - 1;
> >  		vert_start >>= 1;
> > -		/* Since first line doesn't have any data */
> > -		vert_start += 1;
> >  		/* configure VDINT0 */
> >  		val = (vert_start << VPFE_VDINT_VDINT0_SHIFT);
> >  	} else {
> > -		/* Since first line doesn't have any data */
> > -		vert_start += 1;
> >  		vert_nr_lines = image_win->height - 1;
> >  		/*
> >  		 * configure VDINT0 and VDINT1. VDINT1 will be at half
> > 
> 
