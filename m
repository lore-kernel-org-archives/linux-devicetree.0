From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: FW: [PATCH v4 1/4] Broadcom Bluetooth UART Device Tree bindings
Date: Thu, 18 Jun 2015 14:41:10 -0500
Message-ID: <CAL_JsqJAUTjNehtr_Af93k71mdSREb9pLMoSyDTm1S42VkA2sQ@mail.gmail.com>
References: <1434576658-20730-1-git-send-email-ifaenson@broadcom.com>
 <1434576658-20730-2-git-send-email-ifaenson@broadcom.com> <E0D3336E15B58B4294723AC879BA5E942634F2@IRVEXCHMB15.corp.ad.broadcom.com>
 <CAL_JsqK9kup3sm3qgDLqtT8ajrN1ee6zfXwOoZqoq9cXQNwE_w@mail.gmail.com> <E0D3336E15B58B4294723AC879BA5E94263E58@IRVEXCHMB15.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E0D3336E15B58B4294723AC879BA5E94263E58-Wwdb2uEOBX8N93KskqRXH71+IgudQmzARxWJa1zDYLQ@public.gmane.org>
Sender: linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ilya Faenson <ifaenson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: "marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org" <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, Arend Van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 18, 2015 at 1:54 PM, Ilya Faenson <ifaenson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> Hi Rob,

Your emails are base64 encoded. They should be plain text for the list.

> -----Original Message-----
> From: Rob Herring [mailto:robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> Sent: Thursday, June 18, 2015 11:03 AM
> To: Ilya Faenson
> Cc: marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org; Arend Van Spriel; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: FW: [PATCH v4 1/4] Broadcom Bluetooth UART Device Tree bindings
>
> On Wed, Jun 17, 2015 at 6:11 PM, Ilya Faenson <ifaenson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
>> + devicetree lists

[...]

>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/btbcm.txt b/Documentation/devicetree/bindings/net/bluetooth/btbcm.txt
>> new file mode 100644
>> index 0000000..5dbcd57
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/bluetooth/btbcm.txt
>> @@ -0,0 +1,86 @@
>> +btbcm
>> +------
>> +
>> +Required properties:
>> +
>> +       - compatible : must be "brcm,brcm-bt-uart".
>
> You need to describe the chip, not the interface.
>
> IF: This driver is for all Broadcom Bluetooth UART based chips.

BT only chips? Most/many Broadcom chips are combo chips. I understand
the driver for BT is *mostly* separate from other chip functions like
WiFi, GPS and NFC, but the h/w is a single chip. I say most because
likely there are some parts shared: a voltage rail, reset line, or
power down line. I think some can do BT over the SDIO interface too,
so the interface may be shared. The DT is a description of the h/w
(i.e. what part # for a chip) and not a driver data structure. You
need to describe the whole chip in the binding. It is a Linux problem
if there needs to be multiple separate drivers.

>
>> +       - tty : tty device connected to this Bluetooth device.
>
> "tty" is a bit of a Linuxism and "ttyS0" certainly is. Further, there
> is no guarantee which uart is assigned ttyS0.
>
> This should be a phandle to the connected uart if not a sub node of
> the uart. This is complicated since these chips have multiple host
> connections. It needs to go under either uart or SDIO host and have a
> reference back to the one it is not under. Given the SDIO interface is
> discoverable (although sideband gpios and regulators are not), I would
> put this under the uart node as that is never discoverable.
>
> As I've mentioned previously, there's several cases of bindings for
> UART slave devices being posted. This all needs to be coordinated to
> use a common structure.
>
> IF: This driver does not really access the UART. If just needs to have a string of some sort to map instances of the BlueZ protocol into platform devices to employ the right GPIOs and interrupts. I could use anything you recommend available through the tty_struct coming to the protocol from the BlueZ line discipline. Moreover, every end user platform I've ever dealt with in 16 years of working with Bluetooth had a single BT UART device. So these are really rare (typically test platforms) cases only. The mapping is not needed for most platforms at all. I suspect the right thing to do would be to make this parameter optional. The mapping would be done only if the parameter is present. I will use anything tty_struct derived you specify. Makes sense?


You've missed my point. I'm not talking about connecting multiple
devices to a UART at once. There are several instances of people
trying to add UART connected devices into DT[1][2]. My point is these
devices all need to have the DT binding done in a common way across
different platforms. Otherwise, we can not have common code to parse
the DT and find devices attached to a UART.


>
>> +
>> +Optional properties:
>> +
>> +  - bt-host-wake-gpios : bt-host-wake input GPIO to be used as an interrupt.
>> +
>> +  - bt-wake-gpios : bt-wake output GPIO to be used to suspend / resume device.
>> +
>> +  - bt-reg-on-gpios : reg-on output GPIO to be used to power device on/off.
>> +
>> +  - oper-speed : Bluetooth device operational baud rate.
>> +    Default: 3000000.
>> +
>> +  - manual-fc : flow control UART in suspend / resume scenarios.
>> +    Default: 0.
>
> Can be boolean?
>
> I don't really follow the description.
>
> IF: Okay, I will make it boolean. To clarify the description, it controls whether the BlueZ protocol needs to flow control the UART when the BT device is suspended and un-flow control it when the device is resumed.

Okay. Discussion of BlueZ is not relevant to bindings. I would say
something like "The hardware requires the host UART flow-control to be
de-asserted during suspend."

[...]

>> +  - configure-audio : configure platform PCM SCO flag.
>> +    Default: false.
>
> So ignore the rest of the settings if not set? Perhaps combine with pcm-routing:
>
> <blank> - no audio
> audio-mode = "pcm";
> audio-mode = "hci"; (or "sco-hci"?)
>
> IF: That's right: the rest of the parameters are not needed if configure-audio is false. Talking about your suggestions, this driver does nothing if the audio is either sent inbound or not used at all. Would you agree to something like the configure-pcm-audio flag?

So why not combine with pcm-routing?

[...]

> Use the actual rate rather than an enumeration. It is a simple div by
> 128k and log2 to convert in the driver. This makes the property more
> compatible with other chips.
>
> IF: These rates are subject to change in future chips with no guarantees of the pattern holding. I would prefer to use the actual value expected by the firmware if you don't mind to avoid maintaining the extra driver code.

Exactly my point. If the next chip has 0-64k, 1-256k, 2-2048k, your
binding is broken. Just put the bit rate in the binding and do the
mapping to register value in the driver.

> What does incall mean? What is the bit rate when not in a call?
>
> IF: That's the name given to me by the hardware guys. What do you think about the "pcm-interface-rate" instead?

That's somewhat ambiguous. Is that the clock, sample rate, or bit rate
(sample rate * sample size * channels).

Rob

[1] https://lwn.net/Articles/643878/
[2] http://www.spinics.net/lists/devicetree/msg83596.html
