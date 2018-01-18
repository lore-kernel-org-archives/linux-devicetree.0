From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: media: Add bindings for OV5695
Date: Fri, 19 Jan 2018 00:30:59 +0200
Message-ID: <20180118223059.hzqlhs56cpfvff3w@valkosipuli.retiisi.org.uk>
References: <1515549967-5302-1-git-send-email-zhengsq@rock-chips.com>
 <1515549967-5302-2-git-send-email-zhengsq@rock-chips.com>
 <20180110092010.GC6834@w540>
 <807c4307-0617-788e-7129-039b33ce99d5@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <807c4307-0617-788e-7129-039b33ce99d5-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: jacopo mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ddl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Shunqian,

On Thu, Jan 11, 2018 at 02:44:33PM +0800, Shunqian Zheng wrote:
> Hi Jacopo,
> 
> 
> On 2018年01月10日 17:20, jacopo mondi wrote:
> > Hi Shunqian,
> > 
> > On Wed, Jan 10, 2018 at 10:06:04AM +0800, Shunqian Zheng wrote:
> > > Add device tree binding documentation for the OV5695 sensor.
> > > 
> > > Signed-off-by: Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > > ---
> > >   .../devicetree/bindings/media/i2c/ov5695.txt       | 41 ++++++++++++++++++++++
> > >   1 file changed, 41 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5695.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5695.txt b/Documentation/devicetree/bindings/media/i2c/ov5695.txt
> > > new file mode 100644
> > > index 0000000..2f2f698
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ov5695.txt
> > > @@ -0,0 +1,41 @@
> > > +* Omnivision OV5695 MIPI CSI-2 sensor
> > > +
> > > +Required Properties:
> > > +- compatible: shall be "ovti,ov5695"
> > > +- clocks: reference to the xvclk input clock
> > > +- clock-names: shall be "xvclk"
> > > +- avdd-supply: Analog voltage supply, 2.8 volts
> > > +- dovdd-supply: Digital I/O voltage supply, 1.8 volts
> > > +- dvdd-supply: Digital core voltage supply, 1.2 volts
> > > +- reset-gpios: Low active reset gpio
> > > +
> > > +The device node shall contain one 'port' child node with an
> > > +'endpoint' subnode for its digital output video port,
> > > +in accordance with the video interface bindings defined in
> > > +Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > +The endpoint optional property 'data-lanes' shall be "<1 2>".
> > What happens if the property is not present? What's the default?
> I think it depends on how the video receiver deal with, 'data-lanes' is
> optional as described in video-interfaces.txt,
> but if somehow it used in DT, the value "<1 2>" is the right one.

They're described as optional there as they may not be mandated for all
devices --- they're only relevant for some.

The data-lanes property also specifies the number of lanes. I guess you
could say two is default. The device can likely be configured to just use
one, even if the driver doesn't support it.

-- 
Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
