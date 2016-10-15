From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/4] iio: dac: mcp4725: use regulator framework
Date: Sat, 15 Oct 2016 15:00:12 +0100
Message-ID: <4b18c4a1-5791-f326-3ae3-2710afe1cfd6@kernel.org>
References: <1476194263-12015-1-git-send-email-tomas@novotny.cz>
 <1476194263-12015-2-git-send-email-tomas@novotny.cz>
 <87088906-8986-cca0-c29a-747610bae982@metafoo.de>
 <20161014142423.005b3108@tomas>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161014142423.005b3108@tomas>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yong Li <sdliyong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 14/10/16 13:24, Tomas Novotny wrote:
> Hi,
> 
> On Fri, 14 Oct 2016 13:58:24 +0200
> Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org> wrote:
> 
>> On 10/11/2016 03:57 PM, Tomas Novotny wrote:
>>
>> Hi,
>>
>> Looks mostly good. One small thing that should be addressed.
>>
>>> diff --git a/include/linux/iio/dac/mcp4725.h
>>> b/include/linux/iio/dac/mcp4725.h index 91530e6..7c062e8 100644
>>> --- a/include/linux/iio/dac/mcp4725.h
>>> +++ b/include/linux/iio/dac/mcp4725.h
>>> @@ -10,7 +10,6 @@
>>>  #define IIO_DAC_MCP4725_H_
>>>  
>>>  struct mcp4725_platform_data {
>>> -	u16 vref_mv;
>>>  };
>>
>> Might as well remove the whole struct and file and drop the if (!pdata)
>> check in the driver probe function. Having to declare a empty platform_data
>> for the driver to work is not that sensible.
> 
> Yes, I was thinking of it but I left the empty structure in the driver
> finally (I briefly comment it also in the commit message of this patch). The
> reason is that the structure is used again in the next commit. So removing
> the file and associated checks and putting it back again would make
> unnecessary noise in the patches. Anyway, if you think that it is really
> needed I will do it.
It's fine.

Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan
> 
> Thanks,
> 
> Tomas
> 
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
