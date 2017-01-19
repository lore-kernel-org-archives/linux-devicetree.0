From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/8] ARM: dts: Switch to new DSA binding
Date: Thu, 19 Jan 2017 14:49:23 -0800
Message-ID: <f164986c-4d72-5c50-ded7-5492b7c98be2@gmail.com>
References: <20170117182224.32212-1-f.fainelli@gmail.com>
 <633afd2c-75e4-adeb-f3a0-b59b5f47f1a7@gmail.com>
 <878tq67jjy.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <878tq67jjy.fsf-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/19/2017 02:48 PM, Gregory CLEMENT wrote:
> Hi Florian,
>  
>  On jeu., janv. 19 2017, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>> On 01/17/2017 10:22 AM, Florian Fainelli wrote:
>>> Hi all,
>>>
>>> This patch series converts the in-tree users to utilize the new (relatively)
>>> DSA binding that was introduced with commit 8c5ad1d6179d ("net: dsa: Document
>>> new binding"). The legacy binding node is kept included, but is marked
>>> disabled.
>>>
>>> Changes in v3:
>>>
>>> - collected tags from Andrew and Russell
>>> - added missing change to arch/arm/boot/dts/kirkwood-rd88f6281-a.dts
>>>
>>> Changes in v2:
>>>
>>> - patch 1: Use an hexadecimal reg property
>>> - patch 2: fixed the subject
>>> - patch 3: s/okay/disabled/ for the legacy DSA node
>>> - patches 7/8: fixed a stray whitespace
>>>
>>> In about 2-3 releases we may consider removing the old DSA binding entirely
>>> from the kernel.
>>
>> Gregory, all patches have been reviewed/tested now, can you take this
>> for an upcoming 4.11 pull request? Thanks!
> 
> 
> All the series applied on mvebu/dt

Awesome, merci !
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
