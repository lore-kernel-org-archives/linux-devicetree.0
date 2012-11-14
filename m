From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 1/3] leds: leds-pwm: Convert to use devm_get_pwm
Date: Wed, 14 Nov 2012 08:13:09 +0100
Message-ID: <50A34485.1080803@ti.com>
References: <1352731270-27534-1-git-send-email-peter.ujfalusi@ti.com>
 <1352731270-27534-2-git-send-email-peter.ujfalusi@ti.com>
 <CAK5ve-JDCSSOKHQG-F1RoDii62=-DiPevaD6SafndYVvOgB6Fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAK5ve-JDCSSOKHQG-F1RoDii62=-DiPevaD6SafndYVvOgB6Fw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Bryan,

On 11/14/2012 02:14 AM, Bryan Wu wrote:
>> diff --git a/include/linux/leds_pwm.h b/include/linux/leds_pwm.h
>> index 33a0711..a65e964 100644
>> --- a/include/linux/leds_pwm.h
>> +++ b/include/linux/leds_pwm.h
>> @@ -7,7 +7,7 @@
>>  struct led_pwm {
>>         const char      *name;
>>         const char      *default_trigger;
>> -       unsigned        pwm_id;
>> +       unsigned        pwm_id __deprecated;
> =

> I suggest we remove this later, we can provide patches from this from
> platform data of board file. And I think this patch is good for me to
> merge, will do it soon.

Yes, we can remove it in 3.9. I marked it as deprecated for now to avoid
breakage - if any - in 3.8.

Thank you,
P=E9ter
