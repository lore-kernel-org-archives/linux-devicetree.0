From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/5] Support for Broadcom Vulcan ARM64 processor
Date: Sat, 20 Feb 2016 11:50:38 -0800
Message-ID: <56C8C38E.50007@gmail.com>
References: <1455977964-8099-1-git-send-email-jchandra@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455977964-8099-1-git-send-email-jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 20/02/2016 06:19, Jayachandran C a =C3=A9crit :
> This patchset adds support for Broadcom's Vulcan ARM64 processor.
> The changes are to add the device tree files, documentation for the
> device tree, cpu ID and the maintainers entry.
>=20
> This is v2 of the patchset, changelog below:
>=20
> v1->v2 :
>  - dts: remove memreserve, use brcm,vulcan-soc for board
>    (to address comments from Mark Rutland)
>  - Fixup copyright (Broadcomp corp -> Broadcom)
>    (suggested by Florian Fainelli)
>  - Rename dts from brcm-vulcan* to vulcan*
>    (suggested by Ray Jui)
>  - Add maintainers entry
>    (suggested by Florian Fainelli)
>  - Updated the device tree doc and fixed a couple of commit
>    comments
>=20
> Jayachandran C (4):
>   dt-bindings: Add documentation for Broadcom Vulcan
>   arm64: defconfig: Add Broadcom Vulcan to defconfig
>   arm64: cputype info for Broadcom Vulcan
>   MAINTAINERS: Add entry for Broadcom Vulcan SoC
>=20
> Zi Shen Lim (1):
>   arm64: Broadcom Vulcan support

All applied and submitted for 4.6 thanks!
--=20
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
