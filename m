From: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 18/23] drivers/fsi: Document FSI master sysfs files in
 ABI
Date: Wed, 10 May 2017 13:20:49 -0500
Message-ID: <e3aa64b3-20b7-8de8-7f30-1cf1a7a3755d@linux.vnet.ibm.com>
References: <20170410194706.64280-1-cbostic@linux.vnet.ibm.com>
 <20170410194706.64280-19-cbostic@linux.vnet.ibm.com>
 <CACPK8Xc4kv1Y_82ShYAfNjzf480Ab1ws95QSxPT8VE2XF+nueA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACPK8Xc4kv1Y_82ShYAfNjzf480Ab1ws95QSxPT8VE2XF+nueA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 5/10/17 2:30 AM, Joel Stanley wrote:
> On Tue, Apr 11, 2017 at 5:17 AM, Christopher Bostic
> <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> wrote:
>> From: Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
>>
>> Add info for sysfs scan file in Documentaiton ABI/testing
> You are missing documentation for the 'raw', 'term' and 'break' files.

Hi Joel,

Yes, I've made your suggested changes in my pending release version 7 
patch set.

>> Signed-off-by: Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
>> ---
>>   Documentation/ABI/testing/sysfs-bus-fsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-fsi
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-fsi b/Documentation/ABI/testing/sysfs-bus-fsi
>> new file mode 100644
>> index 0000000..dfcbc1b
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-fsi
>> @@ -0,0 +1,6 @@
>> +What:           /sys/bus/platform/devices/fsi-master/scan
> This has been renamed 'rescan' in this series. The path has changed too.
>
>> +KernelVersion:  4.9
> This should be 4.12 I guess, assuming we get it merged this cycle.

Will update.

Thanks
-Chris
>
>> +Contact:        cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org
>> +Description:
>> +                Initiates a FSI master scan for all connected
>> +                slave devices on its links.
>> --
>> 1.8.2.2
>>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
