From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v8 1/5] mtd: nand: vf610_nfc: Freescale NFC for VF610,
 MPC5125 and others
Date: Thu, 30 Jul 2015 19:00:38 +0200
Message-ID: <36ffdc45494ab888ba375ff8478864ad@agner.ch>
References: <1438015365-15685-1-git-send-email-stefan@agner.ch>
 <1438015365-15685-2-git-send-email-stefan@agner.ch>
 <20150730181321.3bd38db7.albert.aribaud@3adev.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150730181321.3bd38db7.albert.aribaud-iEu9NFBzPZE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Albert ARIBAUD <albert.aribaud-iEu9NFBzPZE@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marb-Z4QKGCRq86k@public.gmane.org, aaron-yuhzfaV+M/Wz3Dx2OeFgIA@public.gmane.org, bpringlemeir-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bill Pringlemeir <bpringlemeir-ygJ1pmMJ17cAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Albert,

On 2015-07-30 18:13, Albert ARIBAUD wrote:
> Hi Stefan,
>=20
> Le Mon, 27 Jul 2015 18:42:41 +0200, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org> a
> =C3=A9crit :
>=20
>> This driver supports Freescale NFC (NAND flash controller) found on
>> Vybrid (VF610), MPC5125, MCF54418 and Kinetis K70. The driver has
>> been tested on 8-bit and 16-bit NAND interface and supports ONFI
>> parameter page reading.
>>
>> [...]
>>
>> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_n=
fc.c
>> new file mode 100644
>> index 0000000..0da500e
>> --- /dev/null
>> +++ b/drivers/mtd/nand/vf610_nfc.c
>> @@ -0,0 +1,640 @@
>> [...]
>=20
> ... about line 708:
>=20
>> +	err =3D devm_request_irq(nfc->dev, irq, vf610_nfc_irq, 0, DRV_NAME=
, mtd);
>> +	if (err) {
>> +		dev_err(nfc->dev, "Error requesting IRQ!\n");
>> +		goto error;
>> +	}
>> +
>> +	vf610_nfc_init_controller(nfc);
>=20
> The call above is too early: vf610_nfc_init_controller() will test
> for (nfc->chip.options & NAND_BUSWIDTH_16) but this option bit is onl=
y
> set once nand_scan_ident() below has been run.
>=20
> This has the effect that even when the DT node specifies a 16-bit wid=
e
> bus, the controller is configured for 8-bit mode at this point, which=
 of
> course causes read failures. I've experienced this with a Vybrid SoC
> and a Micron MT29F4G16ABADAH4 16-bit NAND.
>=20
>> +	/* first scan to find the device and get the page size */
>> +	if (nand_scan_ident(mtd, 1, NULL)) {
>> +		err =3D -ENXIO;
>> +		goto error;
>> +	}
>=20
> Placing the call to vf610_nfc_init_controller() here, after the call
> to nand_scan_ident() rather than before it, fixed the issue for me.

Hm, since nand_scan_ident access the devices we actually want the
controller initialized before we access it the first time. In most
cases, the boot loader/boot ROM probably initialized the controller in =
a
way that identifying the chip should work non the less. However, the
safe way would be to initialize it before calling nand_scan_ident.

However, I see your point regarding bus width: With the change to
nand_dt_init, we have that information after nand_scan_ident. There is
actually more: Also the HW ECC settings are not yet parsed at that
point, hence the ECC status and offset will not be initialized right.=20

We could call the whole initialization twice. This would configure 8-Bi=
t
mode for the 16-Bit devices, but during initialization this is anyway
the required default (ONFI). Or we split it up and call it something
like vf610_nfc_preinit_controller and vf610_nfc_init_controller.

What do you think?

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
