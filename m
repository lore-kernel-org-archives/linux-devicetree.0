From: york sun <york.sun-3arQi8VN3Tc@public.gmane.org>
Subject: Re: [Patch v8] driver/clk/clk-si5338: Add common clock framework
 driver for si5338
Date: Wed, 24 Aug 2016 16:32:24 +0000
Message-ID: <AM4PR0401MB173245474074F2BE98C1BA249AEA0@AM4PR0401MB1732.eurprd04.prod.outlook.com>
References: <1471991933-29798-1-git-send-email-york.sun@nxp.com>
 <201608240859.Pj8tsDaR%fengguang.wu@intel.com>
 <20160824044821.GS6502@codeaurora.org>
Reply-To: york sun <york.sun-3arQi8VN3Tc@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "kbuild-all-JC7UmRfGjtg@public.gmane.org" <kbuild-all-JC7UmRfGjtg@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, York Sun <yorksun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Andrey Filippov <andrey-MoRZu3FOBbXQT0dZR+AlfA@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/23/2016 09:48 PM, Stephen Boyd wrote:=0A=
> On 08/24, kbuild test robot wrote:=0A=
>>=0A=
>>   2827		if (drv_type < 0)=0A=
>>   2828			return drv_type;=0A=
>>   2829	=0A=
>>   2830		drv_vdd =3D  get_drv_vdd(drvdata, i);=0A=
>>   2831		if (drv_vdd < 0)=0A=
>>   2832			return drv_vdd;=0A=
>>   2833	=0A=
>>   2834		drv_trim =3D get_drv_trim(drvdata, i);=0A=
>>   2835		if (drv_trim < 0)=0A=
>>   2836			return drv_trim;=0A=
>>   2837	=0A=
>>   2838		drv_invert =3D get_drv_invert(drvdata, i);=0A=
>>   2839		if (drv_invert < 0)=0A=
>>   2840			return drv_invert;=0A=
>>   2841	=0A=
>>   2842		for (j =3D 0; drv_configs[j].description; j++) {=0A=
>>> 2843			if (drv_configs[j].fmt =3D=3D drv_type &&=0A=
>>   2844			    drv_configs[j].vdd =3D=3D drv_vdd &&=0A=
>>   2845			    drv_configs[j].trim =3D=3D drv_trim &&=0A=
>>   2846			    (drv_invert | (drv_configs[j].invert >> 2)) =3D=3D=0A=
>>   2847				((drv_configs[j].invert & 3) |=0A=
>>   2848				 (drv_configs[j].invert>>2)))=0A=
>=0A=
> It might be better to write it as a set of continues instead so=0A=
> that it isn't one complicated conditional=0A=
>=0A=
> 				config =3D &drv_configs[j];=0A=
> 				if (config->fmt !=3D drv_type)=0A=
> 					continue;=0A=
> 				if (config->vdd !=3D drv_vdd)=0A=
> 					continue;=0A=
> 				...=0A=
> 				seq_puts()=0A=
> 				match =3D 1;=0A=
> 				break;=0A=
> 				=0A=
=0A=
Stephen,=0A=
=0A=
Thanks for the suggestion. I will send an update.=0A=
=0A=
York=0A=
=0A=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
