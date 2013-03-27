From: Nobuhiro Iwamatsu <iwamatsu-+mkmVskJBflAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 1/1] iio: exynos-adc: Fix typo in DT documentation
Date: Wed, 27 Mar 2013 09:19:44 +0900
Message-ID: <CABMQnVLnj3CphEuAo_JVesNkT3VNZkhKy_J1URhooxw5zs0Otg@mail.gmail.com>
References: <1364298777-8178-1-git-send-email-sachin.kamat@linaro.org> <CAHfPSqCyn=Q_zH11=pRjP3rY69xbHDnRSwBmiA4fGmz62hV-Vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHfPSqCyn=Q_zH11=pRjP3rY69xbHDnRSwBmiA4fGmz62hV-Vg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 27, 2013 at 8:55 AM, Naveen Krishna Ch
<naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 26 March 2013 04:52, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> Fixes some typos in the documentation of exynos-adc.txt.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  .../devicetree/bindings/arm/samsung/exynos-adc.txt |    4 ++--
>>  1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
>> index 05e9d95..1fc744b 100644
>> --- a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
>> +++ b/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
>> @@ -1,6 +1,6 @@
>>  Samsung Exynos Analog to Digital Converter bindings
>>
>> -This devicetree binding are for the new adc driver written fori
>> +The devicetree bindings are for the new ADC driver written for
> Thanks for the correction
>>  Exynos4 and upward SoCs from Samsung.
>>
>>  New driver handles the following
>> @@ -49,4 +49,4 @@ adc@12D10000 {
>>  };
>>
>>  Note: Does not apply to ADC driver under arch/arm/plat-samsung/
>> -Note: The child node can be added under the adc node or seperately.
>> +Note: The child node can be added under the adc node or separately.
> Sorry, but i cant see whats the difference here.

This changed from sep*e*rately to sep*a*rately.
