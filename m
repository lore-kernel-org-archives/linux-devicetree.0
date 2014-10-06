From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 0/2] mfd: tps65217: adds support for compatible string
 of subdevices
Date: Mon, 6 Oct 2014 22:24:23 +0100
Message-ID: <20141006212423.GG18035@lee--X1>
References: <3630485.2UAvhovk8D@lenovobook>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3630485.2UAvhovk8D@lenovobook>
Sender: linux-kernel-owner@vger.kernel.org
To: Johannes Pointner <johannes.pointner@gmail.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 25 Sep 2014, Johannes Pointner wrote:

> This patchset adds the of_compatible string for the subdevices of the=
 tps65217.
>=20
> The TPS65217 is missing of_compatible string in the mfd_cell for its
> subdevices. This compatible string is necessary to use functions like
> of_find_backlight_by_node in backlight.c.
>=20
> Change since v1:
> 1. Clarified new compatible string is for sub-node
> 2. Split the patch=20
>=20
> Johannes Pointner (2):
>   mfd: tps65217: add compatible string for subdevices
>   dt: bindings: tps65217: add compatible property for subnodes

When you send patch-sets, can you do so '--thread'?  See the `git
send-email` man page.

>  Documentation/devicetree/bindings/regulator/tps65217.txt         | 7=
 ++++++-
>  .../devicetree/bindings/video/backlight/tps65217-backlight.txt   | 9=
 ++++++---
>  drivers/mfd/tps65217.c                                           | 2=
 ++
>  3 files changed, 14 insertions(+), 4 deletions(-)
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
