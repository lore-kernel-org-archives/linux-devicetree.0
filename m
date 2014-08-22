From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: zynq: DT: Add Ethernet phys
Date: Fri, 22 Aug 2014 13:47:09 -0700
Message-ID: <CAGVrzcYWN83tznwvw1M9V_mwWgobs2kwtRvEj4stqE=XGC10fg@mail.gmail.com>
References: <1408550219-19825-1-git-send-email-soren.brinkmann@xilinx.com>
 <1408550219-19825-3-git-send-email-soren.brinkmann@xilinx.com>
 <5a7b6f57-b6c0-4fb3-af0d-d403277c0207@BN1AFFO11FD045.protection.gbl>
 <53F5D8D9.7040604@suse.de> <f166a186-301c-4288-97cf-71f8173c07e7@BN1AFFO11FD010.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f166a186-301c-4288-97cf-71f8173c07e7-reflc3kr++N1NCgXcXAFu+hlVc3/7hDbVaz/vdPVXQ4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2014-08-21 8:49 GMT-07:00 S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.=
com>:
> On Thu, 2014-08-21 at 01:32PM +0200, Andreas F=C3=A4rber wrote:
>> Am 21.08.2014 10:41, schrieb Michal Simek:
>> > On 08/20/2014 05:56 PM, Soren Brinkmann wrote:
>> >> Add missing Ethernet phys to Zynq DTs.
>> >>
>> >> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> >> ---
>> >>  arch/arm/boot/dts/zynq-zc702.dts | 6 ++++++
>> >>  arch/arm/boot/dts/zynq-zc706.dts | 6 ++++++
>> >>  arch/arm/boot/dts/zynq-zed.dts   | 6 ++++++
>> >>  3 files changed, 18 insertions(+)
>> >>
>> >> diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts=
/zynq-zc702.dts
>> >> index 30bcfe20f0bc..fa810505ab8f 100644
>> >> --- a/arch/arm/boot/dts/zynq-zc702.dts
>> >> +++ b/arch/arm/boot/dts/zynq-zc702.dts
>> >> @@ -36,6 +36,12 @@
>> >>  &gem0 {
>> >>    status =3D "okay";
>> >>    phy-mode =3D "rgmii-id";
>> >> +  phy-handle =3D <&ethernet_phy>;
>> >> +
>> >> +  ethernet_phy: ethernet-phy@7 {
>> >> +          compatible =3D "marvell,88e1116r", "ethernet-phy-ieee8=
02.3-c22";
>> >
>> > c22 is completely unused by the kernel and also c22 is default opt=
ion anyway.
>> > Any advantage to have c22 specified here?
>>
>> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/devicetree/bindings/net/phy.txt
>>
>> S=C3=B6ren's marvell,* entries do not seem documented, therefore I u=
sed the
>> documented "ethernet-phy-idAAAA.BBBB" based syntax. The documented
>> example specifically uses -c22, too.
>>
>> Either it's okay to prepend unrecognized model strings, then you sho=
uld
>> update zynq-parallella.dts as well (I put the model in a comment the=
re)
>> or use the official strings like I used and keep the readable models=
 as
>> comments. Documenting all those "marvell,88e1116r", "marvell,88e1518=
",
>> "marvell,88e1318" PHY bindings and possibly prepending them to the I=
D
>> based strings would be another option, of course.
>
> These phy-bindings are everything than obvious to me. It seems the do=
cs
> are spread across a couple of different files and not fully up to dat=
e
> either. I basically tried to get something working out of the docs, t=
he
> parallela and our vendor DT files.

There is one file that describes everything that is needed in
Documentation/devicetree/bindings/net/phy.txt, if it is not clear,
patches are welcome.

>
> So my thinkings:
>  - the compatible string with the -c22 is used and documented in the =
phy
>    bindings, it should be there.

The clause 22 compatible string is not used, but we do need it to know
it is not a clause 45 PHY, which implicitly makes the clause 22
compatible string used.

>  - the ID based strings seem to be not needed since, IIUC, the core
>    reads the ID from the PHY and uses it, so I just left it out not
>    trying to figure out how to obtain the correct ID

It is not needed, but it is one way to specify a PHY device if you do
not know what compatible string to use instead.

>  - the marvell compatible strings are used in our vendor tree. They
>    aren't used anywhere but in our vendor tree. I though keeping them=
 is
>    nice since it identifies the PHY fully. And in case that level of
>    detail is needed at some point it is already there.

And this is the recommended way to do it in case we ever need to key a
software decision based on the hardware.

>
> Assuming that we wanna keep things this way, I'm happy to re-spin thi=
s
> patch and also add a similar compatible string to the parallela DT.

Your initial patchset is correct with repesct to how the Device Tree
binding for Ethernet PHY nodes is defined.

>
>         Thanks,
>         S=C3=B6ren
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



--=20
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
