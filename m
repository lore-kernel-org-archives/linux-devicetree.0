From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/3] devicetree: bindings: Document qcom,msm-id and qcom,board-id
Date: Tue, 10 Mar 2015 20:52:01 +0100
Message-ID: <10886228.vUHyKm1ubP@wuerfel>
References: <1425503602-24916-1-git-send-email-galak@codeaurora.org> <CAOesGMjJXyjNH-Lm66mZXq0X=52DyRtdmpvQ4sFEr0cMAp3b-w@mail.gmail.com> <3A588B25-66ED-4BB5-8C8F-D050D8A2F9F3@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <3A588B25-66ED-4BB5-8C8F-D050D8A2F9F3@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

On Tuesday 10 March 2015 13:10:08 Kumar Gala wrote:
> >>>>>>>>> The top level qcom,msm-id and qcom,board-id are utilized by=
 bootloaders
> >>>>>>>>>> on Qualcomm MSM platforms to determine which device tree s=
hould be
> >>>>>>>>>> utilized and passed to the kernel.
> >>>>>>>>>>=20
> >>>>>>>>>> Cc: <devicetree@vger.kernel.org>
> >>>>>>>>>> Signed-off-by: Kumar Gala <galak@codeaurora.org>
> >>>>>>>>>=20
> >>>>>>>>> Is this the special magic that allows qcom bootloaders to t=
ake a kernel
> >>>>>>>>> plus multiple DTBs and figure out which DTB to pass?
> >>>>>>>>>=20
> >>>>>>>>> Kevin
> >>>>>>>>=20
> >>>>>>>> yes
> >>>>>>>=20
> >>>>>>> That's a bummer.
> >>>>>>>=20
> >>>>>>> Luckily, the solution for upstream is still quite simple: Pro=
vide only
> >>>>>>> one devicetree, and it'll be used, right?
> >>>>>>=20
> >>>>>> We can provide only one, we still need the IDs in the DT.
> >>>>>=20
> >>>>> How are the DTS provided? Concatenated with the kernel, or in a
> >>>>> wrapped data format? Or in a separate partition from the kernel=
?
> >>>>=20
> >>>> Its a wrapped data format that is than concatenated with the ker=
nel if I remember correctly.
> >>>=20
> >>> Then you should be able to create a tool that can write this conc=
atenated
> >>> format and insert these properties from a table that matches the =
boot
> >>> loader, right?
> >>>=20
> >>>      Arnd
> >>=20
> >> Are you suggesting the tool insert the properties in the DT?  I=E2=
=80=99m not sure I understand what the point of doing that would be.
> >=20
> > To insert platform-local properties that mean nothing outside of th=
e
> > firmware packaging of the device trees, which is the case here?
> >=20
> > I think the idea of having the installer script inserting them is
> > quite reasonable in this case.
> >=20
> >=20
> > -Olof
>=20
> These values are static, so not sure what the point of having the ins=
taller script do that?
>=20

It combines two hacks to work around a nonstandard boot loader.
Once the bootloader is fixed, you can stop using that script.

	Arnd
