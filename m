From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] dt-bindings: iio: humidity: Add bindings for HTU21
 and MS8607 sensors
Date: Wed, 21 Jun 2017 20:40:50 +0100
Message-ID: <20170621204050.75863dd5@kernel.org>
References: <1497374443-20935-1-git-send-email-manivannan.sadhasivam@linaro.org>
        <20170618140511.kz6nvttypockcrfm@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170618140511.kz6nvttypockcrfm@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, william.markezana-ya7vCgA9bt58UrSeD/g0lQ@public.gmane.org, ludovic.tancerel-sbt5i+FMW2pmsedzY7GhzwC/G2K4zDHf@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nicolas.dechesne-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 18 Jun 2017 09:05:11 -0500
Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> On Tue, Jun 13, 2017 at 10:50:43PM +0530, Manivannan Sadhasivam wrote:
> > Add device tree bindings for Measurement-Specialties HTU21 temperature & humidity sensor and humidity part of MS8607 sensor
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/iio/humidity/htu21.txt | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/humidity/htu21.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/humidity/htu21.txt b/Documentation/devicetree/bindings/iio/humidity/htu21.txt
> > new file mode 100644
> > index 0000000..97d7963
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/humidity/htu21.txt
> > @@ -0,0 +1,13 @@
> > +*HTU21 - Measurement-Specialties htu21 temperature & humidity sensor and humidity part of MS8607 sensor  
> 
> The binding should be for the device, not part of it. You should bind 
> to a driver for MS8607 and then create 2 child devices for the humidity 
> and temp sensors.
Hi Rob,

It's a bit of an oddity as we are look at package in package parts. 
Really there are simply two parts here. There is no need to know
they are in the same package.  Obviously we 'could' describe this, but
it's no different form  mounting the chips next to each other on the
same bus sharing the same power rails.

I guess a binding that reflected this would act as 'documentation' perhaps,
but would provide no useful information.

Can you point us to a similar example (for future reference)?

Thanks

Jonathan

> 
> Rob
