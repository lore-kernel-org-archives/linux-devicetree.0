From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 1/2] arm64: arch_timer: Workaround for
 Allwinner A64 timer instability
Date: Mon, 14 Jan 2019 09:25:10 +0000
Message-ID: <472c5450-1b60-6ac7-b242-805c2a2f3272@arm.com>
References: <20190113021719.46457-1-samuel@sholland.org>
 <20190113021719.46457-2-samuel@sholland.org>
Reply-To: marc.zyngier-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCPZR5X4TYBBB7FK6HQQKGQET2SMEKA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190113021719.46457-2-samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Samuel,

On 13/01/2019 02:17, Samuel Holland wrote:
> The Allwinner A64 SoC is known[1] to have an unstable architectural
> timer, which manifests itself most obviously in the time jumping forward
> a multiple of 95 years[2][3]. This coincides with 2^56 cycles at a
> timer frequency of 24 MHz, implying that the time went slightly backward
> (and this was interpreted by the kernel as it jumping forward and
> wrapping around past the epoch).
>=20
> Investigation revealed instability in the low bits of CNTVCT at the
> point a high bit rolls over. This leads to power-of-two cycle forward
> and backward jumps. (Testing shows that forward jumps are about twice as
> likely as backward jumps.) Since the counter value returns to normal
> after an indeterminate read, each "jump" really consists of both a
> forward and backward jump from the software perspective.
>=20
> Unless the kernel is trapping CNTVCT reads, a userspace program is able
> to read the register in a loop faster than it changes. A test program
> running on all 4 CPU cores that reported jumps larger than 100 ms was
> run for 13.6 hours and reported the following:
>=20
>  Count | Event
> -------+---------------------------
>   9940 | jumped backward      699ms
>    268 | jumped backward     1398ms
>      1 | jumped backward     2097ms
>  16020 | jumped forward       175ms
>   6443 | jumped forward       699ms
>   2976 | jumped forward      1398ms
>      9 | jumped forward    356516ms
>      9 | jumped forward    357215ms
>      4 | jumped forward    714430ms
>      1 | jumped forward   3578440ms
>=20
> This works out to a jump larger than 100 ms about every 5.5 seconds on
> each CPU core.
>=20
> The largest jump (almost an hour!) was the following sequence of reads:
>     0x0000007fffffffff =E2=86=92 0x00000093feffffff =E2=86=92 0x000000800=
0000000
>=20
> Note that the middle bits don't necessarily all read as all zeroes or
> all ones during the anomalous behavior; however the low 10 bits checked
> by the function in this patch have never been observed with any other
> value.
>=20
> Also note that smaller jumps are much more common, with backward jumps
> of 2048 (2^11) cycles observed over 400 times per second on each core.
> (Of course, this is partially explained by lower bits rolling over more
> frequently.) Any one of these could have caused the 95 year time skip.
>=20
> Similar anomalies were observed while reading CNTPCT (after patching the
> kernel to allow reads from userspace). However, the CNTPCT jumps are
> much less frequent, and only small jumps were observed. The same program
> as before (except now reading CNTPCT) observed after 72 hours:
>=20
>  Count | Event
> -------+---------------------------
>     17 | jumped backward      699ms
>     52 | jumped forward       175ms
>   2831 | jumped forward       699ms
>      5 | jumped forward      1398ms
>=20
> Further investigation showed that the instability in CNTPCT/CNTVCT also
> affected the respective timer's TVAL register. The following values were
> observed immediately after writing CNVT_TVAL to 0x10000000:
>=20
>  CNTVCT             | CNTV_TVAL  | CNTV_CVAL          | CNTV_TVAL Error
> --------------------+------------+--------------------+-----------------
>  0x000000d4a2d8bfff | 0x10003fff | 0x000000d4b2d8bfff | +0x00004000
>  0x000000d4a2d94000 | 0x0fffffff | 0x000000d4b2d97fff | -0x00004000
>  0x000000d4a2d97fff | 0x10003fff | 0x000000d4b2d97fff | +0x00004000
>  0x000000d4a2d9c000 | 0x0fffffff | 0x000000d4b2d9ffff | -0x00004000
>=20
> The pattern of errors in CNTV_TVAL seemed to depend on exactly which
> value was written to it. For example, after writing 0x10101010:
>=20
>  CNTVCT             | CNTV_TVAL  | CNTV_CVAL          | CNTV_TVAL Error
> --------------------+------------+--------------------+-----------------
>  0x000001ac3effffff | 0x1110100f | 0x000001ac4f10100f | +0x1000000
>  0x000001ac40000000 | 0x1010100f | 0x000001ac5110100f | -0x1000000
>  0x000001ac58ffffff | 0x1110100f | 0x000001ac6910100f | +0x1000000
>  0x000001ac66000000 | 0x1010100f | 0x000001ac7710100f | -0x1000000
>  0x000001ac6affffff | 0x1110100f | 0x000001ac7b10100f | +0x1000000
>  0x000001ac6e000000 | 0x1010100f | 0x000001ac7f10100f | -0x1000000
>=20
> I was also twice able to reproduce the issue covered by Allwinner's
> workaround[4], that writing to TVAL sometimes fails, and both CVAL and
> TVAL are left with entirely bogus values. One was the following values:
>=20
>  CNTVCT             | CNTV_TVAL  | CNTV_CVAL
> --------------------+------------+--------------------------------------
>  0x000000d4a2d6014c | 0x8fbd5721 | 0x000000d132935fff (615s in the past)
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Because the CPU can read the CNTPCT/CNTVCT registers faster than they
> change, performing two reads of the register and comparing the high bits
> (like other workarounds) is not a workable solution. And because the
> timer can jump both forward and backward, no pair of reads can
> distinguish a good value from a bad one. The only way to guarantee a
> good value from consecutive reads would be to read _three_ times, and
> take the middle value only if the three values are 1) each unique and
> 2) increasing. This takes at minimum 3 counter cycles (125 ns), or more
> if an anomaly is detected.
>=20
> However, since there is a distinct pattern to the bad values, we can
> optimize the common case (1022/1024 of the time) to a single read by
> simply ignoring values that match the error pattern. This still takes no
> more than 3 cycles in the worst case, and requires much less code. As an
> additional safety check, we still limit the loop iteration to the number
> of max-frequency (1.2 GHz) CPU cycles in three 24 MHz counter periods.
>=20
> For the TVAL registers, the simple solution is to not use them. Instead,
> read or write the CVAL and calculate the TVAL value in software.
>=20
> Although the manufacturer is aware of at least part of the erratum[4],
> there is no official name for it. For now, use the kernel-internal name
> "UNKNOWN1".
>=20
> [1]: https://github.com/armbian/build/commit/a08cd6fe7ae9
> [2]: https://forum.armbian.com/topic/3458-a64-datetime-clock-issue/
> [3]: https://irclog.whitequark.org/linux-sunxi/2018-01-26
> [4]: https://github.com/Allwinner-Homlet/H6-BSP4.9-linux/blob/master/driv=
ers/clocksource/arm_arch_timer.c#L272

nit: In general, I'm not overly keen on URLs in commit messages, as they
may vanish without notice and the commit message becomes less useful. In
the future, please keep those in the cover letter (though in this
particular case, the commit message explains the issue pretty well, so
no harm done once GitHub dies a horrible death... ;-).

The fix itself looks pretty solid, and will hopefully make the
"AllLoosers" HW more usable.

Reviewed-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>

Daniel, please consider this for v5.1.

Thanks,

	M.
--=20
Jazz is not dead. It just smells funny...

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
