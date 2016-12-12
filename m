From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v5 1/2] Add OV5647 device tree documentation
Date: Mon, 12 Dec 2016 14:19:47 +0200
Message-ID: <20161212121947.GU16630@valkosipuli.retiisi.org.uk>
References: <20161212114900.GS16630@valkosipuli.retiisi.org.uk>
 <0f72309f-ec5e-4252-f6d7-7a7f7a9dc4c5@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0f72309f-ec5e-4252-f6d7-7a7f7a9dc4c5-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, dheitmueller-eb9eJ82Ua7k9XoPSrs7Ehg@public.gmane.org, slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Ramiro,

On Mon, Dec 12, 2016 at 12:15:04PM +0000, Ramiro Oliveira wrote:
> Hi Sakari
> 
> On 12/12/2016 11:49 AM, Sakari Ailus wrote:
> > Hi Ramiro,
> > 
> > On Mon, Dec 12, 2016 at 11:39:31AM +0000, Ramiro Oliveira wrote:
> >> Hi Sakari,
> >>
> >> Thank you for the feedback.
> >>
> >> On 12/7/2016 10:33 PM, Sakari Ailus wrote:
> >>> Hi Ramiro,
> >>>
> >>> Thank you for the patch.
> >>>
> >>> On Mon, Dec 05, 2016 at 05:36:33PM +0000, Ramiro Oliveira wrote:
> >>>> Add device tree documentation.
> >>>>
> >>>> Signed-off-by: Ramiro Oliveira <roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> >>>> ---
> >>>>  .../devicetree/bindings/media/i2c/ov5647.txt          | 19 +++++++++++++++++++
> >>>>  1 file changed, 19 insertions(+)
> >>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.txt b/Documentation/devicetree/bindings/media/i2c/ov5647.txt
> >>>> new file mode 100644
> >>>> index 0000000..4c91b3b
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/media/i2c/ov5647.txt
> >>>> @@ -0,0 +1,19 @@
> >>>> +Omnivision OV5647 raw image sensor
> >>>> +---------------------------------
> >>>> +
> >>>> +OV5647 is a raw image sensor with MIPI CSI-2 and CCP2 image data interfaces
> >>>> +and CCI (I2C compatible) control bus.
> >>>> +
> >>>> +Required properties:
> >>>> +
> >>>> +- compatible	: "ovti,ov5647";
> >>>> +- reg		: I2C slave address of the sensor;
> >>>> +
> >>>> +The common video interfaces bindings (see video-interfaces.txt) should be
> >>>> +used to specify link to the image data receiver. The OV5647 device
> >>>> +node should contain one 'port' child node with an 'endpoint' subnode.
> >>>> +
> >>>> +Following properties are valid for the endpoint node:
> >>>> +
> >>>> +- data-lanes : (optional) specifies MIPI CSI-2 data lanes as covered in
> >>>> +  video-interfaces.txt.  The sensor supports only two data lanes.
> >>>
> >>> Doesn't this sensor require a external clock, a reset GPIO and / or a
> >>> regulator or a few? Do you need data-lanes, unless you can change the order
> >>> or the number?
> >>
> >> In the setup I'm using, I'm not aware of any reset GPIO or regulator. I do use a
> >> external clock but it's fixed and not controlled by SW. Should I add a property
> >> for this?
> > 
> > The sensor datasheet defines a power-up and power-down sequence for the
> > device. If you don't implement these sequences in the driver on a DT based
> > system, nothing suggests that they're implemented correctly. Could it be
> > that the boot loader simply enables the regulators or another device
> > requires them to be enabled?
> > 
> > I presume at least the reset GPIO should be controlled explicitly in order
> > to ensure correct function. Although hardware can be surprising: I have one
> > production system that has no reset GPIO for the sensor albeit the sensor
> > datasheet says that's part of the power up sequence.
> > 
> 
> Sorry for the misunderstanding. I wanted to say that, there is no SW controlled
> reset. In the board we're using to connect the sensor to our D-PHY we have a
> GPIO controller that when it receives power, it removes the sensor from reset,
> so I have no control over that.

Do you mean to say that there's a GPIO controller but there's not (yet?) a
driver for that or that the reset line is actually hard-wired to something
else?

> 
> Regarding the clock, should I create a new property?

Yes. The sensor does require a clock.

> 
> And also, regarding the data-lanes, AFAIK it isn't possible to change the order
> of the data and clock lanes so should I remove that property?

Sounds good to me.

> 
> >>
> >>>
> >>> An example DT snippet wouldn't hurt.
> >>
> >> Sure, I can add a example snippet.
> >>
> >>>
> >>
> > 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-media" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
