From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v4 3/8] Documentation: devicetree: rockchip: Document GeekBox
Date: Tue, 29 Mar 2016 23:21:51 +0200
Message-ID: <1682289.HWd4yLL18I@diego>
References: <1458136727-32075-1-git-send-email-afaerber@suse.de> <31070685.TnxqGeNupO@diego> <56FAE95E.6060900@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56FAE95E.6060900@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 29. M=E4rz 2016, 22:45:18 schrieb Andreas F=E4rber:
> Am 29.03.2016 um 22:13 schrieb Heiko St=FCbner:
> > Am Mittwoch, 16. M=E4rz 2016, 14:58:41 schrieb Andreas F=E4rber:
> >> Use "geekbuying,geekbox" compatible string.
> >>=20
> >> Acked-by: Rob Herring <robh@kernel.org>
> >> Signed-off-by: Andreas F=E4rber <afaerber@suse.de>
> >=20
> > I've folded this patch into the geekbox dts patch, carrying Rob's A=
ck for
> > the binding over.
>=20
> Either you just made a mistake in my name or
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree=
/Docume
> ntation/devicetree/bindings/submitting-patches.txt needs an update. I=
t
> clearly says:
>=20
> "1) The Documentation/ portion of the patch should be a separate patc=
h."
>=20
> That's why I always do it this way.

looking at the dt-bindings git log, it seems that is handled in a varie=
ty of=20
ways :-) . Personally I'm doing completely new bindings separately but =
the=20
125th addition of a board just inside the dts patch.

But I guess we can also move it out again into a separate patch if you =
prefer=20
that :-) .


Heiko
