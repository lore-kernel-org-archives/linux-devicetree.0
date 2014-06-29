From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] staging: iio: hmc5843: Add all available models to
 device tree id table.
Date: Sun, 29 Jun 2014 11:57:24 +0100
Message-ID: <53AFF114.4050905@kernel.org>
References: <1392387929-31491-1-git-send-email-marek@goldelico.com>	<530338B2.603@kernel.org>	<CAAfyv36ZdwpoGsARQKRfvX4EeanZVVus5A444KSE8LOmePhyig@mail.gmail.com> <CAAfyv34-gTwWU-QZmFFFXnwNeWNjxObVrFkaxN2CNSNuuo_EqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAfyv34-gTwWU-QZmFFFXnwNeWNjxObVrFkaxN2CNSNuuo_EqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, "Dr. H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 27/06/14 21:48, Belisko Marek wrote:
> PIng? Jonathan do you have any objections to this approach? Can you
> please pick it? Thx.
Sorry, this one dropped through the cracks.

Applied to the togreg branch of iio.git along with the documentation patch that
goes with it.

Jonathan
>
> On Tue, Feb 18, 2014 at 9:35 PM, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi Jonathan,
>>
>> On Tue, Feb 18, 2014 at 11:40 AM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> On 14/02/14 14:25, Marek Belisko wrote:
>>>>
>>>> Signed-off-by: Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
>>>
>>> I wonder how this got missed.  However, for those data elements to be
>>> useful, you will
>>> need to read them somewhere in the driver I think.... (if there is any magic
>>> that puts this in the relevant i2c locations then point it out to me!)
>> There is a table called hmc5843_chip_info_tbl which contains entries
>> for all models
>> which this driver can handle. And magic is that correct model variant
>> is set probe function:
>> line: idata->variant = &hmc5843_chip_info_tbl[id->driver_data];
>> (id->driver_data contains model value).
>>>
>>>> ---
>>>>    drivers/staging/iio/magnetometer/hmc5843.c | 4 +++-
>>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/staging/iio/magnetometer/hmc5843.c
>>>> b/drivers/staging/iio/magnetometer/hmc5843.c
>>>> index d4f4dd9..f595fdc 100644
>>>> --- a/drivers/staging/iio/magnetometer/hmc5843.c
>>>> +++ b/drivers/staging/iio/magnetometer/hmc5843.c
>>>> @@ -630,7 +630,9 @@ static const struct i2c_device_id hmc5843_id[] = {
>>>>    MODULE_DEVICE_TABLE(i2c, hmc5843_id);
>>>>
>>>>    static const struct of_device_id hmc5843_of_match[] = {
>>>> -       { .compatible = "honeywell,hmc5843" },
>>>> +       { .compatible = "honeywell,hmc5843", .data = (void *)HMC5843_ID },
>>>> +       { .compatible = "honeywell,hmc5883", .data = (void *)HMC5883_ID },
>>>> +       { .compatible = "honeywell,hmc5883l", .data = (void *)HMC5883L_ID
>>>> },
>>>>          {}
>>>>    };
>>>>    MODULE_DEVICE_TABLE(of, hmc5843_of_match);
>>>>
>>>
>>
>> BR,
>>
>> marek
>>
>> --
>> as simple and primitive as possible
>> -------------------------------------------------
>> Marek Belisko - OPEN-NANDRA
>> Freelance Developer
>>
>> Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
>> Tel: +421 915 052 184
>> skype: marekwhite
>> twitter: #opennandra
>> web: http://open-nandra.com
>
> BR,
>
> marek
>
