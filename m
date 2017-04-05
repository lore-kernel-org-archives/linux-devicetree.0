From: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 19/23] drivers/fsi: Add GPIO based FSI master
Date: Tue, 4 Apr 2017 20:24:33 -0500
Message-ID: <6fa53e69-924d-cd0f-9489-0f6ac6f5595e@linux.vnet.ibm.com>
References: <20170329174340.89109-1-cbostic@linux.vnet.ibm.com>
 <20170329174340.89109-20-cbostic@linux.vnet.ibm.com>
 <CACPK8XfOSYPidHF6=psC4mP-tkRyWTu0psdcK6EwA2E6FF53Uw@mail.gmail.com>
 <0e1bcf3a-e8d7-9f50-bdf7-2a1e7466665b@linux.vnet.ibm.com>
 <1490907014.3177.207.camel@kernel.crashing.org>
 <93b21624-11fc-b71b-aa78-6cb4371c87ae@linux.vnet.ibm.com>
 <1491344360.4166.68.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491344360.4166.68.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>, "Edward A . James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 4/4/17 5:19 PM, Benjamin Herrenschmidt wrote:
> On Tue, 2017-04-04 at 12:32 -0500, Christopher Bostic wrote:
>> Agreed that there is room for improvement.   I intend to look further
>> into your suggestions from here and our private conversation on the
>> matter and make changes as appropriate.  I have an open issue to track
>> this.  As it exists in this patch reads/writes from master to slave
>> fundamentally work.
> My understanding is they "seem to work if you get lucky with the timing
> and fall apart under load". Or did I hear wrong ?
>
>>   Given the pervasiveness and time to fully evaluate
>> and test any protocol updates I intend address this in the near future
>> with a separate follow on patch.
> Please try the simple change I proposed in my email. It's a 4 or 5
> lines change max to your clock_toggle function and how it's called in
> send and receive. It should be trivial to check if things still "seem
> to work" to begin with.
>
> Do you have some kind of test mechanism that hammers the FSI
> continuously ? Such as doing a series of putmemproc/getmemproc &
> checking the values ?
>
> Then you can run that while hammering the LPC bus and generally putting
> the BMC under load and you'll quickly see if it's reliable or not.

Hi Ben,

I do now have a mechanism that puts the bus under heavy load.  I'll look 
into your changes tomorrow.

Thanks,
Chris
>
> Cheers,
> Ben.
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
