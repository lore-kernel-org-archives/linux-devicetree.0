From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/1] i2c: i2c-st: Rename clock reference to something
 that exists
Date: Thu, 22 Jan 2015 12:18:19 +0000
Message-ID: <20150122121819.GC9129@x1>
References: <1409234523-20240-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1409234523-20240-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, wsa@the-dreams.de, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Wolfram,

This patch has been on the list since forever.

I have Acks from the driver author, so I'm going to take this through
the MFD tree.  If you perk up later and decide to take it though the
I2C tree instead, let me know and I'll remove it from MFD.

> CLK_S_ICN_REG_0 hasn't existed for a while now.  This was renamed
> over a few commits, then finally removed in commit 5aa02b9 (ARM:
> STi: DT: STiH415: Remove unused CLK_S_ICN_REG_0 fixed clock).
>=20
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-st.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-st.txt b/Docum=
entation/devicetree/bindings/i2c/i2c-st.txt
> index 437e0db..4c26fda 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-st.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-st.txt
> @@ -31,7 +31,7 @@ i2c0: i2c@fed40000 {
>  	compatible	=3D "st,comms-ssc4-i2c";
>  	reg		=3D <0xfed40000 0x110>;
>  	interrupts	=3D  <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
> -	clocks		=3D <&CLK_S_ICN_REG_0>;
> +	clocks		=3D <&clk_s_a0_ls CLK_ICN_REG>;
>  	clock-names	=3D "ssc";
>  	clock-frequency =3D <400000>;
>  	pinctrl-names	=3D "default";

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
