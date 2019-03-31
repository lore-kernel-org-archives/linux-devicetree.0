From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: connector: add optional properties
 for Type-B
Date: Sun, 31 Mar 2019 20:45:36 +0800
Message-ID: <1554036336.10179.175.camel@mhfsdcap03>
References: <1552635513-2378-1-git-send-email-chunfeng.yun@mediatek.com>
         <1552635513-2378-2-git-send-email-chunfeng.yun@mediatek.com>
         <5ca060de.1c69fb81.12138.c73c@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5ca060de.1c69fb81.12138.c73c@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Rob,
On Sun, 2019-03-31 at 01:40 -0500, Rob Herring wrote:
> On Fri, Mar 15, 2019 at 03:38:28PM +0800, Chunfeng Yun wrote:
> > Add id-gpios, vbus-gpios, vbus-supply and pinctrl properties for
> > usb-b-connector
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2 changes:
> >   1. describe more clear for vbus-gpios and vbus-supply suggested by Hans
> > ---
> >  .../devicetree/bindings/connector/usb-connector.txt      | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/connector/usb-connector.txt b/Documentation/devicetree/bindings/connector/usb-connector.txt
> > index a9a2f2fc44f2..1c4ed6c9afa8 100644
> > --- a/Documentation/devicetree/bindings/connector/usb-connector.txt
> > +++ b/Documentation/devicetree/bindings/connector/usb-connector.txt
> > @@ -17,6 +17,15 @@ Optional properties:
> >  - self-powered: Set this property if the usb device that has its own power
> >    source.
> >  
> > +Optional properties for usb-b-connector:
> > +- id-gpios: gpio for USB ID pin.
> > +- vbus-gpios: gpio for USB VBUS pin, used to detect presence of VBUS 5V.
> > +  see gpio/gpio.txt.
> 
> Please make it explicit that this is an input gpio. An output GPIO 
> controlling a Vbus regulator should be modelled as a regulator.
Ok, thanks

> 
> > +- vbus-supply: a phandle to the regulator for USB VBUS if needed.
> > +- pinctrl-names : a pinctrl state named "default" is optional
> > +- pinctrl-0 : pin control group
> > +  see pinctrl/pinctrl-bindings.txt
> > +
> >  Optional properties for usb-c-connector:
> >  - power-role: should be one of "source", "sink" or "dual"(DRP) if typec
> >    connector has power support.
> > -- 
> > 2.20.1
> > 
> 
