From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH lora-next 1/4] dt-bindings: lora: sx130x: add basic
 documentation
Date: Mon, 21 Jan 2019 13:27:18 -0600
Message-ID: <20190121192718.GA8189@bogus>
References: <20190108084132.10214-1-ben.whitten@gmail.com>
 <20190121191420.GA7878@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190121191420.GA7878@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Whitten <ben.whitten@gmail.com>
Cc: linux-lpwan@lists.infradead.org, afaerber@suse.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2019 at 01:14:20PM -0600, Rob Herring wrote:
> On Tue, Jan 08, 2019 at 05:41:29PM +0900, Ben Whitten wrote:
> > Add basic documentation in YAML format for the sx130x series concentrators
> > from Semtech.
> > Required is; the location on the SPI bus, the reset gpio and the node for
> > downstream IQ radios, typically sx125x.
> > 
> > Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
> > ---
> >  .../bindings/lora/semtech,sx130x.yaml         | 87 +++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/lora/semtech,sx130x.yaml
> 
> A schema binding. Yay!
> 
> > 
> > diff --git a/Documentation/devicetree/bindings/lora/semtech,sx130x.yaml b/Documentation/devicetree/bindings/lora/semtech,sx130x.yaml
> > new file mode 100644
> > index 000000000000..ad263bc4e60d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/lora/semtech,sx130x.yaml
> > @@ -0,0 +1,87 @@
> > +# SPDX-License-Identifier: GPL-2.0

Also, I'd like new bindings to be dual GPL-2.0 and BSD-2-Clause if you 
don't mind. This will make it easier to move the schema out of the 
kernel if/when we ever do that.

Rob
