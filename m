From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: correct voltage selector
 Firefly-RK3399
Date: Wed, 20 Jun 2018 11:15:52 +0200
Message-ID: <6592028.l3WmXB2ndK@diego>
References: <20180604171523.28454-1-xypron.glpk@gmx.de>
 <10782218.jfpm9omiT7@phil> <459cb125-a3e2-8f1e-b960-011020d41b3c@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <459cb125-a3e2-8f1e-b960-011020d41b3c@gmx.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vagrant Cascadian <vagrant@debian.org>, Catalin Marinas <catalin.marinas@arm.com>, Shawn Lin <shawn.lin@rock-chips.com>, Will Deacon <will.deacon@arm.com>, Kever Yang <kever.yang@rock-chips.com>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, khilman@baylibre.com, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Pierre-Hugues Husson <phh@phh.me>, Jianqun Xu <jay.xu@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Heinrich,

Am Mittwoch, 20. Juni 2018, 07:59:34 CEST schrieb Heinrich Schuchardt:
> On 06/20/2018 01:21 AM, Heiko Stuebner wrote:
> > Am Donnerstag, 14. Juni 2018, 14:55:27 CEST schrieb Heiko Stuebner:
> >> Am Montag, 4. Juni 2018, 19:15:23 CEST schrieb Heinrich Schuchardt:
> >>> Without this patch the Firefly-RK3399 board boot process hangs after
> >>> these
> >>> 
> >>> lines:
> >>>    fan53555-regulator 0-0040: FAN53555 Option[8] Rev[1] Detected!
> >>>    fan53555-reg: supplied by vcc_sys
> >>>    vcc1v8_s3: supplied by vcc_1v8
> >>> 
> >>> Blacklisting driver fan53555 allows booting.
> >>> 
> >>> The device tree uses a value of fcs,suspend-voltage-selector different
> >>> to
> >>> any other board.
> >>> 
> >>> Changing this setting to the usual value is sufficient to enable
> >>> booting.
> >>> 
> >>> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> >> 
> >> applied for 4.19.
> > 
> > and dropped again.
> > 
> > Sadly it looks like the patch causes conflicts with at least one firefly
> > board in a kernelci lab. My own is currently not ready to use, so I cannot
> > look myself right now.
> > 
> > The issue kernelci people described sounded quite a lot like the one
> > in your commit message, so my current theory is that the
> > suspend-voltage-selector must in some form corespond to the
> > cpu_b_sleep_h gpio setting we're currently not handling at all, which
> > would therefore depend on how the bootloader sets this up.
>
> please, provide a link to the log displaying the issue and the contact
> who can provide the exact setup.
> 
> I have been testing with U-Boot as boot loader.

failing boot can be found on
https://kernelci.org/boot/id/5b2a053d59b514569079a872/

As this board is sitting in the "lab-baylibre-seattle", I guess
Kevin Hilman (Cc'ed now) is the one that can say a bit more about the
board setup.


The more interesting question would be how to make sure we don't
die with possible different bootloader versions. As I don't really thing 
"upgrade your bootloader" is an always valid option.


Heiko
