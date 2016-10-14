From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2 1/4] iio: dac: mcp4725: use regulator framework
Date: Fri, 14 Oct 2016 14:06:41 +0200
Message-ID: <0a93d4bf-5431-6603-b72b-3aa39bacfce0@metafoo.de>
References: <1476194263-12015-1-git-send-email-tomas@novotny.cz>
 <1476194263-12015-2-git-send-email-tomas@novotny.cz>
 <87088906-8986-cca0-c29a-747610bae982@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87088906-8986-cca0-c29a-747610bae982-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yong Li <sdliyong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/14/2016 01:58 PM, Lars-Peter Clausen wrote:
> On 10/11/2016 03:57 PM, Tomas Novotny wrote:
> 
> Hi,
> 
> Looks mostly good. One small thing that should be addressed.
> 
>> diff --git a/include/linux/iio/dac/mcp4725.h b/include/linux/iio/dac/mcp4725.h
>> index 91530e6..7c062e8 100644
>> --- a/include/linux/iio/dac/mcp4725.h
>> +++ b/include/linux/iio/dac/mcp4725.h
>> @@ -10,7 +10,6 @@
>>  #define IIO_DAC_MCP4725_H_
>>  
>>  struct mcp4725_platform_data {
>> -	u16 vref_mv;
>>  };
> 
> Might as well remove the whole struct and file and drop the if (!pdata)
> check in the driver probe function. Having to declare a empty platform_data
> for the driver to work is not that sensible.

Ok, I see, new fields are added in the next commit. So ignore this.
