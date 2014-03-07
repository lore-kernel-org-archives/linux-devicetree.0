From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: mvebu: add Device Tree for the Armada 385 RD board
Date: Fri, 07 Mar 2014 10:53:42 +0100
Message-ID: <53199726.4080300@free-electrons.com>
References: <1394107868-26094-1-git-send-email-gregory.clement@free-electrons.com> <20140306131429.GJ4780@lunn.ch> <5318779C.8030901@free-electrons.com> <20140306142117.GL4780@lunn.ch> <531886B4.2070002@free-electrons.com> <20140306144600.GM4780@lunn.ch> <53188B73.4000109@free-electrons.com> <53189892.5090502@free-electrons.com> <20140306160213.GA4327@arch.cereza> <20140306172339.GP4780@lunn.ch> <20140306191747.GA32655@arch.cereza>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140306191747.GA32655-nAQHv47ARr+vIlHkl8J1cg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/03/2014 20:17, Ezequiel Garcia wrote:
> On Mar 06, Andrew Lunn wrote:
>>> Can't we fix this so the probe order doesn't affect the name?
>>>
>>> Is that sane?
>>
>> You are not supposed to trust the device name, since probing can
>> happen in parallel, on different buses. udev should have rules to name
>> the interfaces based on the MAC address. On my Debian system i have:
>>
>> /etc/udev/rules.d/70-persistent-net.rules
>>
>> So what is important is that the MAC addresses are assigned correctly
>> to the device. And DT does that based on MMIO address, so should be
>> reliable, independent of probe order.
>>

I was aware of this solution, and indeed for the end user it is the thing
to do.

However my concern was more about the people testing the kernel early or for
people bringing up a new board. I fear that we will have many false bug report
about it.

For the second category, I think we should at least point this in the dtsi.


Thanks,

Gregory


> 
> Right, makes perfect sense!
> 
> So we can just keep the nodes address-ordered, without caring about the name?
> 




-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
