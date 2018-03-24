From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH] of_net: Implement of_get_nvmem_mac_address helper
Date: Sat, 24 Mar 2018 17:17:39 +0100
Message-ID: <cb12ea29-a7b0-cf66-7f5a-c09d36f443f0@topic.nl>
References: <1521815074-30424-1-git-send-email-mike.looijmans@topic.nl>
 <20180323151101.GB24361@lunn.ch>
 <b68d4540-b15d-ec31-05a8-e1a4632bb5ee@topic.nl>
 <886c94ef-e2c8-2afa-307d-1924c74c6dc0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <886c94ef-e2c8-2afa-307d-1924c74c6dc0@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

On 23-03-18 20:33, Florian Fainelli wrote:
> On 03/23/2018 12:20 PM, Mike Looijmans wrote:
>> On 23-3-2018 16:11, Andrew Lunn wrote:
>>> On Fri, Mar 23, 2018 at 03:24:34PM +0100, Mike Looijmans wrote:
>>>> It's common practice to store MAC addresses for network interfaces into
>>>> nvmem devices. However the code to actually do this in the kernel lacks,
>>>> so this patch adds of_get_nvmem_mac_address() for drivers to obtain the
>>>> address from an nvmem cell provider.
>>>>
>>>> This is particulary useful on devices where the ethernet interface
>>>> cannot
>>>> be configured by the bootloader, for example because it's in an FPGA.
>>>>
>>>> Tested by adapting the cadence macb driver to call this instead of
>>>> of_get_mac_address().
>>>
>>> Hi Mike
>>>
>>> Please can you document the device tree binding. I assume you are
>>> adding a nvmen-cells and nvmem-cell-names to the Ethernet node in
>>> device tree.
>>
>> Indeed. I'll add my settings as an example. Where should I put this
>> documentation, in the commit comment or somewhere in
>> Documents/devicetree/bindings?
>>
>>>> +/**
>>>> + * Search the device tree for a MAC address, by calling
>>>> of_get_mac_address
>>>> + * and if that doesn't provide an address, fetch it from an nvmem
>>>> provider
>>>> + * using the name 'mac-address'.
>>>> + * On success, copies the new address is into memory pointed to by
>>>> addr and
>>>> + * returns 0. Returns a negative error code otherwise.
>>>> + * @dev:    Pointer to the device containing the device_node
>>>> + * @addr:    Pointer to receive the MAC address using ether_addr_copy()
>>>> + */
>>>> +int of_get_nvmem_mac_address(struct device *dev, char *addr)
>>>> +{
>>>> +    const char *mac;
>>>> +    struct nvmem_cell *cell;
>>>> +    size_t len;
>>>> +    int ret;
>>>> +
>>>> +    mac = of_get_mac_address(dev->of_node);
>>>> +    if (mac) {
>>>> +        ether_addr_copy(addr, mac);
>>>> +        return 0;
>>>> +    }
>>>
>>> Is there a need to add a new API? Could of_get_mac_address() be
>>> extended to look in NVMEM? The MAC driver does not care. It is saying,
>>> using OF get me a MAC address. One API seems sufficient, and would
>>> mean you don't need to change the MAC drivers.
>>
>> It's what I intended to do, but there were two problems with that:
>> - of_get_mac_address() returns a pointer to constant data in memory, but
>> the nvmem functions return an allocated memory object that must be freed
>> after use. This changes the way the call is to be made.
> 
> Yeah...
> 
>> - The nvmem functions need the "struct device" pointer as well, while
>> of_get_mac_address() only gets passed the DT node.
> 
> Bummer, you can't assume there is always a struct device associated with
> a struct device_node. Also, bigger question is, how can we make this
> work, for e.g: ACPI systems and therefore use an abstract fw_node handle?
> 

Andrew Lunn's suggestion of using "of_nvmem_cell_get()" should solve this.

>> One approach would be to deprecate the of_get_mac_address() interface
>> and migrate existing drivers to the of_get_nvmem_mac_address() interface.
> 
> Humm maybe, but clearly making of_get_mac_address() look for a nvmem is
> less error prone and does not require people to opt-in for the new
> helper, that seems beneficial to me.

Totally agree. But I can't think of a way that doesn't change the 
method's signature. At some point the allocated nvmem buffer must be freed.

A quick survey for the of_get_mac_address users learns that most of them 
do a memcpy (or similar) right after it, so for these drivers the 
"of_get_nvmem_mac_address" style signature that performs the memcpy (or 
better, ether_addr_copy) is a better fit, e.g.:

int of_get_mac_address(struct device_node *np, void *addr)


-- 
Mike Looijmans
