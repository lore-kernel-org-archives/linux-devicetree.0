From: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: FW: [PATCH v4 1/4] Broadcom Bluetooth UART Device Tree bindings
Date: Fri, 19 Jun 2015 19:06:38 +0200
Message-ID: <55844C1E.8020301@broadcom.com>
References: <1434576658-20730-1-git-send-email-ifaenson@broadcom.com> <1434576658-20730-2-git-send-email-ifaenson@broadcom.com> <E0D3336E15B58B4294723AC879BA5E942634F2@IRVEXCHMB15.corp.ad.broadcom.com> <CAL_JsqK9kup3sm3qgDLqtT8ajrN1ee6zfXwOoZqoq9cXQNwE_w@mail.gmail.com> <E0D3336E15B58B4294723AC879BA5E94263E58@IRVEXCHMB15.corp.ad.broadcom.com> <CAL_JsqJAUTjNehtr_Af93k71mdSREb9pLMoSyDTm1S42VkA2sQ@mail.gmail.com> <E0D3336E15B58B4294723AC879BA5E942640A3@IRVEXCHMB15.corp.ad.broadcom.com> <CAL_JsqJKyj8sDwG82jb_CzXEDBN8aznR7eF5yTOiWruW8o3cng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJKyj8sDwG82jb_CzXEDBN8aznR7eF5yTOiWruW8o3cng-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ilya Faenson <ifaenson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org" <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/19/15 17:47, Rob Herring wrote:
> On Thu, Jun 18, 2015 at 3:37 PM, Ilya Faenson<ifaenson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> =
 wrote:
>> Hi Rob.
>>
>> -----Original Message-----
>> From: linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-bluetooth-=
owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Rob Herring
>> Sent: Thursday, June 18, 2015 3:41 PM
>> To: Ilya Faenson
>> Cc: marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org; Arend Van Spriel; devicetree-u79uwXL29TaqPxH82wqD4g@public.gmane.org=
g; linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Subject: Re: FW: [PATCH v4 1/4] Broadcom Bluetooth UART Device Tree =
bindings
>>
>> On Thu, Jun 18, 2015 at 1:54 PM, Ilya Faenson<ifaenson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>=
  wrote:
>>> Hi Rob,
>>
>> Your emails are base64 encoded. They should be plain text for the li=
st.
>>
>> IF: The Outlook is configured to respond in the sender's format. I t=
herefore respond in the encoding you've used.
>
> I assure you that that is not the case or I would be banished from
> lists by now. Outlook is generally incapable of correctly sending
> mails to lists. The reply header above is one aspect of that. The
> other problem is your replies don't get wrapped and prefixed properly=
=2E
> That could be my client I guess, but *all* other mails are fine.
>
> My sent mails have:
>
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: quoted-printable
>
>
>>> -----Original Message-----
>>> From: Rob Herring [mailto:robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
>>> Sent: Thursday, June 18, 2015 11:03 AM
>>> To: Ilya Faenson
>>> Cc: marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org; Arend Van Spriel; devicetree-u79uwXL29TbrhsbdSgBK9A@public.gmane.org=
rg; linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> Subject: Re: FW: [PATCH v4 1/4] Broadcom Bluetooth UART Device Tree=
 bindings
>>>
>>> On Wed, Jun 17, 2015 at 6:11 PM, Ilya Faenson<ifaenson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org=
>  wrote:
>>>> + devicetree lists
>>
>> [...]
>>
>>>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/btbcm=
=2Etxt b/Documentation/devicetree/bindings/net/bluetooth/btbcm.txt
>>>> new file mode 100644
>>>> index 0000000..5dbcd57
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/net/bluetooth/btbcm.txt
>>>> @@ -0,0 +1,86 @@
>>>> +btbcm
>>>> +------
>>>> +
>>>> +Required properties:
>>>> +
>>>> +       - compatible : must be "brcm,brcm-bt-uart".
>>>
>>> You need to describe the chip, not the interface.
>>>
>>> IF: This driver is for all Broadcom Bluetooth UART based chips.
>>
>> BT only chips? Most/many Broadcom chips are combo chips. I understan=
d
>> the driver for BT is *mostly* separate from other chip functions lik=
e
>> WiFi, GPS and NFC, but the h/w is a single chip. I say most because
>> likely there are some parts shared: a voltage rail, reset line, or
>> power down line. I think some can do BT over the SDIO interface too,
>> so the interface may be shared. The DT is a description of the h/w
>> (i.e. what part # for a chip) and not a driver data structure. You
>> need to describe the whole chip in the binding. It is a Linux proble=
m
>> if there needs to be multiple separate drivers.
>>
>> IF: Defining complete DT description for the Broadcom combo chips fo=
r multiple interfaces is well beyond the scope of what I am doing. I ju=
st need to define a DT node for the input and output GPIOs connected to=
 the BT UART chip. BT may or may not be part of the combo chip: it does=
 not really matter for this exercise. I thought I would take this oppor=
tunity to place some BT device parameters into that node as well. If yo=
u're not comfortable with this, I could just call it a "GPIO set" to av=
oid mentioning BT and UART at all but it would make little sense. Still=
, I could consider it. Would you have "GPIO set" recommendations? Alter=
natively, NFC Marvell code you're referring to has parameters configure=
d as Linux module parameters. I could do the same too, avoiding this de=
vice tree discussion. Let me know.
>>
>
> I don't completely follow what you mean by "GPIO set", but I'm
> guessing that is not the right path.
>
>> Generally speaking (pontification hat on :-)), what you're trying to=
 do (description of the whole chip) is well beyond what say ACPI has do=
ne (I was involved some in the BT ACPI exercise a few years ago). BT UA=
RT interface is described in ACPI independently of other parts of the s=
ame combo chip. Requirements like that slow down the DT development in =
my opinion as companies are understandably reluctant to work with unrea=
listic goals. End of pontification. :-)
>>
>
> ACPI and DT are very different models in terms of abstraction and
> governance. I'm not going to hash through all the details.
>
> I'm not necessarily saying we have to have a single node, but that is
> my default position. You have convince me that the functions are
> completely independent and I cannot judge that if you are completely
> ignoring the WiFi part. From Broadcom chips I've worked with, the
> supplies at least are shared (something ACPI does not expose). Perhap=
s
> we could fudge that and just require the same supply has to be
> connected to each half. I still worry there could be other internal
> inter-dependencies. Perhaps BT requires the SDIO clock to be active o=
r
> something like that. Maybe not on Broadcom chips, but on other vendor=
s
> and I have to care about them all.

All Broadcom combo chips that I know of have separate supplies, ie.=20
wl-reg-on and bt-reg-on. There already is a binding present for the wif=
i=20
part. Not extending that may seem ignorant, but as wifi and bt can have=
=20
a separate interface to the host (admittedly they could share SDIO=20
interface, but they would be exposed as a separate SDIO function) I did=
=20
not see a reason to object against a separate binding for BT. Whether=20
wifi and bt are on the same device does not seem like something that=20
must be expressed in DT. The physical state may help in determining DT=20
bindings, but it should not be mandatory in my opinion.

> Let's step back to what I'm asking for:
>
> - A more specific compatible string. This should include the chip
> name/number. You may not need it today, but it is insurance in case
> you do find differences latter. The only impact is the match table in
> your driver. You can also have a less specific compatible string if
> you want that the driver can match on.
>
> - Changing the location of the node. The node hierarchy implicitly
> defines connections. You have a connection from the host UART to the
> BT device. This needs to be described. Whether splitting BT and WiFi
> nodes or not, I've already said it probably makes the most sense to
> put this under the host uart node.
>
> - Splitting the nodes. Here we are looking at doing either:
>
> serial@1234 {
>    compatible =3D "some-soc-uart";
>
>    brcm43340 {
>      compatible =3D "brcm,brcm43340";
>      sdio-host =3D<&soc-sdhost>;
>      // BT props
>      // WiFi props
>    };
> };
>
> Or:
>
> serial@1234 {
>    compatible =3D "some-soc-uart";
>
>    brcm43340 {
>      compatible =3D "brcm,brcm43340-bt";
>      // BT props
>    };
> };
>
> mmc@5678 {
>    compatible =3D "some-soc-sdhci";
>
>    brcm43340@0 {
>      reg =3D<0>;
>      compatible =3D "brcm,brcm43340-wifi";
>      // WiFi props
>    };
> };

This is more or less what is in the wifi binding today. See=20
bindings/net/wireless/brcm,bcm43xx-fmac.txt.

Regards,
Arend

> Or maybe it is the latter example but we just add phandle links
> between the 2 nodes.
>
> We haven't even considered what happens when a chip also has FM, NFC,
> and/or GPS. Nor have we considered how to describe the audio
> connection to the host processor, but we've got nothing common and
> that can probably come latter.
>
> We need to agree figuring all this out is needed. Otherwise, this
> whole conversation is a waste of time.
>
>>>
>>>> +       - tty : tty device connected to this Bluetooth device.
>>>
>>> "tty" is a bit of a Linuxism and "ttyS0" certainly is. Further, the=
re
>>> is no guarantee which uart is assigned ttyS0.
>>>
>>> This should be a phandle to the connected uart if not a sub node of
>>> the uart. This is complicated since these chips have multiple host
>>> connections. It needs to go under either uart or SDIO host and have=
 a
>>> reference back to the one it is not under. Given the SDIO interface=
 is
>>> discoverable (although sideband gpios and regulators are not), I wo=
uld
>>> put this under the uart node as that is never discoverable.
>>>
>>> As I've mentioned previously, there's several cases of bindings for
>>> UART slave devices being posted. This all needs to be coordinated t=
o
>>> use a common structure.
>>>
>>> IF: This driver does not really access the UART. If just needs to h=
ave a string of some sort to map instances of the BlueZ protocol into p=
latform devices to employ the right GPIOs and interrupts. I could use a=
nything you recommend available through the tty_struct coming to the pr=
otocol from the BlueZ line discipline. Moreover, every end user platfor=
m I've ever dealt with in 16 years of working with Bluetooth had a sing=
le BT UART device. So these are really rare (typically test platforms) =
cases only. The mapping is not needed for most platforms at all. I susp=
ect the right thing to do would be to make this parameter optional. The=
 mapping would be done only if the parameter is present. I will use any=
thing tty_struct derived you specify. Makes sense?
>>
>>
>> You've missed my point. I'm not talking about connecting multiple
>> devices to a UART at once. There are several instances of people
>> trying to add UART connected devices into DT[1][2]. My point is thes=
e
>> devices all need to have the DT binding done in a common way across
>> different platforms. Otherwise, we can not have common code to parse
>> the DT and find devices attached to a UART.
>>
>> IF: Chances are I was not clear enough. I was not talking about conn=
ecting multiple devices to a UART. I was talking about connecting one B=
roadcom BT device to one serial port and another Broadcom BT device to =
another serial port (rare enough setup). I do understand your goals tho=
ugh. I would be happy to participate in that exercise (subject to the m=
anagement approval) once DT has published the UART device parameters an=
d the Linux bluetooth-next has support for DT enumerated devices. I don=
=E2=80=99t see it happening soon though. Marvell example you've referre=
d me to has nothing of the sort. What do you think of allowing us somet=
hing to ship now with an understanding that we would support your UART =
enumerated devices once they are published?
>
> Okay. Several people want to describe a connection between a host uar=
t
> and a device connected to the uart (BT, NFC, GPS, etc.). You are doin=
g
> this with your "tty" property. My goal and requirement is that this
> connection be described in DT in the same way regardless of the devic=
e
> attached. Just like all I2C device connections are described by being
> child nodes under the I2C host regardless of the type of I2C device
> attached.
>
> Rob

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
