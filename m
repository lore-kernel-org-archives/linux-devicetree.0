From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Fri, 11 Sep 2015 10:39:12 +0100
Message-ID: <20150911093912.GR3260@x1>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd>
 <20150910141809.GA21497@griffinp-ThinkPad-X1-Carbon-2nd>
 <20150911091700.GI3260@x1>
 <2118137.GXlnLUTVv7@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2118137.GXlnLUTVv7@wuerfel>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 11 Sep 2015, Arnd Bergmann wrote:

> On Friday 11 September 2015 10:17:00 Lee Jones wrote:
> > <hijacking>
> >=20
> > That doesn't work for middle-layer drivers such as Remoteproc, wher=
e
> > it doesn't have its own associated firmwares.  Remoteproc's job is
> > simply to load the firmware.  It doesn't care which version of the =
ABI
> > that particular binary uses, and has no reason to.  Ideally, I gues=
s
> > the Remoteproc client should be providing the firmware name, but wh=
y
> > should the client care who or what was used to load the firmware?
> >=20
> > </hijacking>
> >=20
>=20
> Does remoteproc use request_firmware() then?

Yes ...

> If not, it's irrelevant to this discussion.

=2E.. but even if it didn't, it would still be relevant, as it's a
"should firmware names be in DT" discussion.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
