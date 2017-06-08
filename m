From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 16/24] drivers/fsi: Add tracepoints for low-level
 operations
Date: Thu, 8 Jun 2017 10:06:16 +0800
Message-ID: <4441a1ba-e66e-368a-cc07-8e3859dc8c13@ozlabs.org>
References: <20170606210859.80431-1-cbostic@linux.vnet.ibm.com>
 <20170606210859.80431-17-cbostic@linux.vnet.ibm.com>
 <20170607151610.52f7bc88@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170607151610.52f7bc88-f9ZlEuEWxVcJvu8Pb33WZ0EMvNT87kid@public.gmane.org>
Content-Language: en-AU
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Steven,

Thanks for checking this out.

>> +TRACE_EVENT(fsi_master_write,
>> +	TP_PROTO(const struct fsi_master *master, int link, int id,
>> +			uint32_t addr, size_t size, const void *data),
>> +	TP_ARGS(master, link, id, addr, size, data),
>> +	TP_STRUCT__entry(
>> +		__field(int,	master_idx)
>> +		__field(int,	link)
>> +		__field(int,	id)
>> +		__field(__u32,	addr)
>> +		__field(size_t,	size)
>> +		__field(__u32,	data)
>> +	),
>> +	TP_fast_assign(
>> +		__entry->master_idx = master->idx;
>> +		__entry->link = link;
>> +		__entry->id = id;
>> +		__entry->addr = addr;
>> +		__entry->size = size;
>> +		__entry->data = 0;
>> +		memcpy(&__entry->data, data, size);
> 
> 
> Um, can size ever be greater than 4? If so, this is a bug.

No, size will only ever be 1, 2, or 4, as they're the only valid FSI bus
transactions. Hence storing ->data as a u32 to keep things simple.

> I think you may want to use a dynamic array here.
> 
> 	TP_STRUCT__entry(
> 		[..]
> 		__dynamic_array(char, data, size)
> 	[..]
> 
> 	TP_fast_assign(
> 		[..]
> 		memcpy(__get_dynamic_array(data), data, size);
> 	[..]
> 
> 	TP_printk(...
> 		[..]
> 		__entry->size,
> 		__get_dynamic_array(data)
> 
> You may also want to look at __print_array() too.

The %ph specifier seems to do a decent job though...

Cheers,


Jeremy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
