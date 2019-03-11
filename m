From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 1/5] dt-bindings: connector: add optional properties for
 Type-B
Date: Mon, 11 Mar 2019 13:33:03 +0800
Message-ID: <1552282383.10179.21.camel@mhfsdcap03>
References: <1552025622-15582-1-git-send-email-chunfeng.yun@mediatek.com>
         <1552025622-15582-2-git-send-email-chunfeng.yun@mediatek.com>
         <693b11e7-fa9e-ab1f-561a-beb758b1872f@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <693b11e7-fa9e-ab1f-561a-beb758b1872f@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, 2019-03-08 at 13:07 +0100, Hans de Goede wrote:
> Hi,
> 
> On 08-03-19 07:13, Chunfeng Yun wrote:
> > Add id-gpios, vbus-gpios, vbus-supply and pinctrl properties for
> > usb-b-connector
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >   .../devicetree/bindings/connector/usb-connector.txt    | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/connector/usb-connector.txt b/Documentation/devicetree/bindings/connector/usb-connector.txt
> > index a9a2f2fc44f2..7a07b0f4f973 100644
> > --- a/Documentation/devicetree/bindings/connector/usb-connector.txt
> > +++ b/Documentation/devicetree/bindings/connector/usb-connector.txt
> > @@ -17,6 +17,16 @@ Optional properties:
> >   - self-powered: Set this property if the usb device that has its own power
> >     source.
> >   
> > +Optional properties for usb-b-connector:
> > +- id-gpios: gpio for USB ID pin.
> 
> What about boards where the ID pin is *not* connected to a GPIO,
> but e.g. to a special pin on the PMIC which can also detect
> an ACA adapter ? Currently this case is handled by extcon
> drivers, but we have no way to set e.g. vbus-supply for the
> connector. Maybe in this case the usb-connector node should
> be a child of the PMIC node ?
Yes, it would be, PMIC is in charger of detecting the status of ID pin
> 
> And in many cases there also is a mux to switch the datalines
> between the host and device(gadget) controllers, how should
> that be described in this model?  See the new usb-role-switch
> code under drivers/usb/roles
> 
> In some cases the mux is controlled through a gpio, so we
> may want to add a "mux-gpios" here in which case we also
> need to define what 0/1 means.
I'm not sure, the mux seems not belong to this connector,
and may need another driver to register usb-role-switch,
similar to:

[v2,2/2] usb: typec: add typec switch via GPIO control
https://patchwork.kernel.org/patch/10834327/


> 
> > +- vbus-gpios: gpio for USB VBUS pin.
> > +  see gpio/gpio.txt.
> > +- vbus-supply: reference to the VBUS regulator, needed when supports
> > +  dual-role mode.
> 
> I think this needs some text that there can be either a vbus-gpio or
> a vbus-supply. Oh wait reading:
> 
> https://patchwork.kernel.org/patch/10819377/
> 
> I see that this GPIO is for detecting vbus presence, not for driving/enabling
> 5v to Vbus from the board, that needs to be described more clearly.
Ok

Thanks a lot
> 
> > +- pinctrl-names : a pinctrl state named "default" is optional
> > +- pinctrl-0 : pin control group
> > +  see pinctrl/pinctrl-bindings.txt
> > +
> >   Optional properties for usb-c-connector:
> >   - power-role: should be one of "source", "sink" or "dual"(DRP) if typec
> >     connector has power support.
> > 
> 
> 
> Regards,
> 
> Hans
