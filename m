From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/8] ARM: dts: armada-388-clearfog: Utilize new DSA
 binding
Date: Wed, 4 Jan 2017 09:27:35 -0800
Message-ID: <5a40436a-ebad-8a94-c5c5-546ba33ba545@gmail.com>
References: <20170102022249.10657-1-f.fainelli@gmail.com>
 <20170102022249.10657-4-f.fainelli@gmail.com>
 <87shoyeo2j.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87shoyeo2j.fsf-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/04/2017 09:23 AM, Gregory CLEMENT wrote:
> Hi Florian,
>  
>  On lun., janv. 02 2017, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>> Utilize the new DSA binding, introduced with commit 8c5ad1d6179d ("net:
>> dsa: Document new binding"). The legacy binding node is kept included, but is
>> marked disabled.
>>
> 
> I tested this patch on mvebu/dt (I needed to reduce the context to apply
> the patch due to the changes made by Russell King on this file). I also
> set the status of the old binding to "disable" (instead of "okay").

Yes, that needs fixing, thanks for mentioning that.

> 
> It seems to work with the limited test did:
> ifconfig eth1 up
> udhcpc -i lan1
> iperf -c mylaptop
> 
> (same for lan4)
> 
> However is there a way to be sure that the new binding is used?

The best way is probably to make sure that your switch device appears
parented to the MDIO bus driver under /sys/class/mdio_bus/*mvmdio*.
Alternatively, if you see a message like:

DSA: switch 0 0 parsed

in your dmesg, that would also be indicative of using the new binding
and corresponding code.

Thanks a lot for trying that out!
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
