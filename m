From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [STLinux Kernel] [PATCH 1/1] i2c: i2c-st: Rename clock reference
 to something that exists
Date: Wed, 21 Jan 2015 15:26:41 +0000
Message-ID: <20150121152641.GE22024@x1>
References: <1409234523-20240-1-git-send-email-lee.jones@linaro.org>
 <53FF3D55.40006@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53FF3D55.40006@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <maxime.coquelin@st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@stlinux.com, wsa@the-dreams.de
List-Id: devicetree@vger.kernel.org

On Thu, 28 Aug 2014, Maxime Coquelin wrote:
> On 08/28/2014 04:02 PM, Lee Jones wrote:
> >CLK_S_ICN_REG_0 hasn't existed for a while now.  This was renamed
> >over a few commits, then finally removed in commit 5aa02b9 (ARM:
> >STi: DT: STiH415: Remove unused CLK_S_ICN_REG_0 fixed clock).
> >
> >Signed-off-by: Lee Jones <lee.jones@linaro.org>
>=20
> Maybe it will be part of my next pull-requests, but in case it is
> not, you can add my:
> Acked-by: Maxime Coquelin <maxime.coquelin@st.com>

Still nothing from the big man.

Can you just take this please Maxime?

> >---
> >  Documentation/devicetree/bindings/i2c/i2c-st.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/Documentation/devicetree/bindings/i2c/i2c-st.txt b/Docu=
mentation/devicetree/bindings/i2c/i2c-st.txt
> >index 437e0db..4c26fda 100644
> >--- a/Documentation/devicetree/bindings/i2c/i2c-st.txt
> >+++ b/Documentation/devicetree/bindings/i2c/i2c-st.txt
> >@@ -31,7 +31,7 @@ i2c0: i2c@fed40000 {
> >  	compatible	=3D "st,comms-ssc4-i2c";
> >  	reg		=3D <0xfed40000 0x110>;
> >  	interrupts	=3D  <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
> >-	clocks		=3D <&CLK_S_ICN_REG_0>;
> >+	clocks		=3D <&clk_s_a0_ls CLK_ICN_REG>;
> >  	clock-names	=3D "ssc";
> >  	clock-frequency =3D <400000>;
> >  	pinctrl-names	=3D "default";
> >

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
