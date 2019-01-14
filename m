From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/2] Allwinner A64 timer workaround
Date: Mon, 14 Jan 2019 13:56:55 +0100
Message-ID: <9738319a-4154-62be-2325-2873dfb326dc@linaro.org>
References: <20190113021719.46457-1-samuel@sholland.org>
Reply-To: daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDIYTLXUW4BRBGUO6LQQKGQEJ5O67VY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190113021719.46457-1-samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 13/01/2019 03:17, Samuel Holland wrote:
> This is the third version of a patch series to fix system clock jumps
> and other timer instability on the Allwinner A64 SoC. It has now been
> tested for a week, and I've received no reports of date jumps with this
> version. So this is, as far as I can tell, a complete workaround.
>=20
> See the commit messages for a detailed description of the issue, but the
> summary is that, when a high counter bit rolls over, indeterminance in
> the low bits causes CNTPCT/CNTVCT and their respective TVAL registers to
> jump forward or backward. Backward jumps (or the next read after forward
> jumps) are sometimes seen by the kernel and interpreted as the timer
> wrapping around after 2^56 cycles. This causes the system clock to jump
> forward approximately 91 years.
>=20
> changes since v2;
> - Reduced workaround threshold from 11 to 10 bits based on reports from
>   other hardare and the U-Boot version of this workaround
> - Added TVAL handling based on Marc's suggestion
> - Added erratum documentation and renamed symbols to match
> - Added Maxime's Acked-by
>=20
> changes since v1:
> - Add an iteration limit like most other arch timer workarounds
> - Added Andre's Tested-by
>=20
> Samuel Holland (2):
>   arm64: arch_timer: Workaround for Allwinner A64 timer instability
>   arm64: dts: allwinner: a64: Enable A64 timer workaround
>=20
>  Documentation/arm64/silicon-errata.txt        |  2 +
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  1 +
>  drivers/clocksource/Kconfig                   | 10 ++++
>  drivers/clocksource/arm_arch_timer.c          | 55 +++++++++++++++++++
>  4 files changed, 68 insertions(+)
>=20

Applied. Took the opportunity to add the stable@ tag.

Thanks

  -- Daniel


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM=
 SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
