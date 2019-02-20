From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 3/8] dt-bindings: net: bluetooth: Add rtl8723bs-bluetooth
Date: Wed, 20 Feb 2019 10:59:49 +0800
Message-ID: <CAGb2v65ZCaRcr1SJ=6pvviMAn7S0Nf3gEt8y9o8-ftXwXGc5hA@mail.gmail.com>
References: <20190118170232.16142-1-anarsoul@gmail.com> <20190118170232.16142-4-anarsoul@gmail.com>
 <20190218211035.GA28145@bogus> <CA+E=qVdq5GORg-t-vVXM3zBxy3Aq93iCE+zmcGgLFBMcnTDgfw@mail.gmail.com>
 <1245842044.588056.1550527701604@email.ionos.de> <CA+E=qVdMNmVkytCzXqYgJtV196-G=c_bWx+aLvs=Y0iuRpjdRg@mail.gmail.com>
 <CAL_JsqLROpJMoEPLXaAL_JG1SNufstMDmB4xy_V_p4=duHKPSA@mail.gmail.com> <6a26ff97-0b9c-cfdd-9428-74580694220a@davidjohnsummers.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <6a26ff97-0b9c-cfdd-9428-74580694220a@davidjohnsummers.uk>
Sender: netdev-owner@vger.kernel.org
To: David Summers <beagleboard@davidjohnsummers.uk>
Cc: Rob Herring <robh@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Stefan Wahren <stefan.wahren@i2se.com>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Johan Hedberg <johan.hedberg@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, netdev <netdev@vger.kernel.org>, Marcel Holtmann <marcel@holtmann.org>, "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, arm-linux <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 20, 2019 at 5:09 AM David Summers
<beagleboard@davidjohnsummers.uk> wrote:
>
> On 19/02/2019 14:17, Rob Herring wrote:
> > On Mon, Feb 18, 2019 at 4:28 PM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
> >> On Mon, Feb 18, 2019 at 2:08 PM Stefan Wahren <stefan.wahren@i2se.com> wrote:
> >>> Hi Vasily,
> >> Hi Stefan,
> >>
> >>>> Vasily Khoruzhick <anarsoul@gmail.com> hat am 18. Februar 2019 um 22:24 geschrieben:
> >>>>
> >>>>
> >>>> On Mon, Feb 18, 2019 at 1:10 PM Rob Herring <robh@kernel.org> wrote:
> >>>>> On Fri, Jan 18, 2019 at 09:02:27AM -0800, Vasily Khoruzhick wrote:
> >>>>>> Add binding document for bluetooth part of RTL8723BS/RTL8723CS
> >>>>>>
> >>>>>> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> >>>>>> ---
> >>>>>>   .../bindings/net/rtl8723bs-bluetooth.txt      | 35 +++++++++++++++++++
> >>>>>>   1 file changed, 35 insertions(+)
> >>>>>>   create mode 100644 Documentation/devicetree/bindings/net/rtl8723bs-bluetooth.txt
> >>>>>>
> >>>>>> diff --git a/Documentation/devicetree/bindings/net/rtl8723bs-bluetooth.txt b/Documentation/devicetree/bindings/net/rtl8723bs-bluetooth.txt
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..8357f242ae4c
> >>>>>> --- /dev/null
> >>>>>> +++ b/Documentation/devicetree/bindings/net/rtl8723bs-bluetooth.txt
> >>>>>> @@ -0,0 +1,35 @@
> >>>>>> +RTL8723BS/RTL8723CS Bluetooth
> >>>>>> +---------------------
> >>>>>> +
> >>>>>> +RTL8723CS/RTL8723CS is WiFi + BT chip. WiFi part is connected over SDIO, while
> >>>>>> +BT is connected over serial. It speaks H5 protocol with few extra commands
> >>>>>> +to upload firmware and change module speed.
> >>>>>> +
> >>>>>> +Required properties:
> >>>>>> +
> >>>>>> + - compatible: should be one of the following:
> >>>>>> +   * "realtek,rtl8723bs-bt"
> >>>>>> +   * "realtek,rtl8723cs-bt"
> >>>>>> +Optional properties:
> >>>>>> +
> >>>>>> + - device-wake-gpios: GPIO specifier, used to wakeup the BT module (active high)
> >>>>>> + - enable-gpios: GPIO specifier, used to enable the BT module (active high)
> >>>>>> + - host-wake-gpios: GPIO specifier, used to wakeup the host processor (active high)
> >>>>>> + - firmware-postfix: firmware postfix to be used for firmware config
> >>> sorry, i didn't noticed your great series before. David and i working at the same stuff but for the Asus Tinker Board.
> >>>
> >>> I created a similiar yet untested patch version for hci_h5 [1]. Maybe it's useful.
> >> Looks good to me, but you may need to add firmware-postfix.
> >>
> >>> Just a comment about the binding. It's really necessary to add the reset-gpio? Can't we use the enable-gpio with inverse polarity for this?
> >> Yes, we can use enable-gpio instead of reset-gpio on pine64 and pinebook.
> > Then why do we have both? Reset and enable are distinct. The inverse
> > of enable-gpios is typically powerdown-gpios, not reset-gpios.
> >
> > Rob
>
> Both data sheets that I know:
>
> http://cit.odessa.ua/media/pdf/Intel-Compute-Stick/FN-Link_F23BDSM25-W1.pdf
> http://files.pine64.org/doc/datasheet/pine64/RTL8723BS.pdf
>
> BT_RST_N BT Reset IN / BT_DIS# General Purpose I/O Pin
>
> So from the datasheet there is only one pin. And from its name it sounds
> like reset.

Yes there's only one pin. Would be nice if we could use "enable" though.
That is what ACPI uses.

> This said though the datasheets of these Realtek devices are a bit thin ....

These datasheets are for the integrated modules (the chip plus passive
components).
I don't think the datasheet for the chip itself is public.

ChenYu
