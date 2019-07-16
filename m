From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] of/fdt: Make sure no-map does not remove already reserved regions
Date: Tue, 16 Jul 2019 15:35:44 -0700
Message-ID: <5d2e5141.1c69fb81.ef731.8450@mx.google.com>
References: <20190703050827.173284-1-drinkcat@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703050827.173284-1-drinkcat@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ian Campbell <ian.campbell@citrix.com>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Quoting Nicolas Boichat (2019-07-02 22:08:27)
> If the device tree is incorrectly configured, and attempts to
> define a "no-map" reserved memory that overlaps with the kernel
> data/code, the kernel would crash quickly after boot, with no
> obvious clue about the nature of the issue.
>=20
> For example, this would happen if we have the kernel mapped at
> these addresses (from /proc/iomem):
> 40000000-41ffffff : System RAM
>   40080000-40dfffff : Kernel code
>   40e00000-411fffff : reserved
>   41200000-413e0fff : Kernel data
>=20
> And we declare a no-map shared-dma-pool region at a fixed address
> within that range:
> mem_reserved: mem_region {
>         compatible =3D "shared-dma-pool";
>         reg =3D <0 0x40000000 0 0x01A00000>;
>         no-map;
> };
>=20
> To fix this, when removing memory regions at early boot (which is
> what "no-map" regions do), we need to make sure that the memory
> is not already reserved. If we do, __reserved_mem_reserve_reg
> will throw an error:
> [    0.000000] OF: fdt: Reserved memory: failed to reserve memory
>    for node 'mem_region': base 0x0000000040000000, size 26 MiB
> and the code that will try to use the region should also fail,
> later on.
>=20
> We do not do anything for non-"no-map" regions, as memblock
> explicitly allows reserved regions to overlap, and the commit
> that this fixes removed the check for that precise reason.
>=20
> Fixes: 094cb98179f19b7 ("of/fdt: memblock_reserve /memreserve/ regions in=
 the case of partial overlap")
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
