From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: berlin: enable i2c0 and i2c2
Date: Mon, 16 Jun 2014 13:23:17 +0200
Message-ID: <539ED3A5.5050300@gmail.com>
References: <1401780790-17830-1-git-send-email-antoine.tenart@free-electrons.com> <1401780790-17830-3-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1401780790-17830-3-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QW50b2luZSBUw6luYXJ0?= <antoine.tenart@free-electrons.com>
Cc: alexandre.belloni@free-electrons.com, thomas.petazzoni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/03/2014 09:33 AM, Antoine T=C3=A9nart wrote:
> Enable the I2C0 and I2C2 for the Marvell Berlin BG2G DMP. I2C1 and I2=
C3
> are also working on this board, but no devices seemed to be there.
>
> Signed-off-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com=
>

Applied to berlin/dt with Andrew's Reviewed-by.

Thanks!

> ---
>   arch/arm/boot/dts/berlin2q-marvell-dmp.dts | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts b/arch/arm/bo=
ot/dts/berlin2q-marvell-dmp.dts
> index 995150f93795..a357ce02a64e 100644
> --- a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
> +++ b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
> @@ -34,6 +34,14 @@
>   	status =3D "okay";
>   };
>
> +&i2c0 {
> +	status =3D "okay";
> +};
> +
> +&i2c2 {
> +	status =3D "okay";
> +};
> +
>   &uart0 {
>   	status =3D "okay";
>   };
>
