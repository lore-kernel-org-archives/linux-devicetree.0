From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [GIT PULL] mfd: regulator: S2MPA01 device support IB for Mark Brown
Date: Tue, 18 Mar 2014 14:10:33 +0100
Message-ID: <1395148233.24909.2.camel@AMDC1943>
References: <1394797919-24642-1-git-send-email-sachin.kamat@linaro.org>
 <20140318110947.GR25478@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20140318110947.GR25478@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

It seems that Sachin's and my patches (mfd: sec: Add support for
S2MPS14) are not in sync. Now the error appears:

drivers/mfd/sec-core.c:342:45: warning: =E2=80=98regmap_rtc=E2=80=99 ma=
y be used
uninitialized in this function [-Wuninitialized]

I'll send a quick fix for it but in a longterm the rtc-s5m driver shoul=
d
initialize his regmap on his own.

Best regards,
Krzysztof

O
n Tue, 2014-03-18 at 11:09 +0000, Lee Jones wrote:
> FAO Mark,
>=20
> The following changes since commit 0414855fdc4a40da05221fc6062cccbc0c=
30f169:
>=20
>   Linux 3.14-rc5 (2014-03-02 18:56:16 -0800)
>=20
> are available in the git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-re=
gulator-3.15
>=20
> for you to fetch changes up to ba3e31f87e8b736adf01f1dc09cd5618966ee1=
93:
>=20
>   Documentation: mfd: Add binding document for S2MPA01 (2014-03-18 10=
:56:45 +0000)
>=20
> ----------------------------------------------------------------
> Krzysztof Kozlowski (5):
>       mfd: sec-core: Add maximum RTC register for regmap config
>       mfd: sec-core: Select different RTC regmaps for devices
>       mfd: sec-irq: Use consistent S2MPS11 RTC alarm interrupt indexe=
s
>       mfd: sec: Add support for S2MPS14
>       mfd: sec-core: Fix possible NULL pointer dereference when i2c_n=
ew_dummy error
>=20
> Pankaj Dubey (1):
>       mfd: sec-core: Silence compiler warning
>=20
> Sachin Kamat (3):
>       mfd: Add support for S2MPA01 device
>       regulator: Add support for S2MPA01 regulator
>       Documentation: mfd: Add binding document for S2MPA01
>=20
>  Documentation/devicetree/bindings/mfd/s2mpa01.txt |  90 ++++++++++++=
++++++++++++++
>  drivers/mfd/sec-core.c                            | 112 ++++++++++++=
+++++++++++++++++---
>  drivers/mfd/sec-irq.c                             |  97 ++++++++++++=
++++++++++++++--
>  drivers/regulator/Kconfig                         |   7 ++
>  drivers/regulator/Makefile                        |   1 +
>  drivers/regulator/s2mpa01.c                       | 481 ++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/samsung/core.h                  |  19 ++++--
>  include/linux/mfd/samsung/irq.h                   |  81 ++++++++++++=
+++++++++++-
>  include/linux/mfd/samsung/rtc.h                   |  57 ++++++++++++=
+++--
>  include/linux/mfd/samsung/s2mpa01.h               | 192 ++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/samsung/s2mps14.h               | 152 ++++++++++++=
++++++++++++++++++++++++++++++++
>  11 files changed, 1260 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/s2mpa01.txt
>  create mode 100644 drivers/regulator/s2mpa01.c
>  create mode 100644 include/linux/mfd/samsung/s2mpa01.h
>  create mode 100644 include/linux/mfd/samsung/s2mps14.h
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
