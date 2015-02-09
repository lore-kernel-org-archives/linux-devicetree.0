From: Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH mtd] mtd:devices: Add Altera EPCQ Driver
Date: Mon, 9 Feb 2015 14:42:05 +0800
Message-ID: <CAN1oZWyhDwK4M05RDcHyC=TGj1EFti8f1QNWvetwGo+yp+Otsw@mail.gmail.com>
References: <CAN1oZWxB5N=YMQcsJppZgp7TXodcR4tKZM+LNFXS7PSx3F-Yag@mail.gmail.com>
	<CAN1oZWzeev-1uE7gxPnJA=L4Th65CRj8C_LQ7hMJLPHGssDjNQ@mail.gmail.com>
	<CAN1oZWzOfUrYSBEx=M0p0Dz4HHcaz-FtYOF5ON12oeG_WHPa-g@mail.gmail.com>
	<20150204203710.GC4434@norris-Latitude-E6410>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150204203710.GC4434@norris-Latitude-E6410>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Please ignore previous 2 emails of mine ^^

On Thu, Feb 5, 2015 at 4:37 AM, Brian Norris
<computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Jan 27, 2015 at 02:53:59PM +0800, Viet Nga Dao wrote:
>> On Tue, Jan 20, 2015 at 10:05 AM, Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org> wrote:
>> > On Thu, Jan 15, 2015 at 5:27 PM, Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org> wrote:
>> >> On Tue, Jan 13, 2015 at 11:33 AM, Brian Norris
>> >> <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> >>> On Thu, Dec 18, 2014 at 12:23:16AM -0800, vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org wrote:
>> >>>> From: Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
>
>> >> That is why if rewrite the drivers to follow spi-nor structure, it
>> >> will require extra decoding works for the only few used opcodes.
>> >>
>> >I think you'd only have some very trivial work here.
>> >
>> >There would be some small work to reintroduce a properly-replaceable ID
>> >table, and callbacks like ->lock() and ->unlock(), but those should be
>> >implemented in spi-nor.c sooner or later anyway.
>> >
>>
>> I am trying to modify the code to follow your recommendation. However,
>> for lock and unlock functions, i have to implement it in spi_nor.c ,
>> am i right? If yes, currently we already have existing spi_nor_lock
>> and spi_nor_unlock functions but they could not apply for my driver.
>> Should i create a new functions named altera_epcq_lock and unlock and
>> then map it to callback functions or i should the put  those code
>> sunder existing spi_nor_lock/unlock?
>
> We probably want a replaceable spi_nor callback that does the
> flash-specific unlock. spi_nor_lock/unlock would then call the
> nor->unlock() / nor->lock() functions for you, when present.
> Some of the existing code should move into their own spi_nor_st_lock() /
> spi_nor_st_unlock() functions.
>

This changes will be made by me or maintainers? If current this
functions are not supported, i decide not to implement my lock, unlock
function as well.

>> >>>> diff --git a/Documentation/devicetree/bindings/mtd/altera_epcq.txt b/Documentation/devicetree/bindings/mtd/altera_epcq.txt
>> >>>> new file mode 100644
>> >>>> index 0000000..d14f50e
>> >>>> --- /dev/null
>> >>>> +++ b/Documentation/devicetree/bindings/mtd/altera_epcq.txt
>> >>>> @@ -0,0 +1,45 @@
>> >>>> +* MTD Altera EPCQ driver
>> >>>> +
>> >>>> +Required properties:
>> >>>> +- compatible: Should be "altr,epcq-1.0"
>> >>>> +- reg: Address and length of the register set  for the device. It contains
>> >>>> +  the information of registers in the same order as described by reg-names
>> >>>> +- reg-names: Should contain the reg names
>> >>>> +  "csr_base": Should contain the register configuration base address
>> >>>> +  "data_base": Should contain the data base address
>> >>>> +- is-epcs: boolean type.
>> >>>> +             If present, the device contains EPCS flashes.
>> >>>> +             Otherwise, it contains EPCQ flashes.
>> >>>> +- #address-cells: Must be <1>.
>> >>>> +- #size-cells: Must be <0>.
>> >>>> +- flash device tree subnode, there must be a node with the following fields:
>> >>>
>> >>> These subnodes definitely require a 'compatible' string. Perhaps they
>> >>> should be used to differentiate EPCS vs. EPCQ. Does "is-epcs" really
>> >>> need to be in the top-level controller node?
>> >>>
>> >>>> +     - reg: Should contain the flash id
>> >>>
>> >>> Should, or must? (This question is relevant, because you seem to make it
>> >>> optional in your code.) And what does the "flash ID" mean? It seems like
>> >>> you're using as a chip-select or bank index.
>> >>>
>> Yes, this is used for chip select. It is required, not optional. This
>> to ID for each flash in the device
>
> OK, so correct the language here and enforce this in your driver. Right
> now, you don't fail gracefully if this is missing.
>

Sorry, you are right. This field is unnecessary for my driver.
Instead, compatible is replaced. I will update it with 2nd version.

>> >>>> +             if (sector_start < num_sectors-(num_sectors / 4))
>> >>>> +                     sr_bp = __ilog2_u32(num_sectors);
>> >>>> +             else if (sector_start < num_sectors-(num_sectors / 8))
>> >>>> +                     sr_bp = __ilog2_u32(num_sectors) - 1;
>> >>>> +             else if (sector_start < num_sectors-(num_sectors / 16))
>> >>>> +                     sr_bp = __ilog2_u32(num_sectors) - 2;
>> >>>> +             else if (sector_start < num_sectors-(num_sectors / 32))
>> >>>> +                     sr_bp = __ilog2_u32(num_sectors) - 3;
>> >>>> +             else if (sector_start < num_sectors-(num_sectors / 64))
>> >>>> +                     sr_bp = __ilog2_u32(num_sectors) - 4;
>> >>>> +             else if (sector_start < num_sectors-(num_sectors / 128))
>> >>>> +                     sr_bp = __ilog2_u32(num_sectors) - 5;
>> >>>> +             else if (sector_start < num_sectors-(num_sectors / 256))
>> >>>> +                     sr_bp = __ilog2_u32(num_sectors) - 6;
>> >>>> +             else if (sector_start < num_sectors-(num_sectors / 512))
>> >>>> +                     sr_bp = __ilog2_u32(num_sectors) - 7;
>> >>>> +             else if (sector_start < num_sectors-(num_sectors / 1024))
>> >>>> +                     sr_bp = __ilog2_u32(num_sectors) - 8;
>> >>>> +             else
>> >>>> +                     sr_bp = 0;  /* non area protected */
>> >>>
>> >>> Yikes, that's ugly! And I'm not sure it matches the EPCQ doc I found.
>> >>> I'm pretty sure you can rewrite this if/else-if/else block in about 1
>> >>> line though.
>> >>>
>> Yes, i understand that it looks ugly. But it is the best i can do
>> since this function has to satisfy for all the supported devices
>> (http://www.altera.com.my/literature/hb/cfg/cfg_cf52012.pdf, start
>> from page 19)
>
> Did you even try? It was possible to simplify the other case, and I'm
> pretty sure this case can be simplified too. How about this? I hacked
> this together and it seems to match:
>
>         if (sector_start <= num_sectors / 2)
>                 sr_bp = __ilog2_u32(num_sectors);
>         else
>                 sr_bp = fls(num_sectors - 1 - sector_start) + 1;
>

Umm. This does not seem right to me. Just look at sector_start <
number_sector / 2. From the altera EPCQ datasheet
(http://www.altera.com.my/literature/hb/cfg/cfg_cf52012.pdf), such as
EPCQ16 (page 19,20). Sector start <number_sector/2 is the case where
TB = 1 (table 17). In this table we have few options and sr_bp =
__ilog2_u32(num_sectors) is only cover for the sector from 0 to 15 to
be protected.


>> >>>> +
>> >>>> +             if (sr_bp < 0) {
>> >>>
>> >>> sr_bp is unsigned, so this is never true.
>> >>>
>> Ok.  I will change to int type.
>
> Are there ever negative values?
>
>> >>>> +static int altera_epcq_probe_config_dt(struct platform_device *pdev,
>> >>>> +                                    struct device_node *np,
>> >>>> +                                    struct altera_epcq_plat_data *pdata)
>> >>>> +{
>> >>>> +     struct device_node *pp = NULL;
>> >>>> +     struct resource *epcq_res;
>> >>>> +     int i = 0;
>> >>>> +     u32 id;
> ...
>> >>>> +             pdata->np[i] = pp;
>> >>>> +
>> >>>> +             /* Read bank id from DT */
>> >>>> +             if (of_get_property(pp, "reg", &id))
>
> I just realized; you're not using this correctly. of_get_property()
> returns the *length* in the third parameter, so you're not actually
> saving the bank ID here. You probably want of_property_read_u32()
> instead.
>

I will remove this since it is unnecessary.

>> >>>
>> >>> Is this property optional? Your DT binding doc doesn't make it clear,
>> >>> but it seems like a property which would be wise to require (i.e., not
>> >>> optional).
>
> ^^^ so there should be a failure case, where you return failure if the
> property is missing.
>
>> >>>> +                     pdata->board_flash_info[i].bank = id;
>> >>>> +             i++;
>> >>>> +     }
>> >>>> +     pdata->num_flashes = i;
>> >>>> +     return 0;
>> >>>> +}
>
> Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
