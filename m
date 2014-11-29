From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL] Broadcom STB GISB bus driver for 3.19
Date: Fri, 28 Nov 2014 16:14:15 -0800
Message-ID: <54790FD7.9060509@gmail.com>
References: <1417218722-29944-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417218722-29944-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 28/11/2014 15:52, Florian Fainelli a =C3=A9crit :
> The following changes since commit f114040e3ea6e07372334ade75d1ee0775=
c355e1:
>=20
>   Linux 3.18-rc1 (2014-10-19 18:08:38 -0700)
>=20
> are available in the git repository at:
>=20
>   https://github.com/brcm/linux.git tags/arm-soc/for-3.19/brcmstb-dri=
vers
>=20
> for you to fetch changes up to 7938c2c819d7ec0e1f7d6b97acbd19c344139e=
b7:
>=20
>   bus: brcmstb_gisb: Honor the "big-endian" and "native-endian" DT pr=
operties (2014-11-28 15:44:44 -0800)
>=20
> ----------------------------------------------------------------
> This pull request contains the following changes to the Broadcom GISB=
 bus
> arbiter from Kevin Cernekee:
>=20
> - Extend brcmstb GISB bus driver to work on MIPS (currently ARM-only)=
 and support
>   65nm and 40nm MIPS-based chips such as: BCM7038, BCM7400 and BCM743=
5
>=20
> - Extend brcmstb GISB bus driver to work on BE systems (currently LE-=
only).
>=20
> ----------------------------------------------------------------
> Kevin Cernekee (5):
>       bus: brcmstb_gisb: Make the driver buildable on MIPS
>       bus: brcmstb_gisb: Introduce wrapper functions for MMIO accesse=
s
>       bus: brcmstb_gisb: Look up register offsets in a table
>       bus: brcmstb_gisb: Add register offset tables for older chips
>       bus: brcmstb_gisb: Honor the "big-endian" and "native-endian" D=
T properties

This patch depends on of_device_is_big_endian() which I thought would
make it through 3.19 via Grant's tree, I will resubmit this pull reques=
t
without the last patch until of_device_is_big_endian() has made it to
the tree.

Thanks

>=20
>  .../devicetree/bindings/bus/brcm,gisb-arb.txt      |   6 +-
>  drivers/bus/Kconfig                                |   2 +-
>  drivers/bus/brcmstb_gisb.c                         | 127 +++++++++++=
+++++++---
>  3 files changed, 114 insertions(+), 21 deletions(-)
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
