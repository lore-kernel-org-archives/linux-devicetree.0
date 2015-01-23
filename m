From: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: Associating nodes with phandles for pci devices
Date: Fri, 23 Jan 2015 14:40:38 -0800
Message-ID: <54C2CDE6.8090400@openwrt.org>
References: <9bcf67ede60f4567a396c05578cfceb7@svr-chch-ex1.atlnz.lc> <2275507.PY4WZcxUrf@wuerfel> <alpine.DEB.2.10.1501240828280.14228@chrisp-dl.ws.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1501240828280.14228-VJzQ50X1/JKjhWACt5bsBotlCAj8ZROq@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <chrisp-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 23/01/15 11:38, Chris Packham wrote:
> 
> Hi Arnd,
> 
> Thanks for the quick response (and sorry for the horribly formatted
> message, travelling with only a webmail interface at the moment).
> 
> On Fri, 23 Jan 2015, Arnd Bergmann wrote:
> 
>> On Friday 23 January 2015 19:02:33 Chris Packham wrote:
>>> Hi,
>>>
>>> I'm working on a new board that has a marvell,dsa switch. Similar to
>>> the kirkwood-mv88f6281gtw-ge board. However the major difference is
>>> that instead of being connected to an integrated Ethernet port it is
>>> connected via a PCI-e Ethernet port (basically a NIC hardwired onto
>>> the board).
>>>
>>> Generally you don't need to define PCI devices in the .dts because
>>> the bus is scanned at run time and the method for identifying devices
>>> is well defined. But to satisfy the marvell,dsa binding[1] I need to
>>> tell it the Ethernet port it is connected to. The answer might be in
>>> the PCI bindings but the urls in the documentation[2] don't appear to
>>> be valid anymore.
>>>
>>> Is it possible to enumerate PCI devices in the .dts? Or is there a
>>> way of satisfying the dsa requirements without knowing the Ethernet
>>> device?
>>>
>>
>> In general, it is possible, and we do that on PowerPC, but it may be that
>> there are parts missing on ARM and you have to try it out.
>>
>> In particular, you need to know the address of the PCI device and then
>> create a device node that will be associated with the
>> pci_dev->dev.of_node
>> pointer.
> 
> Encouraging to know. I think I can figure out the relevant addresses for
> my device based on the run-time scan.

BTW, one thing that is high in my TODO list regarding DSA is to stop
using this platform device/driver architecture and use the actual device
driver model. Your switch driver entry point would be a pci_drive
probe's function where you end-up registering a switch the DSA. This
should solve portions of your problem although this is a long shot as we
need to convert existing drivers as well.

> 
> Can you think of a good example. I found a few ppc boards that have an
> PCI-ISA bridge that get's enumerated in the .dts. I think I can make sense
> of them but because they are bridges there's a lot of extra stuff for
> the down stream devices.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
