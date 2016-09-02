From: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 1/7] [media] rc-main: assign driver type during
 allocation
Date: Fri, 02 Sep 2016 14:25:14 +0900
Message-ID: <20160902052514.fmjk4mrhblztthzb@samsunx.samsung>
References: <20160901171629.15422-1-andi.shyti@samsung.com>
 <20160901171629.15422-2-andi.shyti@samsung.com>
 <CGME20160901212401epcas1p398150b4d46215d868997016db430c3c8@epcas1p3.samsung.com>
 <20160901212351.GB22198@gofer.mess.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-disposition: inline
In-reply-to: <20160901212351.GB22198-3XSxi2G4b3iXFJAUJl40Xg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Shyti <andi-ahk0KpmfxKRAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sean,

> >  	ir = kzalloc(sizeof(*ir), GFP_KERNEL);
> > -	dev = rc_allocate_device();
> > +	dev = rc_allocate_device(RC_DRIVER_IR_RAW);
> >  	if (!ir || !dev)
> >  		goto err_out_free;
> >  
> 
> If ir->sampling = 0 then it should be RC_DRIVER_SCANCODE.
> 
> 
> > @@ -481,7 +481,6 @@ int cx88_ir_init(struct cx88_core *core, struct pci_dev *pci)
> >  	dev->scancode_mask = hardware_mask;
> >  
> >  	if (ir->sampling) {
> > -		dev->driver_type = RC_DRIVER_IR_RAW;
> >  		dev->timeout = 10 * 1000 * 1000; /* 10 ms */
> >  	} else {
> >  		dev->driver_type = RC_DRIVER_SCANCODE;
> 
> That assignment shouldn't really be there any more.

I think this doesn't change the driver's behavior, because I
either do like:

  -   dev = rc_allocate_device();
  +   dev = rc_allocate_device(RC_DRIVER_SCANCODE);

  [ ... ]

      if (ir->sampling) {
              dev->driver_type = RC_DRIVER_IR_RAW;
              dev->timeout = 10 * 1000 * 1000; /* 10 ms */
      } else {
   -          dev->driver_type = RC_DRIVER_SCANCODE;

Or I would need to do aftr the long switch...case statement

    +  if (ir->sampling) {
    +          dev = rc_allocate_device(RC_DRIVER_IR_RAW);
    +          ...
    +  } else {
    +          dev = rc_allocate_device(RC_DRIVER_SCANCODE);
    +          ...

I prefered the first way because it doesn't alter much the
driver.

> >  	ir = kzalloc(sizeof(*ir), GFP_KERNEL);
> > -	rc = rc_allocate_device();
> > +	rc = rc_allocate_device(RC_DRIVER_SCANCODE);
> >  	if (!ir || !rc) {
> >  		err = -ENOMEM;
> >  		goto err_out_free;
> 
> This is not correct, I'm afraid. If you look at the code you can see that
> if raw_decode is true, then it should be RC_DRIVER_IR_RAW.

Same here, the driver doesn't change the behavior. raw_decode can
be both 'true' or 'false' it's set as default RC_DRIVER_SCANCODE
and depending on value of raw_decode it's chaged to
RC_DRIVER_IR_RAW.

also in this case I can do

    +  if (raw_decode) {
    +          rc = rc_allocate_device(RC_DRIVER_IR_RAW);
    +          ...
    +  } else {
    +          rc = rc_allocate_device(RC_DRIVER_SCANCODE);
    +          ...

but also in this case my original approach doesn't add much
changes.

Thanks,
Andi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
