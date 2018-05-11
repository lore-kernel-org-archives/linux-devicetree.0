MIME-Version: 1.0
In-Reply-To: <OSBPR01MB2293BDDB3DDEF46D6EDA8F20D89A0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1524742006-17984-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<1524742006-17984-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<20180427200559.5kxgetsjzpjlrm2m@rob-hp-laptop>
	<OSBPR01MB2293BDDB3DDEF46D6EDA8F20D89A0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Date: Fri, 11 May 2018 11:07:29 -0500
Message-ID: <CAL_JsqJpzJqs4xbTvy=BCrJvxCUfrhif80Qp+h5xc=AOC0hvhg@mail.gmail.com>
Subject: Re: [PATCH/RFC v2 1/6] dt-bindings: usb: add Renesas R-Car USB 3.0
 role switch
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, May 7, 2018 at 9:43 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Hi Rob,
>
> Sorry for the delayed response. I had a vacation in last week.
>
>> From: Rob Herring, Sent: Saturday, April 28, 2018 5:06 AM
>>
>> On Thu, Apr 26, 2018 at 08:26:41PM +0900, Yoshihiro Shimoda wrote:
>> > This patch adds a new documentation for Renesas R-Car USB 3.0 role
>> > switch that can change the USB 3.0 role to either host or peripheral
>> > by a hardware register that is included in USB3.0 peripheral module.
>> >
>> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> > ---
>> >  .../bindings/usb/renesas,rcar-usb3-role-sw.txt     | 47 ++++++++++++++++++++++
>> >  1 file changed, 47 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt
>> b/Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt
>> > new file mode 100644
>> > index 0000000..e074c03
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt
>> > @@ -0,0 +1,47 @@
>> > +Renesas Electronics R-Car USB 3.0 role switch
>> > +
>> > +A renesas_usb3's node can contain this node.
>> > +
>> > +Required properties:
>> > + - compatible: Must contain "renesas,rcar-usb3-role-switch".
>> > +
>> > +Required nodes:
>> > + - The connection to a usb3.0 host node needs by using OF graph bindings.
>> > +  - port@0 = USB 3.0 host port
>> > +  - port@1 = USB 3.0 peripheral port
>> > +
>> > +Example of R-Car H3 ES2.0:
>> > +   usb3_peri0: usb@ee020000 {
>> > +           compatible = "renesas,r8a7795-usb3-peri",
>> > +                        "renesas,rcar-gen3-usb3-peri";
>> > +           reg = <0 0xee020000 0 0x400>;
>> > +           interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
>> > +           clocks = <&cpg CPG_MOD 328>;
>> > +           power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
>> > +           resets = <&cpg 328>;
>> > +
>> > +           usb3-role-sw {
>> > +                   compatible = "renesas,rcar-usb3-role-switch";
>>
>> You don't define any h/w resources. How is this device accessed?
>
> This device accesses one of registers in the usb3_peri0.
> In the detail, the usb3-role-sw uses 0xee020218 (32-bit register) only.
> (Unfortunately, the hardware design is not good...)
>
> In this case, should I describe the following in the usb3-role-sw node?
>
>         reg = <0 0xee020218 0 4>;
>
> Or, shouldn't I add the usb3-role-sw node and a driver for usb3_peri0 should
> take care for it?

IMO, the driver should take care of it.

Rob
