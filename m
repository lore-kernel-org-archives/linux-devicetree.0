From: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: at91: dts: sama5d3/sama5d4: reduce NFC command registers
 memory region
Date: Thu, 15 Jan 2015 17:59:15 +0800
Message-ID: <54B78F73.9000504@atmel.com>
References: <1421305683-8739-1-git-send-email-josh.wu@atmel.com> <20150115094527.3fde882a@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150115094527.3fde882a@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi=EF=BC=8C Boris

Thanks for the review.

On 1/15/2015 4:45 PM, Boris Brezillon wrote:
> Hi Josh,
>
> On Thu, 15 Jan 2015 15:08:03 +0800
> Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:
>
>> To get NFC status, we need to read the NFC command registers, which =
is a
>> 256M memory mapping address. To check the status, you just read such
>> address from NFC command registers.
>> For example, to check NFCBUSY (bit 27), you need to read 0x08000000
>> (bit 27 is set to 1) of the NFC command register.
>> If you want to check NFCBUSY (bit 27) and NFCWR (bit 26) in same tim=
e,
>> you need to read 0x0c000000 (bit 27 and bit 26 are set to 1).
> Are NFCBUSY and NFCWR found in NFCDATA_STATUS and those found in HSMC=
_SR
> representing the same thing.
yes. it is. I just check with IP team. The NFCBUSY of NFCDATA_STATUS is=
=20
also refer to NFC_BUSY of HSMC_SR.

> If they are, I think you can just use HSMC_SR instead of NFCDATA_STAT=
US
> to check the status [1] and drop the last bit in the NFC Command
> Resgiters range.
Thank you. your code works (just need some typo change).
I want to send [1] code with your signed-off and my acked to mtd list.
Is it okay for you?

>
>> But mapping such huge memory address only for multiple NFC status ch=
eck
>> is not very economic.
>>
>> The economic way is we check the NFC status one bit a time, then we =
don't
>> have to mapping such huge address.
>>
>> Now we reduce the memory mapping from 256M to 128M+4 (include 0x0800=
0000),
>> the only difference is NFCBUSY (bit 27) status. You cannot check NFC=
BUSY
>> bit with other NFC status bit.
>>
>> Since current atmel_nand driver check the NFCBUSY status without com=
bine
>> other bits, so this change (reduce 256M to 128M+4) will not be harmf=
ul.
>>
>> Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>>
>> ---
>>
>>   arch/arm/boot/dts/sama5d3.dtsi | 2 +-
>>   arch/arm/boot/dts/sama5d4.dtsi | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama=
5d3.dtsi
>> index d701ddd..d243732 100644
>> --- a/arch/arm/boot/dts/sama5d3.dtsi
>> +++ b/arch/arm/boot/dts/sama5d3.dtsi
>> @@ -1426,7 +1426,7 @@
>>   				#address-cells =3D <1>;
>>   				#size-cells =3D <1>;
>>   				reg =3D <
>> -					0x70000000 0x10000000	/* NFC Command Registers */
>> +					0x70000000 0x08000004	/* NFC Command Registers */
> This would give the following range:
>
> 					0x70000000 0x08000000
This is also right if we apply above code change.

So after above patch for mtd list is accepted I'll send out the dts=20
changes patch.

>
>
> Best Regards,
>
> Boris
>
> [1]http://code.bulix.org/2noozv-87724
>
>
Best Regards,
Josh Wu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
