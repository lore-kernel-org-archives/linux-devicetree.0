From: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: Associating nodes with phandles for pci devices
Date: Sun, 8 Mar 2015 20:40:12 -0700
Message-ID: <CAGVrzcYF266X-mUsfPtAr_jjJ3JW-TTHrKkznsnCCfrCzuf+qw@mail.gmail.com>
References: <9bcf67ede60f4567a396c05578cfceb7@svr-chch-ex1.atlnz.lc>
 <54C2CDE6.8090400@openwrt.org> <54FCC6AC.4030202@alliedtelesis.co.nz>
 <4974230.GyVpHqdJU9@wuerfel> <54FCD53D.7080700@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54FCD53D.7080700-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2015-03-08 16:03 GMT-07:00 Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>:
>
>
> On 03/09/2015 11:42 AM, Arnd Bergmann wrote:
>> On Sunday 08 March 2015 22:01:17 Chris Packham wrote:
>>>
>>>>
>>>> BTW, one thing that is high in my TODO list regarding DSA is to stop
>>>> using this platform device/driver architecture and use the actual device
>>>> driver model. Your switch driver entry point would be a pci_drive
>>>> probe's function where you end-up registering a switch the DSA. This
>>>> should solve portions of your problem although this is a long shot as we
>>>> need to convert existing drivers as well.
>>>>
>>>
>>> My current problem is that of_find_device_by_node() (called by
>>> dsa_of_probe) can't find the device. After a bit of debugging I can see
>>> that the populated platform bus only goes as far as
>>> /soc/pcie-controller, anything beyond that seems to be missing. I can't
>>> see anything obvious in of_platform_bus_create() that would actually
>>> stop it from continuing down the pcie-controller branch provided the dts
>>> actually enumerates the children.
>>>
>>> Any suggestions?
>>
>> The PCI devices are not populated by of_platform_bus_create. Instead,
>> pci_scan_device() calls pci_set_of_node() to set the of_node
>> pointer for each PCI device.
>>
>> This would fail for instance if the root bus does not have a correct
>> of_node pointer.
>>
>
> Hmm. I instrumented pci_set_of_node and I do see my 2 network devices.
>
> devfn = 00000000
> of_node = bfff3f90 /soc/pcie-controller/pcie@1,0/tg3@01,0
>
> devfn = 00000001
> of_node = bfff4118 /soc/pcie-controller/pcie@1,0/tg3@01,1
>
> So at least that's happening. I guess the problem is that ultimately
> they are devices on the pci bus as opposed to the platform bus and
> of_find_device_by_node() only looks at the platform bus
>
> dev = bus_find_device(&platform_bus_type, NULL, np, of_dev_node_match);
>
> What I might have to do for now is get the DSA driver code to go looking
> on the pci bus if of_find_device_by_node() fails to find the named node.

Could you try these two patches:
https://github.com/ffainelli/linux/commit/f57b2891e6118f5769c9fe17ed07e32def4c7c74
https://github.com/ffainelli/linux/commit/1ccd7b38dddd667a6ef6afe1cc3e9bb8c5599b58

> Florian mentioned making the DSA code use the device driver model which
> would help me but I'm kinda stuck with the kernel version I'm using for
> now at least.

Right, this is still taking a bit more time than I expected, but the
two patches above remove the restriction for the network device to be
backed by a platform_device, so hopefully that can get you going. I
will CC you on the next round of patches so you can keep track of that
progress.
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
