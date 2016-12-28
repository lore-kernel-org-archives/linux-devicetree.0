From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: document common IEEE 802.11 frequency properties
Date: Wed, 28 Dec 2016 21:32:16 +0100
Message-ID: <CACna6rwhC=28fCHDzXok8Ka08g3yhcD2VNgQrfUZUCQRGqksOg@mail.gmail.com>
References: <20161228155955.25518-1-zajec5@gmail.com> <f387d897-a1e9-c932-8317-41246be245b0@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f387d897-a1e9-c932-8317-41246be245b0-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 28 December 2016 at 21:05, Arend van Spriel
<arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> On 28-12-16 16:59, Rafa=C5=82 Mi=C5=82ecki wrote:
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>
>> This new file should be used for properties handled at higher level and
>> so usable with all drivers.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>> ---
>>  .../devicetree/bindings/net/wireless/ieee80211.txt       | 16 +++++++++=
+++++++
>>  1 file changed, 16 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/wireless/ieee8=
0211.txt
>>
>> diff --git a/Documentation/devicetree/bindings/net/wireless/ieee80211.tx=
t b/Documentation/devicetree/bindings/net/wireless/ieee80211.txt
>> new file mode 100644
>> index 0000000..c762769
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/wireless/ieee80211.txt
>> @@ -0,0 +1,16 @@
>> +Common IEEE 802.11 properties
>> +
>> +This provides documentation of common properties that are handled by a =
proper
>> +net layer and don't require extra driver code.
>
> Please do not make any assumptions on how DT properties are handled nor
> by what. Just state that these properties apply to all wireless devices
> and are applicable to device specific bindings.

OK, I'll try to improve this description.


>> +Optional properties:
>> + - ieee80211-min-center-freq : minimal supported frequency in KHz
>> + - ieee80211-max-center-freq : maximal supported frequency in KHz
>> +
>> +Example:
>> +
>> +pcie@0,0 {
>> +     reg =3D <0x0000 0 0 0 0>;
>> +     ieee80211-min-center-freq =3D <2437000>;
>> +     ieee80211-max-center-freq =3D <2457000>;
>> +};
>
> Is this the proper level to define it. I was expecting a child node of
> the pci(e) controller. Maybe I am misreading the example.

This is device node, not a controller node (and yes, it's complete
node). You just need to add such a node inside the controller one.

It doesn't seem to be clearly documented, but you can see it in examples in=
:
Documentation/devicetree/bindings/pci/mvebu-pci.txt
Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt

The assignment is done in
pci_scan_device -> pci_set_of_node -> of_pci_find_child_device
(so this isn't controller specific thing).


--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
