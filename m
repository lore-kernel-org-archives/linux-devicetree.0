From: 'Dmitry Torokhov' <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] Input: add i2c/smbus driver for elan touchpad
Date: Mon, 6 Oct 2014 18:24:37 -0700
Message-ID: <20141007012437.GC39707@dtor-ws>
References: <1389064083-11018-1-git-send-email-dusonlin@emc.com.tw>
 <20141003210357.GB4987@dtor-ws>
 <20141003210651.GC4987@dtor-ws>
 <20141006092452.GA24686@leverpostej>
 <20141006163703.GB27115@dtor-glaptop>
 <4D9D80FFD7AF42848710DF158445E41B@elan.corp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4D9D80FFD7AF42848710DF158445E41B-/M1eSjm1S/B4Eiagz67IpQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: duson <dusonlin-9cfG7bMpBgR9nmWX13WWKA@public.gmane.org>
Cc: 'Mark Rutland' <mark.rutland-5wv7dgnIgG8@public.gmane.org>, bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, agnescheng-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, phoenix-9cfG7bMpBgR9nmWX13WWKA@public.gmane.org, jeff.chuang-9cfG7bMpBgR9nmWX13WWKA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Duson,

On Tue, Oct 07, 2014 at 09:15:26AM +0800, duson wrote:
> Hi Dmitry,
> 
> > -----Original Message-----
> > From: Dmitry Torokhov [mailto:dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> > Sent: Tuesday, October 07, 2014 12:37 AM
> > To: Mark Rutland
> > Cc: Duson Lin; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-input-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org; agnescheng-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org; phoenix-9cfG7bMpBgR9nmWX13WWKA@public.gmane.org;
> > jeff.chuang-9cfG7bMpBgR9nmWX13WWKA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Subject: Re: [PATCH v2] Input: add i2c/smbus driver for elan touchpad
> > 
> > On Mon, Oct 06, 2014 at 10:24:52AM +0100, Mark Rutland wrote:
> > > On Fri, Oct 03, 2014 at 10:06:51PM +0100, Dmitry Torokhov wrote:
> > > > [adding devicetree folks...]
> > > >
> > > > On Fri, Oct 03, 2014 at 02:03:57PM -0700, Dmitry Torokhov wrote:
> > > > > diff --git a/Documentation/devicetree/bindings/input/elan_i2c.txt
> > b/Documentation/devicetree/bindings/input/elan_i2c.txt
> > > > > new file mode 100644
> > > > > index 0000000..0a6ee7d
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/input/elan_i2c.txt
> > > > > @@ -0,0 +1,34 @@
> > > > > +Elantech I2C Touchpad
> > > > > +
> > > > > +Required properties:
> > > > > +- compatible: must be "elan,i2c_touchpad".
> > >
> > > s/_/-/ in DT strings and property names plase.
> > >
> > > The name seems very generic, and you mention the driver supports a
> > > variety of touchpads. Please choose a specific device name for the
> > > compatible string. Other devices can have that as a fallback entry in
> > > addition to a more specific string.
> > 
> > Duson, what would be a good model/device name here?
> > 
> Hmm....maybe we can rename this device name like our touch screen team
> elan_i2c --> elantp_i2c
> How do you feel about this.

It does not really add any additional info: elan,i2c_touchpad vs
elan,elantp_i2c. What we need is a model/family name. Something like
elan,ekt2000 or elan,ekt2xxx. What is the earliest product supported by
this driver?

Thanks.

-- 
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
