From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 6/7] ARM: mvebu: add PHY support to the dts for the
 USB controllers on Armada 375
Date: Wed, 26 Nov 2014 10:53:51 +0530
Message-ID: <547563E7.7080106@ti.com>
References: <1415879269-29711-1-git-send-email-gregory.clement@free-electrons.com> <1415879269-29711-7-git-send-email-gregory.clement@free-electrons.com> <20141122020811.GO22670@titan.lakedaemon.net> <5470556B.6080608@free-electrons.com> <20141126035929.GJ22670@titan.lakedaemon.net> <54756164.3070206@ti.com> <20141126051701.GU22670@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141126051701.GU22670-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Wednesday 26 November 2014 10:47 AM, Jason Cooper wrote:
> On Wed, Nov 26, 2014 at 10:43:08AM +0530, Kishon Vijay Abraham I wrote:
>> Hi,
>>
>> On Wednesday 26 November 2014 09:29 AM, Jason Cooper wrote:
>>> On Sat, Nov 22, 2014 at 10:20:43AM +0100, Gregory CLEMENT wrote:
>>>> Hi Jason,
>>>>
>>>> On 22/11/2014 03:08, Jason Cooper wrote:
>>>>> On Thu, Nov 13, 2014 at 12:47:48PM +0100, Gregory CLEMENT wrote:
>>>>>> Now that the USB cluster node has been added, use it as a PHY provider
>>>>>> for the USB controller linked to it: the first EHCI and the xHCI.
>>>>>>
>>>>>> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>
>> Looks like I'm not cc'ed in v4 of this patch series :-(
> 
> I've bounced emails maybe three times in my life.  Thought it might work
> here.  Did it?

Actually I'm CC'ed, just that search didn't find it. Sorry for the noise.

Thanks
Kishon
> 
> thx,
> 
> Jason.
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
