From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: iio: chemical: Add bindings for
 bme680
Date: Sat, 19 Jan 2019 17:44:51 +0000
Message-ID: <20190119174451.2528072a@archlinux>
References: <20190114201914.24572-1-sebastien.bourdelin@gmail.com>
        <20190114201914.24572-2-sebastien.bourdelin@gmail.com>
        <20190115202802.GA26149@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190115202802.GA26149@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sebastien Bourdelin <sebastien.bourdelin@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, himanshujha199640@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, pmeerw@pmeerw.net, lars@metafoo.de, knaack.h@gmx.de
List-Id: devicetree@vger.kernel.org

On Tue, 15 Jan 2019 14:28:02 -0600
Rob Herring <robh@kernel.org> wrote:

> On Mon, 14 Jan 2019 15:19:14 -0500, Sebastien Bourdelin wrote:
> > BME680 is a pressure/temperature/humidity/voc sensor.
> > 
> > Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@gmail.com>
> > ---
> > v2 -> v3:
> >   - change i2c address to 0x76 as it seems more reliable: Suggested by Himanshu Jha <himanshujha199640@gmail.com>
> >   - rebase on master
> > ---
> >  .../devicetree/bindings/iio/chemical/bme680.txt       | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/chemical/bme680.txt
> >   
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to the togreg branch of iio.git and pushed out as testing for the
autobuilders to play with it.

Thanks,

Jonathan
