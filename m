From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: iio: potentiometer: add
 max5432.yaml binding
Date: Mon, 5 Aug 2019 14:32:09 +0100
Message-ID: <20190805143209.5307ad93@archlinux>
References: <20190721175915.27192-1-martin@kaiser.cx>
        <20190731140706.2765-1-martin@kaiser.cx>
        <20190731140706.2765-2-martin@kaiser.cx>
        <CAL_JsqK9iuxQEh3s2_AgQhSa19Coq7kSFB497KUMQnjQNU+ELw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqK9iuxQEh3s2_AgQhSa19Coq7kSFB497KUMQnjQNU+ELw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Martin Kaiser <martin@kaiser.cx>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 31 Jul 2019 10:50:36 -0600
Rob Herring <robh+dt@kernel.org> wrote:

> On Wed, Jul 31, 2019 at 8:07 AM Martin Kaiser <martin@kaiser.cx> wrote:
> >
> > Add a binding for the Maxim Integrated MAX5432-MAX5435 family of digital
> > potentiometers.
> >
> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > ---
> > changes in v4
> >  - fix the dt bindings
> >    - replace ic20 with i2c
> >    - document the reg property
> >    - add additionalProperties and required
> >
> > changes in v3
> >  - split dt bindings and driver code into separate patches
> >  - use yaml format for dt bindings
> >  - fix formatting of parameter lists
> >
> > changes in v2
> >  - use MAX5432_ prefix for all defines
> >  - fix indentation
> >  - convert void * to unsigned long, not to u32
> >    (warning from kbuild test robot)
> >
> >  .../bindings/iio/potentiometer/max5432.yaml        | 44 ++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/potentiometer/max5432.yaml  
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
Applied to the togreg branch of iio.git and pushed out as testing for the
autobuilders to play with it.

Thanks,

Jonathan
