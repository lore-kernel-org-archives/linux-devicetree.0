From: Alexander Kochetkov <al.kochet@gmail.com>
Subject: Re: [PATCH v5 3/8] ARM: dts: rockchip: add timer entries to rk3188 SoC
Date: Mon, 30 Jan 2017 14:20:13 +0300
Message-ID: <A5940770-B960-4409-8DA4-BE39EF9A6325@gmail.com>
References: <1485260203-14216-1-git-send-email-al.kochet@gmail.com> <1485260203-14216-4-git-send-email-al.kochet@gmail.com> <20170130110428.GC2206@mai>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170130110428.GC2206@mai>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Caesar Wang <wxt@rock-chips.com>, Huang Tao <huangtao@rock-chips.com>
List-Id: devicetree@vger.kernel.org


> 30 =D1=8F=D0=BD=D0=B2. 2017 =D0=B3., =D0=B2 14:04, Daniel Lezcano =
<daniel.lezcano@linaro.org> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=
=B0):
>=20
> t is up to the RTC to wake up the system from suspend and there is no
> idle state stopping the local timers on these SoCs. So, the rockchip =
timers
> won't be ever used on the rk3188, right ?

No rockchip timers where used on rk3188 before.

Actually, I don=E2=80=99t know how to test backup timer functionality. =
rk3228 backup timer is from alive
subsystem. It is unclear from TRM what this mean, I assume that somehow =
related to CLK
during suspend. So I pick the timer from alive subsystem on rk3188 also.
DT timer configuration where tested: interrupts and IO works.

> This patch should go after the rockchip timer patches


Ok, let me know, when I should send v6. Or may be you change the order =
of the patches
during merge.

And thank you for fixing commit message for previous patch.
Feel free to tell me than I write something really unclear or incorrect.

Alexander.
