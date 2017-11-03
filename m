From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 2/3] hwmon: (aspeed-pwm-tacho) Deassert reset in probe
Date: Fri, 3 Nov 2017 03:11:03 -0700
Message-ID: <900c6a0b-b7e3-a317-76fd-7694e971944f@roeck-us.net>
References: <20171102035349.1902-1-joel@jms.id.au>
 <20171102035349.1902-3-joel@jms.id.au> <20171102145406.GA9240@roeck-us.net>
 <CACPK8Xc3Hsj9TD8L2A6e-iCMZp5=HG9aan5m0YsWV-CZHFPo5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACPK8Xc3Hsj9TD8L2A6e-iCMZp5=HG9aan5m0YsWV-CZHFPo5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mykola Kostenok <c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Jaghathiswari Rankappagounder Natarajan <jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/02/2017 07:32 PM, Joel Stanley wrote:
> On Fri, Nov 3, 2017 at 1:54 AM, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
>> On Thu, Nov 02, 2017 at 02:53:48PM +1100, Joel Stanley wrote:
>>> The ASPEED SoC must deassert a reset in order to use the PWM/tach
>>> peripheral.
>>>
>> Again, you claim that the current driver would not work at all, which
>> is simply not correct. It doesn't work if the chip wasn't taken out
>> of reset by other means. This doesn't take into account situations and
>> hardware where the chip is taken out of reset automatically at boot, h
>> or by the ROM monitor/BIOS. It assumes that the reset pin can _always_
>> be controlled by software.
> 
> The reset is internal to the SoC. There is no pin to speak of, just a
> wire inside the SoC, so it can always be controlled by software.
> 
> There's SoC does not release any resets automatically; the default
> value on boot is for the reset to be asserted and this is not
> configurable.
> 
>> Similar, it forces the chip into reset when the driver is removed,
>> which is even worse. Unload the driver, and no more fan control ?
>> Really ? Then why is there an autonomous chip for fan control
>> to start with ? This is questionable even if the reset pin is
>> optional.
> 
> Similarly, the PWM/Tach unit is inside the SoC; it's not an external device.
> 
> It would be strange to remove the driver and expect the system to keep
> operating normally.
> 
>> You'll have to make reset handling optional for me to accept it.
>> I am quite sure that I said that before.
> 
> Please reconsider in light of the details above. It does not make any
> sense to build a system without this reset.
> 

So you are saying that this driver never worked ? Hard to believe.
I'll need input from other users.

Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
