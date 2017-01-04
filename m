From: Arend Van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: document common IEEE 802.11 frequency
 properties
Date: Wed, 4 Jan 2017 20:53:07 +0100
Message-ID: <fec0dffd-5c9f-0d9d-a458-464d81952ce0@broadcom.com>
References: <20161228155955.25518-1-zajec5@gmail.com>
 <20170103195514.vf4psb6qw2bd2lcw@rob-hp-laptop>
 <CACna6rxmgN2zz-Fc1-Uu02oqMQreNkMJt0jGjLOMrXM=6iujFw@mail.gmail.com>
 <874m1ej3oz.fsf@kamboji.qca.qualcomm.com>
 <CACna6rxx-8499ZQKekdORF0UWQQazwGu2On1aq-fwA4oCX7pgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACna6rxx-8499ZQKekdORF0UWQQazwGu2On1aq-fwA4oCX7pgw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 4-1-2017 15:53, Rafał Miłecki wrote:
> On 4 January 2017 at 15:32, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>
>>> On 3 January 2017 at 20:55, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>>> On Wed, Dec 28, 2016 at 04:59:54PM +0100, Rafał Miłecki wrote:
>>>>> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>>>>
>>>>> This new file should be used for properties handled at higher level and
>>>>> so usable with all drivers.
>>>>
>>>> Why is this needed? Where would this data normally come from?
>>>
>>> Vendors limit choice of channels at their web user interface level. I
>>> want to do better and report proper channels directly at kernel level
>>> instead of masking them in every possible configuration tool.
>>
>> Why do vendors limit the channels? Is it because of a hardware
>> limitation (antenna does not support, or not calibrated, for a certain
>> band etc) or something else?
> 
> Please review & comment on the latest version, currently V5:
> https://patchwork.kernel.org/patch/9495795/
> "This can be used to specify extra hardware limitations caused by e.g.
> used antennas or power amplifiers."

Just to be clear, it is does not need to be a hardware limitation, but
simply a way to assure that multiple wlan radios are not interfering
with each other and crank up the total bandwidth that vendors can put on
their box.

Regards,
Arend
