From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH resend 02/12] usb: typec: add basic typec properties
Date: Mon, 9 Oct 2017 08:12:05 -0500
Message-ID: <CAL_JsqJWxm1bT38vG3P+2ZihUec5-EVcGAygH+V-RgyF-VjBpg@mail.gmail.com>
References: <1506398723-19359-1-git-send-email-jun.li@nxp.com>
 <1506398723-19359-3-git-send-email-jun.li@nxp.com> <20171005204400.4q3fpeui525tmfo4@rob-hp-laptop>
 <DB4PR04MB07683A52DD500A40C2B9047A89740@DB4PR04MB0768.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DB4PR04MB07683A52DD500A40C2B9047A89740-tLF+feb1Bz6HC8XOQgzeLs9NdZoXdze2vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jun Li <jun.li-3arQi8VN3Tc@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org" <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org" <o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>, "A.s. Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 9, 2017 at 6:21 AM, Jun Li <jun.li-3arQi8VN3Tc@public.gmane.org> wrote:
> Hi Rob,
>
>> -----Original Message-----
>> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
>> Sent: Friday, October 06, 2017 4:44 AM
>> To: Jun Li <jun.li-3arQi8VN3Tc@public.gmane.org>
>> Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org;
>> heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org; yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org; o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org;
>> Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>; A.s. Dong <aisheng.dong-3arQi8VN3Tc@public.gmane.org>; linux-
>> usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Subject: Re: [PATCH resend 02/12] usb: typec: add basic typec properties
>>
>> On Tue, Sep 26, 2017 at 12:05:13PM +0800, Li Jun wrote:
>> > port-type is required for any typec port; default-role is only
>> > required for drp; power source capable needs src-pdos; power sink
>> > capable needs snk-pdos, max-snk-mv, max-snk-ma, op-snk-mw.
>>
>> "dt-bindings: usb: ..." for the subject prefix.
>>
>
> Will update in next version.
>
>> >
>> > Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
>> > ---
>> >  Documentation/devicetree/bindings/usb/typec.txt | 46
>> > +++++++++++++++++++++++++
>> >  1 file changed, 46 insertions(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/usb/typec.txt
>> > b/Documentation/devicetree/bindings/usb/typec.txt
>> > new file mode 100644
>> > index 0000000..36d4467
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/usb/typec.txt
>> > @@ -0,0 +1,46 @@
>> > +Generic typec and power delivery properties
>> > +-------------------------------------------
>>
>> What node do these apply to? A type C connector node? The PD microcontroller?
>>
>
> My initial thinking is those are general type-c properties, which can be applied to
> type-C connector or used by PD microcontroller directly (my example),  I want
> to get inputs on how this can be handled properly, so do you think a separated
> node(e.g. type-c connector) is required to describe all the capability of the type-c
> port has, then a type-c related driver get the phandle of it?
>
>> I'm reluctant to accept just a random list of properties without a more complete
>> Type-C binding which I'd expect to have a connector node, OF graph ports to
>> connect to video outputs, connection to USB controller, and connection to the
>> PD controller.
>>
>
> As type-C with PD has many properties to complete the description for diff usage,
> so this is just a first step to have the basic power related bindings.

We need something more complete, not something that just evolves. At
least the basic relationships between connectors, PD controller,
alternate modes, and USB controllers needs to be defined.

Andrzej started on defining USB connectors[1]. That's where we need to
start for Type-C bindings. Work together on this.

Rob

>> > +Required properties:
>> > +- port-type:    should be one of "source", "sink" or "dual".
>> > +- default-role: preferred power role if drp, should be "sink" or "source".
>> > +- src-pdos:     An array of u32 with each entry providing supported power
>> > +                source data object(PDO), the detailed bit definitions of
>> > +                PDO can be found in "Universal Serial Bus Power Delivery
>> > +                Specification" chapter 6.4.1.2 Source_Capabilities Message,
>> > +                the order of each entry(PDO) should follow the PD spec chapter
>> > +                6.4.1. Required only for power source and power dual role with
>> > +                power delivery support.
>> > +- snk-pdos:     An array of u32 with each entry providing supported power
>> > +                sink data object(PDO), the detailed bit definitions of PDO
>> > +                can be found in "Universal Serial Bus Power Delivery
>> > +                Specification" chapter 6.4.1.3 Sink Capabilities Message,
>> > +                the order of each entry(PDO) should follow the PD spec chapter
>> > +                6.4.1. Required only for power sink and power dual role with
>> > +                power delivery support.
>>
>> > +- max-snk-mv:   The max voltage the sink can support in millivoltage, required
>> > +                only for power sink and power dual role with power delivery
>> > +                support.
>> > +- max-snk-ma:   The max current the sink can support in milliampere, required
>> > +                only for power sink and power dual role with power delivery
>> > +                support.
>> > +- op-snk-mw:    Sink required operating power in milliwatts, if source offered
>> > +                power is less then it, Capability Mismatch is set, required
>> > +                only for power sink and power dual role with power delivery
>> > +                support.
>>
>> Use the standard unit suffixes as defined in property-units.txt
>>
>
> Thanks, will update in next version.
>
> Li Jun
>> > +
>> > +Example:
>> > +
>> > +ptn5110@50 {
>> > +   compatible = "usb,tcpci";
>> > +   reg = <0x50>;
>> > +   interrupt-parent = <&gpio3>;
>> > +   interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
>> > +   port-type = "dual";
>> > +   default-role = "sink";
>> > +   src-pdos = <0x380190c8>;
>> > +   snk-pdos = <0x380190c8 0x3802d0c8>;
>> > +   max-snk-mv = <9000>;
>> > +   max-snk-ma = <1000>;
>> > +   op-snk-mw = <9000>;
>> > +};

[1] http://www.spinics.net/lists/devicetree/msg197601.html
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
