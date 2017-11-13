From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: Add Cygnus usb phy binding
Date: Mon, 13 Nov 2017 11:53:21 -0600
Message-ID: <CAL_JsqL+KaxAHb_u31U07-e+Nm2cW=Wi-oHyTP42B--hBiEyig@mail.gmail.com>
References: <1510127203-5815-1-git-send-email-raveendra.padasalagi@broadcom.com>
 <1510127203-5815-2-git-send-email-raveendra.padasalagi@broadcom.com>
 <20171110214439.rlt5de2c6e6k246d@rob-hp-laptop> <CAAFb_vqKLOixSROUvkRFR=hwOqQvnVyV4mu37=MrEBo-pZaF5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAFb_vqKLOixSROUvkRFR=hwOqQvnVyV4mu37=MrEBo-pZaF5w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Raveendra Padasalagi <raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Vikram Prakash <vikram.prakash-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rafal Milecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-ke
List-Id: devicetree@vger.kernel.org

On Sun, Nov 12, 2017 at 10:23 PM, Raveendra Padasalagi
<raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> Hi,
>
> On Sat, Nov 11, 2017 at 3:14 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Wed, Nov 08, 2017 at 01:16:41PM +0530, Raveendra Padasalagi wrote:
>>> Add devicetree binding document for broadcom's
>>> Cygnus SoC specific usb phy controller driver.
>>>
>>> Signed-off-by: Raveendra Padasalagi <raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>> ---
>>>  .../bindings/phy/brcm,cygnus-usb-phy.txt           | 106 +++++++++++++++++++++
>>>  1 file changed, 106 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/phy/brcm,cygnus-usb-phy.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/brcm,cygnus-usb-phy.txt b/Documentation/devicetree/bindings/phy/brcm,cygnus-usb-phy.txt
>>> new file mode 100644
>>> index 0000000..bbc4b94
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/phy/brcm,cygnus-usb-phy.txt
>>> @@ -0,0 +1,106 @@
>>> +BROADCOM CYGNUS USB PHY
>>> +
>>> +Required Properties:
>>> +- compatible:  brcm,cygnus-usb-phy
>>> +- reg : the register start address and length for
>>> +        crmu_usbphy_aon_ctrl,
>>> +        cdru usb phy control,
>>> +        usb host idm registers,
>>> +        usb device idm registers.
>>> +- reg-names: a list of the names corresponding to the previous register ranges
>>> +  Should contain
>>> +        "crmu-usbphy-aon-ctrl",
>>> +        "cdru-usbphy",
>>> +        "usb2h-idm",
>>> +        "usb2d-idm".
>>> +- address-cells: should be 1
>>> +- size-cells: should be 0
>>> +
>>> +Sub-nodes:
>>> +  Each port's PHY should be represented as a sub-node.
>>> +
>>> +Sub-nodes required properties:
>>> +- reg: the PHY number
>>> +- #phy-cells must be 1
>>> +  The node that uses the phy must provide 1 integer argument specifying
>>> +  port number.
>>> +
>>> +Optional Properties:
>>> +- vbus-p#-supply : The regulator for vbus out control for the host
>>
>> Is this a literal # or something else?
>
> Yes, this is a literal. It's assumed # will replace numeric 0-2 for
> each of the ports.

I'm still confused. Which is valid? "vbus-p#-supply" or "vbus-p0-supply"

If the latter, you need to enumerate all valid options. But these are
in sub nodes for each port, so just "vbus-supply" should be
sufficient.

One more question, does Vbus actually supply power to the phy or you
are just associating the Vbus supply to a connector with a port? The
latter needs a connector node instead and Vbus should be part of that.
There's been some attempts at USB connectors, but we don't really have
one yet (the extcon binding is not it).

> In the example it's not shown as the regulators specified in vbus-p#-supply
> are board specific.

Please show in the example. Examples should be complete.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
