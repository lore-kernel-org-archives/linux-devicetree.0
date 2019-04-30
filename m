From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of_net: add mtd-mac-address support to
 of_get_mac_address()
Date: Mon, 29 Apr 2019 18:15:30 -0700
Message-ID: <91fc37e6-aacd-cb67-cf7e-2415a59375a4@gmail.com>
References: <1555445100-30936-1-git-send-email-ynezz@true.cz>
 <d29bcf08-9299-8f2c-00bc-791b60658581@gmail.com>
 <93770c6a-5f99-38f6-276b-316c00176cac@gmail.com>
 <20190430004845.GA29722@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190430004845.GA29722@bogus>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?Q?Petr_=c5=a0tetiar?= <ynezz@true.cz>, netdev@vger.kernel.org, devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
List-Id: devicetree@vger.kernel.org

On 4/29/19 5:48 PM, Rob Herring wrote:
> On Tue, Apr 16, 2019 at 08:01:56PM -0700, Frank Rowand wrote:
>> Hi Rob,
>>
>> On 4/16/19 5:29 PM, Florian Fainelli wrote:
>>>
>>>
>>> On 16/04/2019 13:05, Petr Štetiar wrote:
>>>> From: John Crispin <john@phrozen.org>
>>>>
>>>> Many embedded devices have information such as MAC addresses stored
>>>> inside MTD devices. This patch allows us to add a property inside a node
>>>> describing a network interface. The new property points at a MTD
>>>> partition with an offset where the MAC address can be found.
>>>>
>>>> This patch has originated in OpenWrt some time ago, so in order to
>>>> consider usefulness of this patch, here are some real-world numbers
>>>> which hopefully speak for themselves:
>>>>
>>>>   * mtd-mac-address                used 497 times in 357 device tree files
>>>>   * mtd-mac-address-increment      used  74 times in  58 device tree files
>>>>   * mtd-mac-address-increment-byte used   1 time  in   1 device tree file
>>>>
>>>> Signed-off-by: John Crispin <john@phrozen.org>
>>>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>>>> [cleanup of the patch for upstream submission]
>>>> Signed-off-by: Petr Štetiar <ynezz@true.cz>
>>>> ---
>>>
>>> [snip]
>>>
>>>> +static const void *of_get_mac_address_mtd(struct device_node *np)
>>>> +{
>>>> +#ifdef CONFIG_MTD
>>>> +    void *addr;
>>>> +    size_t retlen;
>>>> +    int size, ret;
>>>> +    u8 mac[ETH_ALEN];
>>>> +    phandle phandle;
>>>> +    const char *part;
>>>> +    const __be32 *list;
>>>> +    struct mtd_info *mtd;
>>>> +    struct property *prop;
>>>> +    u32 mac_inc = 0;
>>>> +    u32 inc_idx = ETH_ALEN-1;
>>>> +    struct device_node *mtd_np = NULL;
>>>
>>> Reverse christmas tree would look a bit nicer here.
>>
>> Do we a variable declaration format preference for drivers/of/*?
> 
> We'd better get one. It's all the rage.
> 
> How about fallen Christmas tree:
> 
> 	int a;
> 	bool fallen;
> 	char christmas_tree;
> 	int for_our;
> 	int dt;

Nice!  That is actually the most aesthetically pleasing method I have
seen.  :-)

In the future I will tell people to ignore devicetree review comments
that espouse a declaration religion.  As long as the declarations are
within reason (and sort of follow whatever style is present elsewhere
in the same file).

> 
> Rob
> 
