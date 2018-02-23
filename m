From: Bean Huo <beanhuo@outlook.com>
Subject: Re: [PATCH v1 2/3] mtd: probe: probe dual die entry from devicetree
 binding
Date: Fri, 23 Feb 2018 11:14:57 +0000
Message-ID: <DM2PR12MB0014A0DCB95D52F22D1DF41BA6CC0@DM2PR12MB0014.namprd12.prod.outlook.com>
References: <1519241514-6466-1-git-send-email-beanhuo@outlook.com>
 <DM2PR12MB001471EC3E5B6841C61ED9FEA6CE0@DM2PR12MB0014.namprd12.prod.outlook.com>,
 <20180222140253.1773d3ce@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180222140253.1773d3ce@bbrezillon>
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
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>, "richard@nod.at" <richard@nod.at>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, beanhuo <beanhuo@micron.com>
List-Id: devicetree@vger.kernel.org


Below suggested points will be involved in next patch. Thanks Boris.

>>       int addr_unlock1 = 0x555, addr_unlock2 = 0x2AA;
>> +     struct device_node __maybe_unused *np = map->device_node;

>You can drop this variable...

>>
>>       xip_enable(base, map, cfi);
>>  #ifdef DEBUG_CFI
>> @@ -177,6 +179,11 @@ static int __xipram cfi_chip_setup(struct map_info *map,
>>
>>       cfi->sector_erase_cmd = CMD(0x30);
>>
>> +     cfi->device_stack = CFI_DEVICESTACK_1DIE;
>> +#ifdef CONFIG_OF
>> +     if (np && of_property_read_bool(np, "dual-die-stack"))
>> +             cfi->device_stack = CFI_DEVICESTACK_2DIE;
>> +#endif
>and simply do:

>      if (of_property_read_bool(map->device_node, "dual-die-stack"))
>             cfi->device_stack = CFI_DEVICESTACK_2DIE;

>>       /* Read the CFI info structure */
>>       xip_disable_qry(base, map, cfi);
>>       for (i=0; i<(sizeof(struct cfi_ident) + num_erase_regions * 4); i++)
>> diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
>> index 9b57a9b..bda37a4 100644
>> --- a/include/linux/mtd/cfi.h
>> +++ b/include/linux/mtd/cfi.h
>> @@ -277,11 +277,19 @@ struct cfi_bri_query {
>>  #define CFI_MODE_CFI 1
>>  #define CFI_MODE_JEDEC       0
>>
>> +/* These values represent the die count of chip stack.
>> + * So far, there only exists two type of stack device,
>> + * single or dual die.
>> + */
>> +#define CFI_DEVICESTACK_1DIE 1
>> +#define CFI_DEVICESTACK_2DIE 2

>Why are these macros needed?

>> +
>>  struct cfi_private {
>>       uint16_t cmdset;
>>       void *cmdset_priv;
>>       int interleave;
>>       int device_type;
>> +     int device_stack;       /* Device stack type, single die or dual die. */

>Why not simply:

>       int num_dies;

>which would contain the number of dies.

>>       int cfi_mode;           /* Are we a JEDEC device pretending to be CFI? */
>>       int addr_unlock1;
>>       int addr_unlock2;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
