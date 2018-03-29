From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: usb: rt1711h device tree binding document
Date: Wed, 28 Mar 2018 22:09:03 -0500
Message-ID: <CAL_JsqJvitoh-+T0JQN=-GkZzTkT7J1_NcHTSx_x1_q48sTcHg@mail.gmail.com>
References: <1521537304-7531-1-git-send-email-leechu729@gmail.com>
 <1521537304-7531-3-git-send-email-leechu729@gmail.com> <20180326222336.jqix6k4pyqy4bg36@rob-hp-laptop>
 <CAFaeLdQXQnE9XpAsgOPg=D_wAqEKe4dQhtKYrS1sDT5wgqSdVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFaeLdQXQnE9XpAsgOPg=D_wAqEKe4dQhtKYrS1sDT5wgqSdVw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?5p2O5pu45biG?= <leechu729@gmail.com>
Cc: Greg KH <greg@kroah.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?B?c2h1ZmFuX2xlZSjmnY7mm7jluIYp?= <shufan_lee@richtek.com>, =?UTF-8?B?Y3lfaHVhbmco6buD5ZWf5Y6fKQ==?= <cy_huang@richtek.com>, Jun Li <jun.li@nxp.com>, Mats Karrman <mats.dev.list@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 27, 2018 at 9:30 AM, 李書帆 <leechu729@gmail.com> wrote:
> Hi Rob,
>
> 2018-03-27 6:23 GMT+08:00 Rob Herring <robh@kernel.org>:
>> On Tue, Mar 20, 2018 at 05:15:04PM +0800, ShuFan Lee wrote:
>>> From: ShuFan Lee <shufan_lee@richtek.com>
>>>
>>> Add device tree binding document for Richtek RT1711H Type-C chip driver
>>>
>>> Signed-off-by: ShuFan Lee <shufan_lee@richtek.com>
>>> ---
>>>  .../devicetree/bindings/usb/richtek,rt1711h.txt    | 30 ++++++++++++++++++++++
>>>  1 file changed, 30 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
>>>
>>>  changelogs between v2 & v3
>>>  - add dt-bindings for rt1711h typec driver
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt b/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
>>> new file mode 100644
>>> index 000000000000..7da4dac78ea7
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
>>> @@ -0,0 +1,30 @@
>>> +Richtek RT1711H TypeC PD Controller.
>>> +
>>> +Required properties:
>>> + - compatible : Must be "richtek,rt1711h".
>>> + - reg : Must be 0x4e, it's slave address of RT1711H.
>>> +
>>> +Recommended properties :
>>> + - interrupt-parent : the phandle for the interrupt controller that
>>> +   provides interrupts for this device.
>>> + - interrupts : <a b> where a is the interrupt number and b represents an
>>> +   encoding of the sense and level information for the interrupt.
>>> +
>>> +Optional properties :
>>> + - rt,intr-gpios : IRQ GPIO pin that's connected to RT1711H interrupt.
>>> +   if interrupt-parent & interrupts are not defined, use this property instead.
>>
>> Drop this. You should simply always have interrupts property.
> Does this also imply that we could always assume client->irq is ready
> for request?

No idea.

> Therefore, there's no need to check client->irq and get gpio through
> rt,intr-gpios.

Looked to me like the gpio is just converted to an irq and used for
nothing else in the driver. If that's the case, then there's no point
in it being a gpio.

Rob
