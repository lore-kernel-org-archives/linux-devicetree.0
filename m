From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: add binding for USBSS-DRD controller.
Date: Thu, 14 Feb 2019 08:00:52 -0600
Message-ID: <CAL_Jsq+wqtY=B1jKKxjFxnBMy_kiN9=MhHdMp=bEPa9wFo1NqQ@mail.gmail.com>
References: <1548935553-452-1-git-send-email-pawell@cadence.com>
 <1548935553-452-2-git-send-email-pawell@cadence.com> <20190213224841.GA9319@bogus>
 <BYAPR07MB4709EA63F1374EA24E23C186DD670@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR07MB4709EA63F1374EA24E23C186DD670@BYAPR07MB4709.namprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 14, 2019 at 12:08 AM Pawel Laszczak <pawell@cadence.com> wrote:
>
> Hi Rob,
> >On Thu, Jan 31, 2019 at 11:52:28AM +0000, Pawel Laszczak wrote:
> >> This patch aim at documenting USB related dt-bindings for the
> >> Cadence USBSS-DRD controller.
> >>
> >> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> >> ---
> >>  .../devicetree/bindings/usb/cdns-usb3.txt     | 33 +++++++++++++++++++
> >>  1 file changed, 33 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/usb/cdns-usb3.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/usb/cdns-usb3.txt b/Documentation/devicetree/bindings/usb/cdns-usb3.txt
> >> new file mode 100644
> >> index 000000000000..6dc38be77f5c
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/usb/cdns-usb3.txt
> >> @@ -0,0 +1,33 @@
> >> +Binding for the Cadence USBSS-DRD controller
> >> +
> >> +Required properties:
> >> +  - reg: Physical base address and size of the controller's register areas.
> >> +     Controller has 3 different regions:
> >> +     region 1 - HOST registers area
> >> +     region 2 - DEVICE registers area
> >> +     region 3 - OTG/DRD registers area
> >> +  - reg-names - register memory area names:
> >> +    "xhci" - for HOST registers space
> >> +    "dev" - for DEVICE registers space
> >> +    "otg" - for OTG/DRD registers space
> >> +  - compatible: Should contain: "cdns,usb3-1.0.0" or "cdns,usb3-1.0.1"
> >> +  - interrupts: Interrupt specifier. Refer to interrupt bindings.
> >> +            Driver supports only single interrupt line.
> >
> >Driver supports or h/w only has 1 interrupt?
>
> h/w internally has 3 separate interrupt line, but in my testing board
> they are ored. So physically driver sees only one h/w interrupt line and
> assumes that h/w has single common interrupt line.

If it is possible for others to have 3 separate lines then you should
have 3. Just repeat the connection 3 times. Or the binding can support
1 or 3 interrupts based on the h/w. Either way it's not about what the
driver supports, but what the h/w looks like.

> >> +                This single interrupt is shared between Device,
> >> +            host and OTG/DRD part of driver.
> >> +
> >> +Optional properties:
> >> + - maximum-speed : valid arguments are "super-speed", "high-speed" and
> >> +                   "full-speed"; refer to usb/generic.txt
> >> + - dr_mode: Should be one of "host", "peripheral" or "otg".
> >> + - phys: reference to the USB PHY
> >> +
> >> +Example:
> >> +    usb@f3000000 {
> >> +            compatible = "cdns,usb3";
> >
> >Doesn't match above.
> Right, should be:
>                 Compatible = " cdns,usb3-1.0.0", "cdns,usb3-1.0.1";

No, that doesn't match either. Above you said "or".

Rob
