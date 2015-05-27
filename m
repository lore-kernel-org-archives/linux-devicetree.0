From: =?windows-1252?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v4 2/2] soc: Add driver for Freescale Vybrid Platform
Date: Wed, 27 May 2015 19:28:46 +0200
Message-ID: <5565FECE.3000104@suse.de>
References: <cover.1432637313.git.maitysanchayan@gmail.com> <7df753efff77a96da285f0571f1316512787e83c.1432637313.git.maitysanchayan@gmail.com> <1432711910.27695.223.camel@x220> <20150527130727.GA3374@Sanchayan-Arch.toradex.int>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150527130727.GA3374-2b/appYahYAQpivJYWJ5AnfHJb42ZiuNiBNltiLz+yw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Am 27.05.2015 um 15:07 schrieb maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org:
> On 15-05-27 09:31:50, Paul Bolle wrote:
>> On Tue, 2015-05-26 at 17:06 +0530, Sanchayan Maity wrote:
>>> --- /dev/null
>>> +++ b/drivers/soc/fsl/Kconfig
>>
>>> +config SOC_VF610
>>> +	   bool "SoC bus device for the Freescale Vybrid platform"
>>> +	   select SOC_BUS
>>> +	   help
>>> +	     Include support for the SoC bus on the Freescale Vybrid plat=
form
>>> +	     providing some sysfs information about the module variant.
>>> \ No newline at end of file
[...]
>>> --- /dev/null
>>> +++ b/drivers/soc/fsl/Makefile
>>
>>> +obj-$(CONFIG_SOC_VF610)		+=3D soc-vf610.o
>>
>>> --- /dev/null
>>> +++ b/drivers/soc/fsl/soc-vf610.c
>>
>>> +MODULE_DEVICE_TABLE(of, vf610_soc_bus_match);
>>
>>> +module_platform_driver(vf610_soc_driver);
>>
>> (The series starting at https://lkml.org/lkml/2015/5/10/131 would al=
low
>> to use builtin_platform_driver() for built-in only code.)
[...]
>>> +MODULE_DESCRIPTION("Freescale VF610 SoC bus driver");
>>> +MODULE_LICENSE("GPL v2");
>>
>> I think soc-vf610.o can only be built-in. But its code contains a fe=
w
>> module specific macros. Was it perhaps intended for SOC_VF610 to be
>> tristate?
>=20
> I too think that should be built-in.

Why? For a generic distro kernel it'd be unfortunate to not allow
putting such a driver into an initrd, if needed early, or into the
rootfs otherwise.

Regards,
Andreas

> Did not have an intention of making
> it tristate, however while using other drivers as references, the per=
haps
> unneccessary stuff crept in.
>=20
> The MODULE_* references can be removed along with the corresponding h=
eader
> file. However that series has not been merged yet, so I can't use bui=
ltin_*
> yet?
[snip]

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Dilip Upmanyu, Graham Norton; H=
RB
21284 (AG N=FCrnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
