From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] mfd: cros_ec_spi: Add compatible string for NI
 version of cros-ec-spi
Date: Wed, 28 Sep 2016 10:32:35 -0700
Message-ID: <CAAtXAHdd+WdcHzobkgwjMTi78ZnZ-wTA_0OB8LEpAdJEOsQ91w@mail.gmail.com>
References: <1475081961-3858-1-git-send-email-moritz.fischer@ettus.com>
 <1475081961-3858-3-git-send-email-moritz.fischer@ettus.com> <CAKdAkRRMbfJWeiEWWDUPemWS9f4rzSWX4T1sp+qD9_BDoU-Jdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKdAkRRMbfJWeiEWWDUPemWS9f4rzSWX4T1sp+qD9_BDoU-Jdg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio.lopez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jarkko Sakkinen <jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, moritz.fischer.private-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, julia-acOepvfBmUk@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dmitry,

On Wed, Sep 28, 2016 at 10:27 AM, Dmitry Torokhov
<dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Sep 28, 2016 at 9:59 AM, Moritz Fischer
> <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org> wrote:
>> Add compatible string for NI version of cros-ec-spi.
>>
>> Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/mfd/cros_ec_spi.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
>> index ebe9b94..e4504ec 100644
>> --- a/drivers/mfd/cros_ec_spi.c
>> +++ b/drivers/mfd/cros_ec_spi.c
>> @@ -708,6 +708,7 @@ static SIMPLE_DEV_PM_OPS(cros_ec_spi_pm_ops, cros_ec_spi_suspend,
>>                          cros_ec_spi_resume);
>>
>>  static const struct of_device_id cros_ec_spi_of_match[] = {
>> +       { .compatible = "ni,cros-ec-spi", },
>
> I am confused: if the 2 controllers are the same, why do we need the
> new compat string, at least in the driver? Shouldn't DTS simply use
> "google,cros-ec-spi", or maybe both (compatible = "ni,cros-ec-spi",
> "google,cros-ec-spi")?

It might deviate in the future, but you're right, the driver patch is
not required for now
since we can use the fallback mechanism until there really *is* a
difference. We can probably
drop this one for now.

Cheers,

Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
