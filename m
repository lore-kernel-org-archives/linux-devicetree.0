From: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 19/23] drivers/fsi: Add GPIO based FSI master
Date: Thu, 11 May 2017 11:14:13 -0500
Message-ID: <f3b94de2-9dee-3c5c-f5d4-579824abb0d0@linux.vnet.ibm.com>
References: <20170410194706.64280-1-cbostic@linux.vnet.ibm.com>
 <20170410194706.64280-20-cbostic@linux.vnet.ibm.com>
 <CACPK8Xf1Y31+HBHb0ErpnZ4xVM+bzfHV-khj-kz8Unk1cTx6gw@mail.gmail.com>
 <c05599db-7767-e712-7199-7d5a4ac6486f@linux.vnet.ibm.com>
 <a079022b-8434-a204-c9b4-696a0580fc8c@ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a079022b-8434-a204-c9b4-696a0580fc8c-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "Edward A . James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 5/10/17 8:58 PM, Jeremy Kerr wrote:
> Hi Chris,
>
>> I don't think we'd want this per master.   The lock is for the 'top'
>> master issuing commands.  Only the top master can initiate any
>> transactions on the bus to any devices connected downstream. Downstream
>> masters such as hub masters, etc... cannot initiate a command.
> I think what Joel meant there was that we have it per *GPIO* master; if
> there are two GPIO masters on a system, there's no need to provide
> mutual exclusion to each (separate) set of GPIOs.
>
> To implement this, we'd just move the lock into struct fsi_master_gpio.

Hi Jeremy,

Understand now -will make the change.

Thanks
-Chris

> Cheers,
>
>
> Jeremy
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
