From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 3/6] Documentation: DT: Add entry for FSL Management Complex
Date: Fri, 15 Aug 2014 08:35:34 -0500
Message-ID: <21CA0EC7-3711-4B13-991B-940EF576D2EF@codeaurora.org>
References: <1408096156-29772-1-git-send-email-bhupesh.sharma@freescale.com> <1408096156-29772-4-git-send-email-bhupesh.sharma@freescale.com> <20140815110020.GC15621@leverpostej>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140815110020.GC15621@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "J. German Rivera" <German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "arnab.basu-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <arnab.basu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Aug 15, 2014, at 6:00 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:

> [devicetree-discuss is no more, fixing up to devicetree-u79uwXL29TbrhsbdSgBK9A@public.gmane.org=
rg]
>=20
> Hi,
>=20
> On Fri, Aug 15, 2014 at 10:49:12AM +0100, Bhupesh Sharma wrote:
>> This patch adds a devicetree binding documentation for FSL's
>> Management Complex.
>>=20
>> Management Complex is a hardware resource manager that manages
>> specialized hardware objects used in network-oriented packet
>> processing applications
>>=20
>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> Signed-off-by: Stuart Yoder <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> Signed-off-by: J. German Rivera <German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> ---
>> .../devicetree/bindings/misc/fsl,qoriq-mc.txt      |   40 ++++++++++=
++++++++++

I=92d probably start this off in bindings/soc/fsl/

>> 1 file changed, 40 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/misc/fsl,qoriq-=
mc.txt
>>=20
>> diff --git a/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt=
 b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> new file mode 100644
>> index 0000000..608529e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> @@ -0,0 +1,40 @@
>> +* Freescale Management Complex
>> +
>> +The Freescale Management Complex (fsl-mc) is a hardware resource
>> +manager that manages specialized hardware objects used in
>> +network-oriented packet processing applications.  After the fsl-mc
>> +block is enabled, pools of hardware resources are available, such a=
s
>> +queues, buffer pools, I/O interfaces.  These resources are building
>> +blocks that can be used to create functional hardware objects/devic=
es
>> +such as network interfaces, crypto accelerator instances, L2 switch=
es,
>> +etc.
>> +
>> +Required properties:
>> +
>> +    - compatible
>> +        Value type: <string>
>> +        Definition: Must be "fsl,qoriq-mc".  A Freescale Management=
 Complex
>> +                    compatible with this binding must have Block Re=
vision
>> +                    Registers BRR1 and BRR2 at offset 0x0BF8 and 0x=
0BFC in
>> +                    the MC control register region.

Hmm, this BRR1/BRR2 comments are a little odd, if we keep those, we sho=
uld probably
also state what value is BRR1 (I think that was the one that contented =
the IP ID).

>> +
>> +    - reg
>> +        Value type: <prop-encoded-array>
>> +        Definition: A standard property.  Specifies one or two regi=
ons
>> +                    defining the MC's registers:
>> +
>> +                       -the first region is the command portal for =
the
>> +                        this machine and must always be present
>> +
>> +                       -the second region is the MC control registe=
rs. This
>> +                        region may not be present in some scenarios=
, such
>> +                        as in the device tree presented to a virtua=
l machine.

Should we distinguish the second case w/a different compat?  It seems l=
ike a major driver change if the second region isn=92t there, or a diff=
erent driver?

>=20
> This looks extremely simple. Is this unit self-contained or does it
> relate to other blocks which will be described separately?
>=20
>> +
>> +Example:
>> +
>> +        fsl_mc: fsl-mc@80c000000 {
>> +                compatible =3D "fsl,qoriq-mc";
>> +                reg =3D <0x00000008 0x0c000000 0 0x40        // MC =
portal base
>> +                       0x00000000 0x08340000 0 0x40000 >;  // MC co=
ntrol reg
>=20
> Nit: could we bracket list entries individually please?
>=20
> Thanks,
> Mark.
>=20
> _______________________________________________

- k

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
