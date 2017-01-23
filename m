From: Alexander Kochetkov <al.kochet@gmail.com>
Subject: Re: [PATCH v4 6/9] clocksource/drivers/rockchip_timer: split bc_timer into rk_timer and rk_clock_event_device
Date: Mon, 23 Jan 2017 19:45:10 +0300
Message-ID: <EA64873A-7F03-4095-BE38-939183B6457E@gmail.com>
References: <1480343486-25539-1-git-send-email-al.kochet@gmail.com> <1480436092-10728-1-git-send-email-al.kochet@gmail.com> <1480436092-10728-7-git-send-email-al.kochet@gmail.com> <20170123162624.GG2166@mai>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170123162624.GG2166@mai>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, LAK <linux-arm-kernel@lists.infradead.org>, linux-rockchip@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Heiko Stuebner <heiko@sntech.de>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Caesar Wang <wxt@rock-chips.com>, Huang Tao <huangtao@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Daniel, thanks for reviewing patches!

> 23 =D1=8F=D0=BD=D0=B2. 2017 =D0=B3., =D0=B2 19:26, Daniel Lezcano =
<daniel.lezcano@linaro.org> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=
=B0):
>=20
> On Tue, Nov 29, 2016 at 07:14:49PM +0300, Alexander Kochetkov wrote:
>> The patch move ce field out of struct bc_timer into struct
>> rk_clock_event_device and rename struct bc_timer to struct rk_timer.
>=20
> Why ?

Single rockchip timer can be either broadcast timer/clockevent (current =
implementation) or
clocksource (the one I=E2=80=99ve implemented in series). Both =
implementations based on
low level timer routines (rk_timer_disable, rk_timer_enable, =
rk_timer_update_counter,=20
rk_timer_counter_read and so on). Both implementations use timers in =
different modes
(interrupts vs free running). In order to distinguish this concepts I =
tried to split
low level timer routines from bc_timer.

Otherwise I can place all needed clocksource filelds into 'struct =
bc_timer=E2=80=99 and rename 'struct bc_timer=E2=80=99
into 'struct rk_timer=E2=80=99. If this is more clear solution I can =
rewrite patches.

Alexander.=
