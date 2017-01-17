From: Mike Leach <Mike.Leach-5wv7dgnIgG8@public.gmane.org>
Subject: RE: [PATCH v4 4/4] arm64: dts: juno: add missing CoreSight STM
 component
Date: Tue, 17 Jan 2017 14:52:31 +0000
Message-ID: <DB6PR0802MB2198D30880E268077202AAD88C7C0@DB6PR0802MB2198.eurprd08.prod.outlook.com>
References: <1484655313-9025-1-git-send-email-sudeep.holla@arm.com>
 <1484655313-9025-5-git-send-email-sudeep.holla@arm.com>
 <5c742b98-0707-67fd-d8a1-467f34d99cdb@arm.com>
 <6473418b-95d5-5be3-47fd-4c554f353923@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6473418b-95d5-5be3-47fd-4c554f353923-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suzuki Poulose <Suzuki.Poulose-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, "coresight-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <coresight-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



----------------------------------------------------------------
Mike Leach                           +44 (0)1254 893911 (Direct)
Principal Engineer                   +44 (0)1254 893900 (Main)
Arm Blackburn Design Centre          +44 (0)1254 893901 (Fax)
Belthorn House
Walker Rd                            mailto:mike.leach-5wv7dgnIgG8@public.gmane.org
Guide
Blackburn
BB1 2QE
----------------------------------------------------------------


> -----Original Message-----
> From: Sudeep Holla [mailto:sudeep.holla-5wv7dgnIgG8@public.gmane.org]
> Sent: 17 January 2017 14:01
> To: Suzuki Poulose; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; Mike Leach; Mik=
e
> Leach
> Cc: Sudeep Holla; Mathieu Poirier; Lorenzo Pieralisi; coresight-cunTk1MwBs//PtFMR13I2A@public.gmane.org=
aro.org;
> Liviu Dudau; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Olof Johansson
> Subject: Re: [PATCH v4 4/4] arm64: dts: juno: add missing CoreSight STM
> component
>
>
>
> On 17/01/17 13:39, Suzuki K Poulose wrote:
> > On 17/01/17 12:15, Sudeep Holla wrote:
> >> From: Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>
> >> This patch adds the missing CoreSight STM component definition to the
> >> device tree of all the juno variants(r0,r1,r2)
> >>
> >> STM component is connected to different funnels depending on Juno
> >> platform variant.
> >>
> >> Reviewed-and-Tested-by: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> Signed-off-by: Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> [sudeep.holla-5wv7dgnIgG8@public.gmane.org: minor changelog update and reorganising the STM
> >>     node back into juno-base.dtsi to avoid duplication]
> >> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> >> ---
> >>  arch/arm64/boot/dts/arm/juno-base.dtsi | 15 +++++++++++++++
> >>  arch/arm64/boot/dts/arm/juno-r1.dts    |  4 ++++
> >>  arch/arm64/boot/dts/arm/juno-r2.dts    |  4 ++++
> >>  arch/arm64/boot/dts/arm/juno.dts       | 16 ++++++++++++++++
> >>  4 files changed, 39 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi
> >> b/arch/arm64/boot/dts/arm/juno-base.dtsi
> >> index faedf357db3b..58c1773c3aa4 100644
> >> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> >> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> >> @@ -185,6 +185,21 @@
> >>          };
> >>      };
> >>
> >> +    stm@20100000 {
> >> +        compatible =3D "arm,coresight-stm", "arm,primecell";
> >> +        reg =3D <0 0x20100000 0 0x1000>,
> >> +              <0 0x28000000 0 0x180000>;
> >
> > The size of the stimulus base is 16MB (as per TRM), implies =3D> 0x1000=
000.
> >
>
> Fixed locally.
>
> Mike,
>
> Can you confirm ? I know TRM had some issues with size of other
> coresight components.
>
Checked both Juno and STM arch manuals - these are in agreement that the ST=
M memory stimulus area is 16MB in size.
Thus for Juno specifically with all masters seeing the same area @ base 0x2=
8000000, <0 0x28000000 0 0x1000000 >  would be the correct description.

Mike

> > with that fixed :
> >
> > Reviewed-by: Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
> >
>
> Thanks.
>
> --
> Regards,
> Sudeep
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
