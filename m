From: Caesar Wang <wxt@rock-chips.com>
Subject: Re: [PATCH v13 2/3] power-domain: rockchip: add power domain driver
Date: Mon, 20 Apr 2015 22:42:44 +0800
Message-ID: <55351064.7090409@rock-chips.com>
References: <1429438552-17733-1-git-send-email-wxt@rock-chips.com>	 <1429440280-18915-1-git-send-email-wxt@rock-chips.com> <1429522004.14597.8.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429522004.14597.8.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: heiko@sntech.de, khilman@linaro.org, linux-arm-kernel@lists.infradead.org, tomasz.figa@gmail.com, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-rockchip@lists.infradead.org, dianders@chromium.org, ulf.hansson@linaro.org, dmitry.torokhov@gmail.com, broonie@kernel.org, grant.likely@linaro.org, "jinkun.hong" <jinkun.hong@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Paul,

Thanks your commnets!:-)

=E5=9C=A8 2015=E5=B9=B404=E6=9C=8820=E6=97=A5 17:26, Paul Bolle =E5=86=99=
=E9=81=93:
> On Sun, 2015-04-19 at 18:44 +0800, Caesar Wang wrote:
>> --- a/arch/arm/mach-rockchip/Makefile
>> +++ b/arch/arm/mach-rockchip/Makefile
> +obj-$(CONFIG_PM_GENERIC_DOMAINS) +=3D pm_domains.o
>
> PM_GENERIC_DOMAINS is a bool symbol, so pm_domains.o can never be par=
t
> of a module. Is that correct?

Yeah, So this platform_driver does not need to set an owner, it will be=
=20
populated by the
driver core.
>
>> --- /dev/null
>> +++ b/arch/arm/mach-rockchip/pm_domains.c
>> +#include <linux/module.h>
> This include could probably be dropped.

Yeah. As the about said.
>> +static const struct of_device_id rockchip_pm_domain_dt_match[] =3D =
{
>> +	{
>> +		.compatible =3D "rockchip,rk3288-power-controller",
>> +		.data =3D (void *)&rk3288_pmu,
>> +	},
>> +	{ /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, rockchip_pm_domain_dt_match);
> The MODULE_DEVICE_TABLE() macro will be preprocessed away for built-i=
n
> code, according to include/linux/module.h.

So,do you think we should remove it?
wow.....,looks we should remove it.
>> +static struct platform_driver rockchip_pm_domain_driver =3D {
>> +	.probe =3D rockchip_pm_domain_probe,
>> +	.driver =3D {
>> +		.name   =3D "rockchip-pm-domain",
>> +		.owner  =3D THIS_MODULE,
> According to include/linux/export.h THIS_MODULE is equivalent to NULL
> for built-in code. So I think this line is not needed.
>

Yeah,you are right.
>> +		.of_match_table =3D rockchip_pm_domain_dt_match,
>> +		/*
>> +		 * We can't forcibly eject devices form power domain,
>> +		 * so we can't really remove power domains once they
>> +		 * were added.
>> +		 */
>> +		.suppress_bind_attrs =3D true,
>> +	},
>> +};
> Thanks,
>
>
> Paul Bolle
>
>
>
>
Thanks,

Caesar

--=20
***********************************************************************=
***************
=E7=8E=8B=E6=99=93=E8=85=BE    Caesar Wang
Product R&D Dept.III
=46uzhou Rockchip Electronics Co.Ltd
Addr=EF=BC=9A  NO.18 Building, A District, Fuzhou Software Park,Gulou D=
istrict,Fuzhou, Fujian,China(Fuzhou Headquarters)
               21F,Malata Building,Kejizhongyi Avenue,Nanshan District,=
Shenzhen  (Shenzhen Office)
Tel=EF=BC=9A+86-591-83991906/07 - 8221
Mobile:+86 15059456742
E-mail : wxt@rock-chips.com
***********************************************************************=
****************
***********************************************************************=
****************
IMPORTANT NOTICE: This email is from Fuzhou Rockchip Electronics Co., L=
td .The contents of this email and any attachments may
contain information that is privileged, confidential and/or exempt from=
 disclosure under applicable law and relevant NDA.
If you are not the intended recipient, you are hereby notified that any=
 disclosure, copying, distribution, or use of the
information is STRICTLY PROHIBITED. Please immediately contact the send=
er as soon as possible and destroy the material
in its entirety in any format. Thank you.
***********************************************************************=
****************
