From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [RFC PATCH 3/5] mtd: Add support for Hyperbus memory devices
Date: Wed, 27 Feb 2019 15:42:27 +0530
Message-ID: <acde502c-63fb-e272-d701-4ee63eac4eaa@ti.com>
References: <20190219063607.29949-1-vigneshr@ti.com>
 <20190219063607.29949-4-vigneshr@ti.com>
 <7e79fff7-2565-28f7-7b2b-bb3098f1a928@cogentembedded.com>
 <3952b327-3aff-a32e-4280-6ab24c32cfd9@ti.com>
 <20190227105937.527c6573@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190227105937.527c6573@kernel.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>, Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, "Nori, Sekhar" <nsekhar@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 27/02/19 3:29 PM, Boris Brezillon wrote:
> On Wed, 27 Feb 2019 15:22:19 +0530
> Vignesh Raghavendra <vigneshr@ti.com> wrote:
> 
>> On 26/02/19 11:46 PM, Sergei Shtylyov wrote:
>>> On 02/19/2019 09:36 AM, Vignesh R (by way of Boris Brezillon <bbrezillon@kernel.org>) wrote:
>>>   
>
[...]
>>>> + */
>>>> +
>>>> +struct hb_device {
>>>> +	struct map_info map;
>>>> +	struct device *dev;
>>>> +	struct device_node *np;
>>>> +	struct mtd_info *mtd;
>>>> +	struct hb_ops *ops;
>>>> +	enum hb_memtype memtype;
>>>> +	bool needs_calib;
>>>> +	bool registered;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct hb_ops - struct representing custom Hyperbus operations
>>>> + * @read16: read 16 bit of data, usually from register/ID-CFI space
>>>> + * @write16: write 16 bit of data, usually to register/ID-CFI space
>>>> + * copy_from: copy data from flash memory
>>>> + * copy_to: copy data to flash_memory
>>>> + */
>>>> +
>>>> +struct hb_ops {
>>>> +	u16 (*read16)(struct hb_device *hbdev, unsigned long addr);
>>>> +	void (*write16)(struct hb_device *hbdev, unsigned long addr, u16 val);
>>>> +
>>>> +	void (*copy_from)(struct hb_device *hbdev, void *to,
>>>> +			  unsigned long from, ssize_t len);
>>>> +	void (*copy_to)(struct hb_device *dev, unsigned long to,
>>>> +			const void *from, ssize_t len);  
>>>
>>>    ... else these methods won't fly if you need to "massage" the controller
>>> registers inside them...
>>>   
>>
>> If accessing controller register is the only need, wouldn't a private
>> data pointer within struct hb_device be sufficient to hold pointer to
>> controller specific struct?
>>
>> struct hb_device {
>> 	...
>> 	void *priv; /* points to controller's private data */
>> };
>>
>>
>> Or do you see a need for separate structure for the HyperBus controller?
> 
> Sorry to chime in. Just want to share my experience here: properly
> splitting the controller/device representation is always a good thing.
> When it's not done from the beginning and people start to add their own
> controller drivers as if it was a flash device driver it becomes messy
> pretty quickly and people add hacks to support that (look at the raw
> NAND framework if you need a proof). So, I'd recommend having this
> separation now, even if the onle controllers we support have a 1:1
> relationship between HB controller and HB device.
> 
>>

Alright, will separate controller and slave representation. Thanks for
the feedback!


-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
