From: boris brezillon <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 7/8] ASoC: atmel: document clock properties of the wm8904
 driver
Date: Mon, 17 Mar 2014 11:18:08 +0100
Message-ID: <5326CBE0.1000309@overkiz.com>
References: <1395049541-28128-1-git-send-email-voice.shen@atmel.com> <1395049541-28128-8-git-send-email-voice.shen@atmel.com> <20140317100219.GB8070@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140317100219.GB8070-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org" <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Mark,

Le 17/03/2014 11:02, Mark Rutland a =E9crit :
> On Mon, Mar 17, 2014 at 09:45:40AM +0000, Bo Shen wrote:
>> From: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
>>
>> Signed-off-by: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>> ---
>>
>>   Documentation/devicetree/bindings/sound/atmel-wm8904.txt | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/atmel-wm8904.tx=
t b/Documentation/devicetree/bindings/sound/atmel-wm8904.txt
>> index 8bbe50c..aca341c 100644
>> --- a/Documentation/devicetree/bindings/sound/atmel-wm8904.txt
>> +++ b/Documentation/devicetree/bindings/sound/atmel-wm8904.txt
>> @@ -3,6 +3,8 @@ Atmel ASoC driver with wm8904 audio codec complex
>>   Required properties:
>>     - compatible: "atmel,asoc-wm8904"
>>     - atmel,model: The user-visible name of this sound complex.
>> +  - clocks: A list of clocks needed by the wm8904 chip.
>> +  - clock-output-names: Driver related clock names. Shall contain "=
pck0".
> The word "driver"  doesn't need to appear in biding documents, and th=
is
> fails to describe what it sets out to. How about the following:
>
> - clocks: a list of phandle + clock-specifier pairs, one for each ent=
ry
>    in clock-names.
Agreed.
> - clock-names: Should contain "pck0"
After thinking a bit more about it, this can be any programmable clk (p=
ckX).

I'll fix it.

Thanks.

Best Regards,

Boris

>
> Thanks,
> Mark.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
