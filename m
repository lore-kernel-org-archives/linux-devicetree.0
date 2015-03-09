From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/3] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
Date: Mon, 9 Mar 2015 10:57:59 -0700
Message-ID: <54FDDF27.6000603@broadcom.com>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com> <1425691129-1150-4-git-send-email-computersforpeace@gmail.com> <CACna6rzkEQu+LYchckFpLLxkvyMYK7N84nrGu8p0rjRsRbFzfg@mail.gmail.com> <CACna6rxEU08d4DC0_mX3ett=KGZWpyyT-MqGQ+_wBSPGkaD0WQ@mail.gmail.com> <20150309174905.GU18140@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150309174905.GU18140@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJl?= =?UTF-8?B?Y2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Corneliu Doban <cdoban-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 3/9/2015 10:49 AM, Brian Norris wrote:
> On Sun, Mar 08, 2015 at 01:44:02AM +0100, Rafa=C5=82 Mi=C5=82ecki wro=
te:
>> On 7 March 2015 at 18:39, Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
>>> It seems that brcmnand_ctlrdy_irq never fires on my device. Just li=
ke
>>> controller was never generating any IRQ.
>>>
>>>
>>> I started comparing your driver with OpenWrt's bcm_nand.c (which
>>> should be very similar to Broadcom's SDK NAND driver for ARM). Belo=
w
>>> are few things I've noticed.
>>>
>>> 1) In bcm_nand.c IRQ handler also doesn't seem to be fired (or very=
 rarely).
>>
>> Oh, wait, I was wrong there. So in bcm_nand.c IRQ handler fires very
>> often, just not during the early phase (RESET, READID), when we don'=
t
>> use IRQs. During standard read/program/etc IRQ is commonly used.
>>
>> So maybe all we're missing in case of brcmstb_nand.c is
>> enabling/acking/disabling IRQ?
>=20
> Yes, that's likely the main problem.
>=20
>> It seem that my controller 6.01 has:
>>
>> 1) Following IRQs:
>> DIREC_READ_MISS
>> ERASE_COMPLETE
>> COPYBACK_COMPLETE
>> PROGRAM_COMPLETE
>> CONTROLLER_RDY
>> RDBSY_RDY
>> ECC_UNCORRECTABLE
>> ECC_CORRECTABLE
>=20
> Right, that's the standard set of NAND interrupts. This driver only u=
ses
> CONTROLLER_RDY, BTW.
>=20
>> 2) Registers for reading/acking above IRQs:
>> 0xf00 DIREC_READ_MISS
>> 0xf04 ERASE_COMPLETE
>> 0xf08 COPYBACK_COMPLETE
>> 0xf0c PROGRAM_COMPLETE
>> 0xf10 CONTROLLER_RDY
>> 0xf14 RDBSY_RDY
>> 0xf18 ECC_UNCORRECTABLE
>> 0xf1c ECC_CORRECTABLE
>> (if 0x1 is set, it means IRQ was raised, writing 0x1 ack-es it)
>>
>> 3) Register 0x408 for enabling/disabling IRQs:
>> 0x00000004 DIREC_READ_MISS
>> 0x00000008 ERASE_COMPLETE
>> 0x00000010 COPYBACK_COMPLETE
>> 0x00000020 PROGRAM_COMPLETE
>> 0x00000040 CONTROLLER_RDY
>> 0x00000080 RDBSY_RDY
>> 0x00000100 ECC_UNCORRECTABLE
>> 0x00000200 ECC_CORRECTABLE
>=20
> (2) and (3) look pretty similar to the Cygnus chips. We should probab=
ly
> end up using the same solution for both. Several related to the Cygnu=
s
> project are on CC.
>=20
> One problem for Cygnus is that some of the other bits in their regist=
er
> 0x408 deal with non-interrupt-related functionality (endianness and
> clocks), so it might not make the cleanest design to handle this with=
 an
> irqchip driver.

It's not just similar, but it's identical to Cygnus.

The register offset to read/ack the IRQ are the same. and Cygnus also
uses a standard alone register to enable/disable IRQ (and their bit
field is the same). Based on the link from Rafal, this chip also have
the same issue with APB endianess control, clock control, interrupt
control all stuffed in the same register:

#define NANDC_IDM_AXI_BIG_ENDIAN        IDMREG_BIT_FIELD(0x408, 28, 1)
#define NANDC_IDM_APB_LITTLE_ENDIAN     IDMREG_BIT_FIELD(0x408, 24, 1)
#define NANDC_IDM_TM                    IDMREG_BIT_FIELD(0x408, 16, 5)
#define NANDC_IDM_IRQ_CORRECABLE_EN     IDMREG_BIT_FIELD(0x408, 9, 1)
#define NANDC_IDM_IRQ_UNCORRECABLE_EN   IDMREG_BIT_FIELD(0x408, 8, 1)
#define NANDC_IDM_IRQ_RDYBSY_RDY_EN     IDMREG_BIT_FIELD(0x408, 7, 1)
#define NANDC_IDM_IRQ_CONTROLLER_RDY_EN IDMREG_BIT_FIELD(0x408, 6, 1)
#define NANDC_IDM_IRQ_PRPOGRAM_COMP_EN  IDMREG_BIT_FIELD(0x408, 5, 1)
#define NANDC_IDM_IRQ_COPYBK_COMP_EN    IDMREG_BIT_FIELD(0x408, 4, 1)
#define NANDC_IDM_IRQ_ERASE_COMP_EN     IDMREG_BIT_FIELD(0x408, 3, 1)
#define NANDC_IDM_IRQ_READ_MISS_EN      IDMREG_BIT_FIELD(0x408, 2, 1)
#define NANDC_IDM_IRQ_N_EN(n)           IDMREG_BIT_FIELD(0x408, 2+(n), =
1)
#define NANDC_IDM_CLOCK_EN              IDMREG_BIT_FIELD(0x408, 0, 1)


>=20
> Brian
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
