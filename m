From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iio: adc: Add Renesas GyroADC driver
Date: Fri, 30 Dec 2016 22:49:37 +0100
Message-ID: <84a65f76-b82a-030b-a527-ee23d9ad25a8@gmail.com>
References: <20161230191800.2532-1-marek.vasut@gmail.com>
 <alpine.DEB.2.02.1612302027480.3977@pmeerw.net>
 <442f8085-110c-659d-d097-add788b8f291@gmail.com>
 <alpine.DEB.2.02.1612302205210.3977@pmeerw.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1612302205210.3977-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/30/2016 10:09 PM, Peter Meerwald-Stadler wrote:
> 
>>>> Add IIO driver for the Renesas RCar GyroADC block. This block is a
>>>> simple 4/8-channel ADC which samples 12/15/24 bits of data every
> 
>>>> +		if (iio_buffer_enabled(indio_dev))
>>>> +			return -EBUSY;
>>>
>>> use iio_device_claim_direct_mode()
>>
>> Why ? Do I really need the mutex locking here ?
> 
> no, not needed, since you do not support buffered mode yet; but neither do 
> you need iio_buffer_enabled() 
> 
> p.
> 

So drop the whole thing then ?

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
