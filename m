From: Jae Hyun Yoo <jae.hyun.yoo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH linux dev-4.10 3/6] drivers/misc: Add driver for Aspeed
 PECI and generic PECI headers
Date: Thu, 11 Jan 2018 12:42:57 -0800
Message-ID: <7a038bd0-b2e0-2261-deea-f37a3e1810ba@linux.intel.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180109223126.13093-4-jae.hyun.yoo@linux.intel.com>
 <1515661583.31850.34.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515661583.31850.34.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 1/11/2018 1:06 AM, Benjamin Herrenschmidt wrote:
> On Tue, 2018-01-09 at 14:31 -0800, Jae Hyun Yoo wrote:
>> +struct peci_rd_ia_msr_msg {
>> +       unsigned char target;
>> +       unsigned char thread_id;
>> +       unsigned short address;
>> +       unsigned long value;
>> +};
> 
> Those types are representing messages on the wire ?
> 
> In that case those types aren't suitable. For example "long" will have
> a different size and alignment for 32 and 64-bit userspace. There are
> size-explicit userspace types available.
> 
> Also I didn't see any endianness annotations in there. Is that expected
> ? IE are those wire format packets ?
> 
> Cheers,
> Ben.
> 

Only the 'peci_xfer_msg' struct is representing messages on the wire. 
All userspace messages which is using other struct definitions will be 
copied into the 'peci_xfer_msg' for each member variable in driver, but 
anyway, type definitions of each member variable should be fixed as you 
said. Will fix it.

Thanks,
Jae
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
