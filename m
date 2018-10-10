From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 15/36] dt-bindings: arm: Convert Actions Semi bindings
 to jsonschema
Date: Tue, 09 Oct 2018 18:41:44 -0700
Message-ID: <fb2ffc4c5dc18825b508fd29c4dd44d260c9c193.camel@perches.com>
References: <20181005165848.3474-1-robh@kernel.org>
         <20181005165848.3474-16-robh@kernel.org>
         <c4909f78-bfa1-9253-e436-1159392b45a9@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c4909f78-bfa1-9253-e436-1159392b45a9@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <glikely@secretlab.ca>, Kumar Gala <kumar.gala@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Tom Rini <trini@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Jonathan Cameron <jic23@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

On Sat, 2018-10-06 at 12:40 +0200, Andreas Färber wrote:
> > +++ b/Documentation/devicetree/bindings/arm/actions.yaml
[]
> > +
> > +title: Actions Semi platforms device tree bindings
> > +
> > +maintainers:
> > +  - Andreas Färber <afaerber@suse.de>
> 
> Mani is now officially reviewer and the closest I have to a
> co-maintainer. I suggest we add him here in some form. I assume this is
> independent of MAINTAINERS patterns though, or will get_maintainers.pl
> parse this, too?

It _could_, if using the get_maintainers --file-emails option.
Ideally, it would be added to the MAINTAINERS somewhere.
