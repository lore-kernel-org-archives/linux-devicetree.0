From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 2/7] Documentation: dt: brcmstb: add waketimer
 documentation
Date: Sat, 12 Sep 2015 12:58:51 -0700
Message-ID: <55F483FB.1010109@gmail.com>
References: <1434672696-13632-1-git-send-email-computersforpeace@gmail.com>
 <1434672696-13632-3-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434672696-13632-3-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Le 06/18/15 17:11, Brian Norris a =C3=A9crit :
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Although the binding looks good to me, I am not applying this one just
yet since we would want to merge the wake-timer driver and its binding
at the same time, thanks!

> ---
>  .../bindings/soc/brcmstb/brcm,brcmstb-waketimer.txt  | 20 ++++++++++=
++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/brcmstb/brc=
m,brcmstb-waketimer.txt
>=20
> diff --git a/Documentation/devicetree/bindings/soc/brcmstb/brcm,brcms=
tb-waketimer.txt b/Documentation/devicetree/bindings/soc/brcmstb/brcm,b=
rcmstb-waketimer.txt
> new file mode 100644
> index 000000000000..68c4329b6af0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/brcmstb/brcm,brcmstb-wake=
timer.txt
> @@ -0,0 +1,20 @@
> +* Broadcom STB Wake-up Timer
> +
> +The Broadcom STB wake-up timer provides a high-resolution timer, wit=
h the
> +ability to wake up the system from low-power suspend/standby modes.
> +
> +Required properties:
> +- compatible     : should contain "brcm,brcmstb-waketimer"
> +- reg            : the register start and length for the WKTMR block
> +- interrupts     : The TIMER interrupt
> +- interrupt-parent: The phandle to the Always-On (AON) Power Managem=
ent (PM) L2
> +                    interrupt controller node
> +
> +Example:
> +
> +waketimer@f0411580 {
> +	compatible =3D "brcm,brcmstb-waketimer";
> +	reg =3D <0xf0411580 0x14>;
> +	interrupts =3D <0x3>;
> +	interrupt-parent =3D <&aon_pm_l2_intc>;
> +};
>=20


--=20
=46lorian
