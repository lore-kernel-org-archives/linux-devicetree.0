From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 5/5] ARM: dts: STiH407: Add B2120 board support
Date: Mon, 10 Mar 2014 12:37:48 +0000
Message-ID: <20140310123748.GV14976@lee--X1>
References: <1394203251-25361-1-git-send-email-maxime.coquelin@st.com>
 <1394203251-25361-6-git-send-email-maxime.coquelin@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1394203251-25361-6-git-send-email-maxime.coquelin@st.com>
Sender: linux-doc-owner@vger.kernel.org
To: Maxime COQUELIN <maxime.coquelin@st.com>
Cc: Rob Landley <rob@landley.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, Stuart Menefy <stuart.menefy@st.com>, Linus Walleij <linus.walleij@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

> B2120 HDK is the reference board for STiH407 SoC.
> It has the following characteristics:
>  - 1GB DDR3
>  - 8GB eMMC / SD-Card slot
>  - 32MB NOR Flash
>  - 1 x Gbit Ethernet
>  - 1 x USB 3.0 port
>  - 1 x Mini-PCIe
>  - 1 x SATA
>  - 1 x HDMI output
>  - 1 x HDMI input
>  - 1 x SPDIF
>=20
> This patch only introduces basic functionnalities, such as I2C and UA=
RT.
>=20
> Signed-off-by: Maxime Coquelin <maxime.coquelin@st.com>
> Signed-off-by: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> ---
>  arch/arm/boot/dts/Makefile          |  3 +-
>  arch/arm/boot/dts/stih407-b2120.dts | 78 +++++++++++++++++++++++++++=
++++++++++
>  2 files changed, 80 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/stih407-b2120.dts

Patch looks pretty inert:
  Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
