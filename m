From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: document common IEEE 802.11 frequency properties
Date: Wed, 28 Dec 2016 23:22:13 +0100
Message-ID: <CACna6rxG=Jbac4QC8F5LFvO1N489HtkeuF1brZepa9uC_cxvwQ@mail.gmail.com>
References: <20161228155955.25518-1-zajec5@gmail.com> <ddd1bb11-eb4d-7a53-c3ea-5ff5e59ae100@nbd.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ddd1bb11-eb4d-7a53-c3ea-5ff5e59ae100-Vt+b4OUoWG0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Cc: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 28 December 2016 at 22:35, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org> wrote:
> On 2016-12-28 16:59, Rafa=C5=82 Mi=C5=82ecki wrote:
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
>> +
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
> I'm not sure that's the best way to deal with enabling/disabling bands.
> If we get more bands in the future, there might be unsupported ones in
> the middle, which min/max won't cover.

Maybe we could try specifying list of ranges? E.g.
ieee80211-center-frequencies =3D <2412000 2422000
    2442000 2452>;
or
ieee80211-center-frequencies =3D <2412000 2422000>,
    <2442000 2452>;
for device supporting channels 1, 2, 3, 7, 8, 9?

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
