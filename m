From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv8 2/2] mailbox: Introduce framework for mailbox
Date: Thu, 17 Jul 2014 12:55:41 +0530
Message-ID: <CAJe_Zhdj_AyTi+b28k4etF3+eqObdfwSv5FhBZv+YyD6CTfmMA@mail.gmail.com>
References: <1405071167-14503-1-git-send-email-jaswinder.singh@linaro.org>
	<5461658.P0nNPHkj0L@wuerfel>
	<CAJe_Zhdtzhv=1QfhCAu6G_nq0VqW9v6TvgHSJe9VmgJQwo0U3Q@mail.gmail.com>
	<5214160.a78RDYzY5T@wuerfel>
	<CAJe_Zhf8oH-MPg6HtFDoT6_LZxJzy3ff85-GsWcENQftNiJMxw@mail.gmail.com>
	<53C6A3CB.5060005@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53C6A3CB.5060005-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org" <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, "mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org" <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, "lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "loic.pallardy-qxv4g6HH51o@public.gmane.org" <loic.pallardy-qxv4g6HH51o@public.gmane.org>, "ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "bjorn-UYDU3/A3LUY@public.gmane.org" <bjorn-UYDU3/A3LUY@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Mollie.Wu-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org" <Mollie.Wu-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, t.takinishi-+CUm20s59eoOaC0ocwlmew@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 16 July 2014 21:39, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org> wrote:
> Hi,
>
> On 07/16/2014 09:18 AM, Jassi Brar wrote:
>> On 16 July 2014 19:38, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>>> On Wednesday 16 July 2014 18:42:22 Jassi Brar wrote:
>>>> On 16 July 2014 18:39, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>>>>> On Wednesday 16 July 2014 18:35:33 Jassi Brar wrote:
>>>>>> On 16 July 2014 18:15, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>>>>>>> On Wednesday 16 July 2014 18:07:04 Jassi Brar wrote:
>>>>>>>> On 16 July 2014 15:46, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>>>>>>>>> On Wednesday 16 July 2014 10:40:19 Sudeep Holla wrote:
>>>>>>>>>>> +
>>>>>>>>>>> +Required property:
>>>>>>>>>>> +- mbox: List of phandle and mailbox channel specifier.
>>>>>>>>>>> +
>>>>>>>>>>> +- mbox-names: List of identifier strings for each mailbox channel
>>>>>>>>>>> +               required by the client.
>>>>>>>>>>> +
>>>>>>>>>>
>>>>>>>>>> IMO the mailbox names are more associated with the controller channels/
>>>>>>>>>> mailbox rather than the clients using it. Does it make sense to move
>>>>>>>>>> this under controller. It also avoid each client replicating the names.
>>>>>>>>>
>>>>>>>>> I think it would be best to just make the mbox-names property optional,
>>>>>>>>> like we have for other subsystems.
>>>>>>>>>
>>>>>>>> A very similar subsystem - DMAEngine also has 'dma-names' as a
>>>>>>>> required property.
>>>>>>>>
>>>>>>>> If a client is assigned only 1 mbox in DT, we can do without
>>>>>>>> mbox-names. But I am not sure what to do if a client needs two or more
>>>>>>>> differently capable mboxes? Simply allocating in order of mbox request
>>>>>>>> doesn't seem very robust.
>>>>>>>
>>>>>>> Traditionally, these things (regs, interrupts, ...) are just accessed
>>>>>>> by index. The reason why dmaengine requires the name is that some machines
>>>>>>> can use multiple DMA engine devices attached to the same request line,
>>>>>>> so the dmaengine subsystem can pick any of them that has a matching
>>>>>>> name.
>>>>>> And also, I think, when a client needs 2 different dma channels, say
>>>>>> for RX and TX each. The api can't assign the first channel specified
>>>>>> in 'dmas' property to the first channel request that comes to it,
>>>>>> unless we assume client driver always requests dma channels in the
>>>>>> order written in its DT node.  And this is the main reason I see for
>>>>>> having mbox-names property.
>>>>>
>>>>> Most subsystems require passing an explicit index in this case.
>>>>>
>>>>>>   If we make mbox-names optional, do we assume client driver must
>>>>>> request mbox in the order specified in its DT node?
>>>>>
>>>>> Correct.
>>>>>
>>>> OK. So how about we drop mbox-names altogether and expect client
>>>> driver to simply provide an index of the mbox needed?
>>>
>>> That would be fine with me, but I think a lot of people like
>>> the idea of identifying things by name, and are used to that
>>> from the other subsystems.
>>>
>>> Maybe you can leave the mbox-names property defined as 'optional'
>>> in the generic mbox binding but remove the code in Linux? That way
>>> we can always put it back at a later point without changing the
>>> binding in an incompatible way.
>
> I like this too, especially given that the framework uses this only to
> retrieve the index. The mbox_client structure currently requires the
> chan_name to be filled in, which means both the client driver and the
> framework end up having to parse the property.
>
Yeah let us discourage the use of mbox-names.

> While we are at this, how about we change the property name from "mbox"
> to a plural-form "mboxes" to be inline with gpios, dmas etc.
>
OK, will change mbox to mboxes.

-jassi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
