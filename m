Return-Path: <robherring2@gmail.com>
Date: Fri, 2 Mar 2018 16:38:41 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 10/12] dt-bindings: connector: add properties for
 typec power delivery
Message-ID: <20180302223841.2lj3dutyknlhxvra@rob-hp-laptop>
References: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
 <CGME20180226120532epcas5p3c4b0258ec0677939f4241b24da5f48bc@epcas5p3.samsung.com>
 <1519645759-12701-11-git-send-email-jun.li@nxp.com>
 <20522804-65ab-5d48-716a-c199e4c095fc@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20522804-65ab-5d48-716a-c199e4c095fc@samsung.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Li Jun <jun.li@nxp.com>, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net, mark.rutland@arm.com, yueyao@google.com, peter.chen@nxp.com, garsilva@embeddedor.com, o_leveque@orange.fr, shufan_lee@richtek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Tue, Feb 27, 2018 at 09:41:19AM +0100, Andrzej Hajda wrote:
> On 26.02.2018 12:49, Li Jun wrote:
> > In case of usb-c-connector with power delivery support, add bingdings
> > supported by current typec driver, so user can pass all those properties
> > via dt.
> >
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > ---
> > Changes for v2:
> > - Added typec properties are based on general usb connector bindings[1]
> >   proposed by Andrzej Hajda.
> > - Use the standard unit suffixes as defined in property-units.txt.
> >
> > [1] https://patchwork.kernel.org/patch/10231447/
> >
> >  .../bindings/connector/usb-connector.txt           | 43 ++++++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/connector/usb-connector.txt b/Documentation/devicetree/bindings/connector/usb-connector.txt
> > index e1463f1..242f6df 100644
> > --- a/Documentation/devicetree/bindings/connector/usb-connector.txt
> > +++ b/Documentation/devicetree/bindings/connector/usb-connector.txt
> > @@ -15,6 +15,30 @@ Optional properties:
> >  - type: size of the connector, should be specified in case of USB-A, USB-B
> >    non-fullsize connectors: "mini", "micro".
> >  
> > +Required properties for usb-c-connector with power delivery support:
> > +- port-type: should be one of "source", "sink" or "dual".
> > +- default-role: preferred power role if port-type is "dual"(drp), should be
> > +  "sink" or "source".
> 
> Since port carries data and power, it would be better to explicitly
> mention it in names of properties which can be ambiguous.
> Maybe instead of 'port-type' you can use 'power-role', for example.
> Other thing is that default-role is required only in case of DRP, so
> maybe better would be to squash it in power-role, for example:
> ��� power-role: should be on of "source", "sink", "dual-source",
> "dual-sink", in case of dual roles suffix determines preferred role.
> 
> 
> > +- src-pdos: An array of u32 with each entry providing supported power
> > +  source data object(PDO), the detailed bit definitions of PDO can be found
> > +  in "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.2
> > +  Source_Capabilities Message, the order of each entry(PDO) should follow
> > +  the PD spec chapter 6.4.1. Required for power source and power dual role.
> > +- snk-pdos: An array of u32 with each entry providing supported power
> > +  sink data object(PDO), the detailed bit definitions of PDO can be found in
> > +  "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.3 Sink
> > +  Capabilities Message, the order of each entry(PDO) should follow the PD
> > +  spec chapter 6.4.1. Required for power sink and power dual role.
> 
> We should avoid magic numbers, magic numbers are bad :)

I don't mind if there's a defined format for the data.

> If we really need to use PDOs here, I think we can re-use PDO_* macros
> [1] - DTC should be able to parse it, maybe some lifting will be necessary.
> 
> [1]:
> https://elixir.bootlin.com/linux/v4.16-rc3/source/include/linux/usb/pd.h#L161
> > +- max-snk-microvolt: The max voltage the sink can support in micro volts,
> > +  required for power sink and power dual role.
> > +- max-snk-microamp: The max current the sink can support in micro amps,
> > +  required for power sink and power dual role.
> > +- max-snk-microwatt-hours: The max power the sink can support in micro
> > +  Watt-hours, required for power sink and power dual role.
> > +- op-snk-microwatt-hours: Sink required operating power in micro Watt-hours,
> > +  if source offered power is less then it, Capability Mismatch is set,
> > +  required for power sink and power dual role.
> 
> What is the relation between above properties and PDOs specified earlier?
> Are you sure all these props are required?
> 
> And general remark regarding all above properties. For me, most of them
> are specific not to the port but to devices responsible for power
> management: chargers, pmics,....
> In many cases these properties are redundant with devices capabilities.
> On the other side I guess in many cases it may be convenient to put them
> here, so I am not sure what is better :)

I debated that too, but decided if you had 2 connectors connected to a 
single power controller, then you'd want these in the connector.

Rob
