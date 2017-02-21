From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v9 1/2] Add OV5647 device tree documentation
Date: Tue, 21 Feb 2017 16:40:34 +0200
Message-ID: <20170221144034.GJ16975@valkosipuli.retiisi.org.uk>
References: <cover.1487334912.git.roliveir@synopsys.com>
 <5a93352142495528dd56d5e281a8ed8ad6404a05.1487334912.git.roliveir@synopsys.com>
 <20170221115746.GF16975@valkosipuli.retiisi.org.uk>
 <3d0b775a-e1de-d957-de72-7751e2c59aea@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3d0b775a-e1de-d957-de72-7751e2c59aea-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ramiro,

On Tue, Feb 21, 2017 at 02:30:16PM +0000, Ramiro Oliveira wrote:
> Hi Sakari,
> 
> Thank you for your feedback.
> 
> On 2/21/2017 11:57 AM, Sakari Ailus wrote:
> > Hi Ramiro,
> > 
> > On Fri, Feb 17, 2017 at 01:14:15PM +0000, Ramiro Oliveira wrote:
> >> Create device tree bindings documentation.
> >>
> >> Signed-off-by: Ramiro Oliveira <roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> >> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> ---
> >>  .../devicetree/bindings/media/i2c/ov5647.txt       | 35 ++++++++++++++++++++++
> >>  1 file changed, 35 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.txt b/Documentation/devicetree/bindings/media/i2c/ov5647.txt
> >> new file mode 100644
> >> index 000000000000..31956426d3b9
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/media/i2c/ov5647.txt
> >> @@ -0,0 +1,35 @@
> >> +Omnivision OV5647 raw image sensor
> >> +---------------------------------
> >> +
> >> +OV5647 is a raw image sensor with MIPI CSI-2 and CCP2 image data interfaces
> >> +and CCI (I2C compatible) control bus.
> >> +
> >> +Required properties:
> >> +
> >> +- compatible		: "ovti,ov5647".
> >> +- reg			: I2C slave address of the sensor.
> >> +- clocks		: Reference to the xclk clock.
> >> +- clock-names		: Should be "xclk".
> >> +- clock-frequency	: Frequency of the xclk clock.
> >> +
> >> +The common video interfaces bindings (see video-interfaces.txt) should be
> >> +used to specify link to the image data receiver. The OV5647 device
> >> +node should contain one 'port' child node with an 'endpoint' subnode.
> > 
> > The remote-endpoint property in endpoint nodes should be mandatory,
> > shouldn't it? Otherwise the sensor isn't connected to anything and hardly
> > useful as such. The list of optional endpoint properties is a long one and
> > it should be documented here which ones are recognised, either as optional
> > or mandatory.
> > 
> 
> I guess you're right, it should be mandatory, although at the moment I'm not
> checking for it's presence in the driver so I'll add it to the driver.
> 
> At the moment that's the only property I think it should be mandatory, and I
> don't believe I need any optional one.
> 
> Do you have a suggestion for any new property I should use?

As you don't need any in the driver for the driver to work, you can omit
them.

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
