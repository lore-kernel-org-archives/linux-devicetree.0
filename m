From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 10/16] of: Add vendor prefix for MIPS Technologies, Inc.
Date: Mon, 22 Sep 2014 12:43:28 -0700
Message-ID: <CAL1qeaFjxhAJK6hcbA46Gu20SrRg=cpAekByn--aWLKes9OwfQ@mail.gmail.com>
References: <1409938218-9026-1-git-send-email-abrestic@chromium.org>
	<1409938218-9026-11-git-send-email-abrestic@chromium.org>
	<CAL_JsqKGG3ei9=Od74VSL9Sm_=+vsW4U+WBgXmCEtK3iTDfJ0g@mail.gmail.com>
	<CAL1qeaGgBpkuGyxu_P9BNdHjncLA1pfPc-yE98UBj9Ot1koLrA@mail.gmail.com>
	<1E0E7540-B04F-4E89-91F7-B6FAC3C5D889@codeaurora.org>
	<CAL1qeaEd2L8NUugh27hkGMa1aqaxviupRJnBd2+aru1wq6KKGg@mail.gmail.com>
	<C73B2A63-4396-462B-8172-F9CA32E573F1@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <C73B2A63-4396-462B-8172-F9CA32E573F1-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jeffrey Deans <jeffrey.deans-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 22, 2014 at 12:36 PM, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wro=
te:
>
> On Sep 22, 2014, at 2:30 PM, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org=
> wrote:
>
>> On Mon, Sep 22, 2014 at 12:01 PM, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> =
wrote:
>>>
>>> On Sep 22, 2014, at 11:28 AM, Andrew Bresticker <abrestic@chromium.=
org> wrote:
>>>
>>>> On Mon, Sep 22, 2014 at 7:23 AM, Rob Herring <robherring2-Re5JQEeQqe8@public.gmane.org=
m> wrote:
>>>>> On Fri, Sep 5, 2014 at 12:30 PM, Andrew Bresticker
>>>>> <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>>>>>> Add the vendor prefix "mti" for MIPS Technologies, Inc.
>>>>>>
>>>>>> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>>>>> ---
>>>>>> New for v2.
>>>>>> ---
>>>>>> Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>>>>> 1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.t=
xt b/Documentation/devicetree/bindings/vendor-prefixes.txt
>>>>>> index ac7269f..efa5a5b 100644
>>>>>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>>>>>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>>>>>> @@ -86,6 +86,7 @@ microchip     Microchip Technology Inc.
>>>>>> mosaixtech     Mosaix Technologies, Inc.
>>>>>> moxa   Moxa
>>>>>> mpl    MPL AG
>>>>>> +mti    MIPS Technologies, Inc.
>>>>>
>>>>> Why not mips as that is more common and the stock ticker.
>>>>
>>>> "mti" is already in use, see
>>>> Documentation/devicetree/bindings/mips/cpu_irq.txt,
>>>> arch/mips/mti-sead3/sead3.dts, and arch/mips/ralink/dts/*.dtsi.
>>>
>>> Isn=E2=80=99t mips already used as well:
>>
>> Yes, however it is only used for CPUs, it does not appear in any
>> binding document, and no code actually matches against it.
>
> Do you intend to change those usages to =E2=80=9Cmti=E2=80=9D than?

I was not originally planning on it, but I could.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
