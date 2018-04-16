From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 00/10] Allwinner H3 DVFS support
Date: Mon, 16 Apr 2018 12:41:17 +0800
Message-ID: <CAGb2v67FaU3_su9XGaGj4zVSoAnpfN8cAhbBHEJu3Owt=Qicmg@mail.gmail.com>
References: <20180206044905.30508-1-icenowy@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBA6T2DLAKGQEZTQRVQQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180206044905.30508-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Feb 6, 2018 at 12:48 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> This patchset tries to add DVFS support for Allwinner H3 SoC,
> considering two kinds of adjustable regulators used on H3 boards:
> SY8106A I2C-controlled regulator and SY8113B regulator (controllable
> by GPIO with some special designs on the board), and also taking the
> uncontrollable boards into consider.
>
> PATCH 1 and PATCH 2 are for the SY8106A regulator, then PATCH 3 and
> PATCH 4 are for the r_i2c bus, which is used by boards with SY8106A
> to communicate with the regulator.
>
> PATCH 5 adds the operating points v2 table to the H3 SoC, but with
> OPPs higher than 1008MHz temporarily dropped.
>
> Then there's patches for several tested boards: Orange Pi PC (with
> SY8106A), Orange Pi One/Zero (with GPIO-adjustable SY8113B) and
> ALL-H3-CC (unadjustable).
>
> Icenowy Zheng (5):
>   ARM: sun8i: h3: add operating-points-v2 table for CPU
>   ARM: sun8i: h2+: add SY8113B regulator used by Orange Pi Zero board
>   ARM: sun8i: h3: add SY8113B regulator used by Orange Pi One board
>   ARM: sun8i: h3: fix ALL-H3-CC H3 ver VDD-CPUX voltage
>   ARM: sun8i: h3: set the cpu-supply to VDD-CPUX on ALL-H3-CC H3 ver
>
> Ondrej Jirman (5):
>   dt-bindings: add binding for the SY8106A voltage regulator
>   regulator: add support for SY8106A regulator
>   ARM: sunxi: h3/h5: Add r_i2c pinmux node
>   ARM: sunxi: h3/h5: Add r_i2c I2C controller
>   ARM: sun8i: h3: Add SY8106A regulator to Orange Pi PC

I've applied all the device tree patches for 4.18, taking into account
comments from Maxime. See

    https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git/log/?h=sunxi/h3-h5-for-4.17

Mostly it's just renaming the regulator node names and labels.

Please resend the first two patches to Mark Brown, the regulator
subsystem maintainer. And you might want to mention the branch
above in case he needs a use case reference.

Regards
ChenYu
