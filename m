From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 0/2] Allwinner A64 timer workaround
Date: Tue, 15 Jan 2019 10:52:08 +0800
Message-ID: <CAGb2v66Hmn2QBN++X8h94E_Vwe1uZ67zz5TTGiwUJJe4nCWgXQ@mail.gmail.com>
References: <20190113021719.46457-1-samuel@sholland.org> <9738319a-4154-62be-2325-2873dfb326dc@linaro.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBZ4V6XQQKGQEANAGBGY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <9738319a-4154-62be-2325-2873dfb326dc-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 14, 2019 at 8:57 PM Daniel Lezcano
<daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
> On 13/01/2019 03:17, Samuel Holland wrote:
> > This is the third version of a patch series to fix system clock jumps
> > and other timer instability on the Allwinner A64 SoC. It has now been
> > tested for a week, and I've received no reports of date jumps with this
> > version. So this is, as far as I can tell, a complete workaround.
> >
> > See the commit messages for a detailed description of the issue, but the
> > summary is that, when a high counter bit rolls over, indeterminance in
> > the low bits causes CNTPCT/CNTVCT and their respective TVAL registers to
> > jump forward or backward. Backward jumps (or the next read after forward
> > jumps) are sometimes seen by the kernel and interpreted as the timer
> > wrapping around after 2^56 cycles. This causes the system clock to jump
> > forward approximately 91 years.
> >
> > changes since v2;
> > - Reduced workaround threshold from 11 to 10 bits based on reports from
> >   other hardare and the U-Boot version of this workaround
> > - Added TVAL handling based on Marc's suggestion
> > - Added erratum documentation and renamed symbols to match
> > - Added Maxime's Acked-by
> >
> > changes since v1:
> > - Add an iteration limit like most other arch timer workarounds
> > - Added Andre's Tested-by
> >
> > Samuel Holland (2):
> >   arm64: arch_timer: Workaround for Allwinner A64 timer instability
> >   arm64: dts: allwinner: a64: Enable A64 timer workaround
> >
> >  Documentation/arm64/silicon-errata.txt        |  2 +
> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  1 +
> >  drivers/clocksource/Kconfig                   | 10 ++++
> >  drivers/clocksource/arm_arch_timer.c          | 55 +++++++++++++++++++
> >  4 files changed, 68 insertions(+)
> >
>
> Applied. Took the opportunity to add the stable@ tag.

Not seeing it in tip just yet. Was it applied for -rc or -next?
Need to know which branch to apply the device tree patch to.

Thanks
ChenYu
