From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2] avia-hx711.yaml: transform DT binding to YAML
Date: Sun, 7 Apr 2019 12:21:54 +0100
Message-ID: <20190407122154.043c2b18@archlinux>
References: <20190401173353.g4k5vb6flsfgtaaj@arbad>
        <CAL_JsqKxdP=Xthpzg-stxKBLmA6RQffCVJh3ot-NDkMdTxPEVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKxdP=Xthpzg-stxKBLmA6RQffCVJh3ot-NDkMdTxPEVQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Andreas Klinger <ak@it-klinger.de>, Mark Rutland <mark.rutland@arm.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, 1 Apr 2019 20:47:19 -0500
Rob Herring <robh+dt@kernel.org> wrote:

> On Mon, Apr 1, 2019 at 12:34 PM Andreas Klinger <ak@it-klinger.de> wrote:
> >
> > replace avia-hx711.txt by avia-hx711.yaml as yaml devicetree
> > documentation for avia hx711 iio adc sensor
> >
> > Signed-off-by: Andreas Klinger <ak@it-klinger.de>
Applied to the togreg branch of iio.git and pushed out as testing.

Thanks,

Jonathan

> > ---
> >  .../devicetree/bindings/iio/adc/avia-hx711.txt     | 24 --------
> >  .../devicetree/bindings/iio/adc/avia-hx711.yaml    | 66 ++++++++++++++++++++++
> >  2 files changed, 66 insertions(+), 24 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/iio/adc/avia-hx711.txt
> >  create mode 100644 Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml  
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
