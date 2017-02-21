From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] media: dt-bindings: vpif: extend the example with an
 output port
Date: Tue, 21 Feb 2017 16:07:40 +0100
Message-ID: <CAMpxmJUKCjHJGyNAYM_y6kZnwf39O5-1FeiKbA3RUPMdth4J2w@mail.gmail.com>
References: <1487268237-4240-1-git-send-email-bgolaszewski@baylibre.com>
 <1487268237-4240-3-git-send-email-bgolaszewski@baylibre.com> <CAL_Jsq+f+H47iFNMZ5+2qG0n=6QDZOLPf2HtFH8SLD77Dq1e7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+f+H47iFNMZ5+2qG0n=6QDZOLPf2HtFH8SLD77Dq1e7A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Patrick Titiano <ptitiano-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-02-21 15:57 GMT+01:00 Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> On Thu, Feb 16, 2017 at 12:03 PM, Bartosz Golaszewski
> <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
>> This makes the example more or less correspond with the da850-evm
>> hardware setup.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>> ---
>>  .../devicetree/bindings/media/ti,da850-vpif.txt    | 36 +++++++++++++++++-----
>>  1 file changed, 29 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/ti,da850-vpif.txt b/Documentation/devicetree/bindings/media/ti,da850-vpif.txt
>> index 9c7510b..d6f93a1 100644
>> --- a/Documentation/devicetree/bindings/media/ti,da850-vpif.txt
>> +++ b/Documentation/devicetree/bindings/media/ti,da850-vpif.txt
>> @@ -16,7 +16,7 @@ Required properties:
>>  Video Capture:
>>
>>  VPIF has a 16-bit parallel bus input, supporting 2 8-bit channels or a
>> -single 16-bit channel.  It should contain at least one port child node
>> +single 16-bit channel. It should contain one or two port child nodes
>
> When do you not have an output? Seems kind of useless. I'm guessing
> this is an oversight in the binding and there should always be port 1
> and a connector node, so document it that way.
>

Sometimes the output pins are not hooked up to anything - for example
on the da850-lcdk board we only use input for camera capture, while on
da850-evm we have both composite and s-video outputs and inputs. I
think it makes sens to leave out the output port if we don't use it.

> This also needs to state what port 0 and port 1 are (i.e. input or
> output and type of data).
>

I'll fix that.

>>  with child 'endpoint' node. Please refer to the bindings defined in
>>  Documentation/devicetree/bindings/media/video-interfaces.txt.
>>
>> @@ -28,19 +28,26 @@ I2C-connected TVP5147 decoder:
>>                 reg = <0x217000 0x1000>;
>>                 interrupts = <92>;
>>
>> -               port {
>> -                       vpif_ch0: endpoint@0 {
>> +               port@0 {
>> +                       vpif_input_ch0: endpoint@0 {
>>                                 reg = <0>;
>>                                 bus-width = <8>;
>> -                               remote-endpoint = <&composite>;
>> +                               remote-endpoint = <&composite_in>;
>>                         };
>>
>> -                       vpif_ch1: endpoint@1 {
>> +                       vpif_input_ch1: endpoint@1 {
>>                                 reg = <1>;
>>                                 bus-width = <8>;
>>                                 data-shift = <8>;
>>                         };
>>                 };
>> +
>> +               port@1 {
>> +                       vpif_output_ch0: endpoint {
>> +                               bus-width = <8>;
>
> Isn't this an analog input? bus-width doesn't make sense for that.
>

Not yet - the signals first go to a video DAC (adv7343 in the example).

Thanks,
Bartosz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
