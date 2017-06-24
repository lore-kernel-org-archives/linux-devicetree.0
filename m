From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] dt-bindings: iio: humidity: Add bindings for HTU21
 and MS8607 sensors
Date: Sat, 24 Jun 2017 21:50:53 +0100
Message-ID: <20170624215053.615f8a2c@kernel.org>
References: <1497374443-20935-1-git-send-email-manivannan.sadhasivam@linaro.org>
        <20170618140511.kz6nvttypockcrfm@rob-hp-laptop>
        <20170621204050.75863dd5@kernel.org>
        <CAL_JsqKDAPOqRepjRU9qrZQ-8_01JAfckP7G1EAjJi4t2UK7kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKDAPOqRepjRU9qrZQ-8_01JAfckP7G1EAjJi4t2UK7kg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, William Markezana <william.markezana-ya7vCgA9bt58UrSeD/g0lQ@public.gmane.org>, ludovic.tancerel-sbt5i+FMW2pmsedzY7GhzwC/G2K4zDHf@public.gmane.org, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nicolas Dechesne <nicolas.dechesne-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 21 Jun 2017 22:05:13 -0500
Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> On Wed, Jun 21, 2017 at 2:40 PM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Sun, 18 Jun 2017 09:05:11 -0500
> > Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >  
> >> On Tue, Jun 13, 2017 at 10:50:43PM +0530, Manivannan Sadhasivam wrote:  
> >> > Add device tree bindings for Measurement-Specialties HTU21 temperature & humidity sensor and humidity part of MS8607 sensor
> >> >
> >> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> > ---
> >> >  Documentation/devicetree/bindings/iio/humidity/htu21.txt | 13 +++++++++++++
> >> >  1 file changed, 13 insertions(+)
> >> >  create mode 100644 Documentation/devicetree/bindings/iio/humidity/htu21.txt
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/iio/humidity/htu21.txt b/Documentation/devicetree/bindings/iio/humidity/htu21.txt
> >> > new file mode 100644
> >> > index 0000000..97d7963
> >> > --- /dev/null
> >> > +++ b/Documentation/devicetree/bindings/iio/humidity/htu21.txt
> >> > @@ -0,0 +1,13 @@
> >> > +*HTU21 - Measurement-Specialties htu21 temperature & humidity sensor and humidity part of MS8607 sensor  
> >>
> >> The binding should be for the device, not part of it. You should bind
> >> to a driver for MS8607 and then create 2 child devices for the humidity
> >> and temp sensors.  
> > Hi Rob,
> >
> > It's a bit of an oddity as we are look at package in package parts.
> > Really there are simply two parts here. There is no need to know
> > they are in the same package.  Obviously we 'could' describe this, but
> > it's no different form  mounting the chips next to each other on the
> > same bus sharing the same power rails.  
> 
> Okay, then it is fine as-is.
> 
> Rob
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks Rob for getting back to me on this.

Jonathan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
