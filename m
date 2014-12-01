From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] ARM: zynq: DT: Add USB to device tree
Date: Tue, 02 Dec 2014 00:14:24 +0100
Message-ID: <547CF650.4070907@suse.de>
References: <1417459352-23401-1-git-send-email-soren.brinkmann@xilinx.com> <547CCEE3.6020806@suse.de> <fb6f17c51aef4a498eb2a3e01a81df34@BN1BFFO11FD017.protection.gbl> <e016ae7c103a4fbd844826c9e25fe9c2@BY2FFO11FD036.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e016ae7c103a4fbd844826c9e25fe9c2-neA4ZlFjCT3+O84ieFQLOmYJ4DzVTqeXkX/xN29GLwg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Ola Jeppson <ola-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 01.12.2014 um 23:56 schrieb S=C3=B6ren Brinkmann:
> On Mon, 2014-12-01 at 01:24PM -0800, S=C3=B6ren Brinkmann wrote:
>> On Mon, 2014-12-01 at 09:26PM +0100, Andreas F=C3=A4rber wrote:
>>> Am 01.12.2014 um 19:42 schrieb Soren Brinkmann:
>>>> Add USB nodes to zc702, zc706 and zed device trees.
>>>>
>>>> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>>  arch/arm/boot/dts/zynq-7000.dtsi | 22 +++++++++++++++++++++-
>>>>  arch/arm/boot/dts/zynq-zc702.dts | 11 +++++++++++
>>>>  arch/arm/boot/dts/zynq-zc706.dts | 10 ++++++++++
>>>>  arch/arm/boot/dts/zynq-zed.dts   | 10 ++++++++++
>>>>  4 files changed, 52 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/=
zynq-7000.dtsi
>>>> index ce2ef5bec4f2..9ed60938f301 100644
>>>> --- a/arch/arm/boot/dts/zynq-7000.dtsi
>>>> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> [...]
>>>> @@ -324,6 +344,6 @@
>>>>  			reg =3D <0xf8005000 0x1000>;
>>>>  			reset =3D <0>;
>>>>  			timeout-sec =3D <10>;
>>>> -		};
>>>> +		} ;
>>>>  	};
>>>>  };
>>>
>>> Unrelated accidental change here though. :)
>=20
> Since a v2 is needed now, does this really require a dedicated patch =
to
> fix this bogus space here or do we just look the other way?

Sorry, I don't understand the question: If as you say a v2 is needed,
why knowingly introduce a space between } and ; in your patch? Maybe I'=
m
missing something or you're looking at the patch in reverse...?

Andreas

--=20
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 21284 AG N=C3=
=BCrnberg
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
