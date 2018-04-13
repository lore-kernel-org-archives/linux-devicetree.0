From: Jun Li <lijun.kernel@gmail.com>
Subject: Re: [PATCH v4 01/13] dt-bindings: connector: add properties for typec
Date: Fri, 13 Apr 2018 19:51:25 +0800
Message-ID: <CAKgpwJV3Ss0HbiUD3eEEyZ6KCna=7gydFBrX=jmCzumGYFaviQ@mail.gmail.com>
References: <1522253178-32414-1-git-send-email-jun.li@nxp.com>
 <CGME20180328162422epcas1p21f05bcb06134de46065705ddbab1e5d0@epcas1p2.samsung.com>
 <1522253178-32414-2-git-send-email-jun.li@nxp.com>
 <d01a95e3-0648-7e83-19ee-15ca37041067@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <d01a95e3-0648-7e83-19ee-15ca37041067@samsung.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: devel@driverdev.osuosl.org, peter.chen@nxp.com, heikki.krogerus@linux.intel.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, Li Jun <jun.li@nxp.com>, linux@roeck-us.net, shufan_lee@richtek.com
List-Id: devicetree@vger.kernel.org

2018-04-03 16:29 GMT+08:00 Andrzej Hajda <a.hajda@samsung.com>:
>
> On 28.03.2018 18:06, Li Jun wrote:
> > Add bingdings supported by current typec driver, so user can pass
> > all those properties via dt.
> >
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > ---
> >  .../bindings/connector/usb-connector.txt           | 39 ++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/connector/usb-connector.txt b/Documentation/devicetree/bindings/connector/usb-connector.txt
> > index e1463f1..922f22b 100644
> > --- a/Documentation/devicetree/bindings/connector/usb-connector.txt
> > +++ b/Documentation/devicetree/bindings/connector/usb-connector.txt
> > @@ -15,6 +15,29 @@ Optional properties:
> >  - type: size of the connector, should be specified in case of USB-A, USB-B
> >    non-fullsize connectors: "mini", "micro".
> >
> > +Optional properties for usb-c-connector:
> > +- power-type: should be one of "source", "sink" or "dual"(DRP) if typec
> > +  connector has power support.
> > +- try-power-role: preferred power role if "dual"(DRP) can support Try.SNK
> > +  or Try.SRC, should be "sink" for Try.SNK or "source" for Try.SRC.
> > +- data-type: should be one of "host", "device", "dual"(DRD) if typec
> > +  connector supports USB data.
> > +
> > +Required properties for usb-c-connector with power delivery support:
> > +- source-pdos: An array of u32 with each entry providing supported power
> > +  source data object(PDO), the detailed bit definitions of PDO can be found
> > +  in "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.2
> > +  Source_Capabilities Message, the order of each entry(PDO) should follow
> > +  the PD spec chapter 6.4.1. Required for power source and power dual role.
> > +- sink-pdos: An array of u32 with each entry providing supported power
> > +  sink data object(PDO), the detailed bit definitions of PDO can be found
> > +  in "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.3
> > +  Sink Capabilities Message, the order of each entry(PDO) should follow
> > +  the PD spec chapter 6.4.1. Required for power sink and power dual role.
> > +- op-sink-microwatt-hours: Sink required operating power in micro
> > +  watt-hours, if source offered power is less then it, Capability Mismatch
> > +  is set, required for power sink and power dual role.
>
> I have lurked into specs and I am not sure what is the relation of this
> field with PD protocol, there is Minimum Operating Power, Maximum
> Operating Power and Operating Power present in different RDOs, there are
> also similar fields in sink PDOs.
> I guess it can be one of them, which one?

Per current usage of op-sink-microwatt(operating_snk_mw in tcpm),
this property is actually for max operating power, which is only used to
judge capability mismatch, i.e. the required max current/power is larger
than the selected source PDO can provide.

After checking the PD spec about this, basically I think this property also
can be removed, we can judge the capability mismatch by compare the
selected source pdo and sink pdo, considering there are existing users
of this field(operating_snk_mw in tcpm), I will check how this can be done.

I am removing the other 3 max_snk_*, see [1]

[1] https://www.spinics.net/lists/linux-usb/msg167262.html

> why other ones are not
> provided? What if this or any other property can be calculated only in
> runtime?
> I am not sure if any of them should be marked "required".
>
> > +
> >  Required nodes:
> >  - any data bus to the connector should be modeled using the OF graph bindings
> >    specified in bindings/graph.txt, unless the bus is between parent node and
> > @@ -73,3 +96,19 @@ ccic: s2mm005@33 {
> >               };
> >       };
> >  };
> > +
> > +3. USB-C connector attached to a typec port controller(ptn5110), which has
> > +power delivery support and enables drp.
> > +
> > +typec: ptn5110@50 {
> > +     ...
> > +     usb_con: connector {
> > +             compatible = "usb-c-connector";
> > +             label = "USB-C";
> > +             power-type = "dual";
> > +             try-power-role = "sink";
> > +             source-pdos = <0x380190c8>;
>
> I understand from DT specification point of view cryptic numbers are OK,
> but for sake of readability I strongly suggest use/define macros similar
> to the ones present already in kernel:
>     source-pdos = < PDO_FIXED(5000, 400, PDO_FIXED_FLAGS) >;

I agree it's easier to read, so with the proposed way, we need maintain
a copy of those macros for dts(e.g. under dt-binding/usb/pd.h), right?

thanks
Jun
>
> It much less error prone, and makes review process much more easier.
>
> Regards
> Andrzej
>
> > +             sink-pdos = <0x380190c8 0x3802d0c8>;
> > +             op-sink-microwatt-hours = <9000000>;
> > +     };
> > +};
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
