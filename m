From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: document common IEEE 802.11 frequency properties
Date: Tue, 3 Jan 2017 21:20:49 +0100
Message-ID: <CACna6rxmgN2zz-Fc1-Uu02oqMQreNkMJt0jGjLOMrXM=6iujFw@mail.gmail.com>
References: <20161228155955.25518-1-zajec5@gmail.com> <20170103195514.vf4psb6qw2bd2lcw@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170103195514.vf4psb6qw2bd2lcw@rob-hp-laptop>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 3 January 2017 at 20:55, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Dec 28, 2016 at 04:59:54PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>
>> This new file should be used for properties handled at higher level and
>> so usable with all drivers.
>
> Why is this needed? Where would this data normally come from?

Vendors limit choice of channels at their web user interface level. I
want to do better and report proper channels directly at kernel level
instead of masking them in every possible configuration tool.


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
> Not relavent to a binding. Bindings describe h/w.

Yes, Arend pointed it to me and I improved this Documentation file in
further versions. Could you review V4, please?
https://patchwork.kernel.org/patch/9494713/

--=20
Rafa=C5=82
