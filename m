From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3] ARM: zynq: DT: Use the zynq binding with macb
Date: Thu, 28 May 2015 08:54:23 +0200
Message-ID: <5566BB9F.7050306@xilinx.com>
References: <1432756801-6896-1-git-send-email-nathan.sullivan@ni.com>
 <20150527205238.GJ31081@xsjsorenbubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150527205238.GJ31081@xsjsorenbubuntu>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org>
Cc: michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/27/2015 10:52 PM, S=C3=B6ren Brinkmann wrote:
> On Wed, 2015-05-27 at 03:00PM -0500, Nathan Sullivan wrote:
>> Use the new zynq binding for macb ethernet, since it will disable ha=
lf
>> duplex gigabit like the Zynq TRM says to do. Also allow the compatib=
le
>> cadence gem binding that won't disable half duplex but works otherwi=
se.
>>
>> Signed-off-by: Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org>
>=20
> Assuming that the corresponding patch(es) for the driver and DT docs
> went through:
> Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>=20
>> ---
>=20
> For future reference, please include a changelog here documenting wha=
t
> changes between patch iterations.

Applied and send in my PR.

Thanks,
Michal

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
