From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
Subject: Re: [PATCHv5] drivers/amba: add reset control to amba bus probe
Date: Tue, 27 Aug 2019 15:25:24 -0400
Message-ID: <30608.1566933924@turing-police>
References: <20190826154252.22952-1-dinguyen@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1566933924_1612P";
         micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190826154252.22952-1-dinguyen@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux@armlinux.org.uk, frowand.list@gmail.com, keescook@chromium.org, anton@enomsg.org, ccross@android.com, tony.luck@intel.com, daniel.thompson@linaro.org, linus.walleij@linaro.org, manivannan.sadhasivam@linaro.org, linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de
List-Id: devicetree@vger.kernel.org

--==_Exmh_1566933924_1612P
Content-Type: text/plain; charset=us-ascii

On Mon, 26 Aug 2019 10:42:52 -0500, Dinh Nguyen said:
> The primecell controller on some SoCs, i.e. SoCFPGA, is held in reset by
> default. Until recently, the DMA controller was brought out of reset by the
> bootloader(i.e. U-Boot). But a recent change in U-Boot, the peripherals
> that are not used are held in reset and are left to Linux to bring them
> out of reset.
>
> Add a mechanism for getting the reset property and de-assert the primecell
> module from reset if found. This is a not a hard fail if the reset properti
> is not present in the device tree node, so the driver will continue to
> probe.

Does this DTRT for both old and new U-Boots? My naive reading of this patch
says on an old U-Boot, we end up attempting to bring it out of reset even though
they had already been brought out.

--==_Exmh_1566933924_1612P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBXWWDpAdmEQWDXROgAQIdrxAAon/T5pCtAGieFVjdAdhJjdPwqAhckoGF
6pdEvZoDtGgXHLPcNmX5YO0BXVRyCmQg8x57sEFISk2PrmS2Ax+UCVUpEaLQMjbD
Dd0vJxZKe9Sz95p4ELvhEVvXPVq9+rkIEmWsVUVNGWN4sbpQc7vs2+JtHwFlx+2n
m/taFbOH5qIRVYJQalBesf8WUcltYiA9ox4tKNYDSyKMqWVrGgvkxjO81appgJAZ
78x3eX94SyB2l7pJHNmRYdvr69kdFFzQDSbm1Y8rQnzar03fKUtpRmn1yXGc87wc
SG08stZRhvr+H98MHe4LjkjYNxNO+k6R0q+jmdjMwD+NaDveKt43ydl+xF4kbYbl
GzX+t51GUeU1PWnuHj+frYnUc0hv4N0xwC5SSWQ8vh0+0xQZsxYRluHLSEAw/VRp
Qh8+wBX3rZ8Q8dQfoXPfj9z4DdWgXAlDoB1yAJDtdRG8sdcKfGL71bZjv7hB0Z6I
XWnRsfqNevx/9Ev6shSve1jSHqGuuVb0ggOQVIcR9qaEeXI9UiRHOgK4qahEA6rI
Im7p+uPlHE4agtwgvXy4QTXksuKqFj8xouyI9QQc5PtI60bT83/PXQzS7ywotkZh
mFrpIGzD7D4xB4dQY4MB4jrGlPIArWfIKkqQ9jnTgD5dugR1CfejVwe7im0Lotyt
0bip0m4JQ/U=
=XqAz
-----END PGP SIGNATURE-----

--==_Exmh_1566933924_1612P--
