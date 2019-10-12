From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: iio: maxbotix,mb1232.yaml: transform to
 yaml
Date: Sat, 12 Oct 2019 14:23:18 +0100
Message-ID: <20191012142318.03057c61@archlinux>
References: <20191007170219.xfipsry5nk4raiem@arbad>
        <20191010205328.GA19956@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191010205328.GA19956@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Andreas Klinger <ak@it-klinger.de>, robh+dt@kernel.org, mark.rutland@arm.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 10 Oct 2019 15:53:28 -0500
Rob Herring <robh@kernel.org> wrote:

> On Mon, 7 Oct 2019 19:02:20 +0200, Andreas Klinger wrote:
> > transform existing documentation of maxbotix,mb1232 ultrasonic ranger
> > from text documentation format into yaml.
> > 
> > Changes in v3:
> > - add a i2c node around device node to set up #address-cells and
> >   #size-cells for omitting error during make dt_binding_check
> > 
> > Changes in v2:
> > - removed description of reg property
> > - added a line:
> >   additionalProperties: false
> > 
> > Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> > ---
> >  .../bindings/iio/proximity/maxbotix,mb1232.txt     | 29 -----------
> >  .../bindings/iio/proximity/maxbotix,mb1232.yaml    | 60 ++++++++++++++++++++++
> >  2 files changed, 60 insertions(+), 29 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.txt
> >  create mode 100644 Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml
> >   
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
Applied to the togreg branch of iio.git and pushed out as testing for the 
autobuilders to play with it.

Thanks,

Jonathan
