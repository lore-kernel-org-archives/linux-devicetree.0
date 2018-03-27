From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v4 0/8] ARM: davinci: complete the conversion to using the
 reset framework
Date: Tue, 27 Mar 2018 10:54:54 +0530
Message-ID: <44218403-5e7f-dd12-6d01-a52987fc4cc8@ti.com>
References: <20180323130455.11470-1-brgl@bgdev.pl>
 <152182378792.178046.3747112581117251857@swboyd.mtv.corp.google.com>
 <CAMRc=MfEebDk4D=t-ybRgbn+HaY7RUfOFCDAf9H8F3cZRchJmA@mail.gmail.com>
 <152182490783.178046.1191965992600877708@swboyd.mtv.corp.google.com>
 <CAMRc=MdmTAwPAAnL1+n+OXSycnyjuQ1hKmts158mPcgat1NUYQ@mail.gmail.com>
 <c78817f9-02fd-0ded-609e-5014efdd4a77@ti.com>
 <0683b11c-fefa-5fc7-793e-1a662a5f0480@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <0683b11c-fefa-5fc7-793e-1a662a5f0480@ti.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Suman Anna <s-anna@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-remoteproc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Suman,

On Tuesday 27 March 2018 06:12 AM, Suman Anna wrote:
> I tried booting your tree [3] on the OMAPL138-LCDK board. I am using
> NFS, and I am unable to get to the console. I don't have any issues
> booting latest -next branch (next-20180326) which only has the reset and
> clock driver related changes.
> 
> Here's the log towards the end of the boot..
> ---
> pinctrl-single 1c14120.pinmux: 160 pins, size 80
> Serial: 8250/16550 driver, 3 ports, IRQ sharing disabled
> console [ttyS2] disabled
> 1d0d000.serial: ttyS2 at MMIO 0x1d0d000 (irq = 61, base_baud = 8250000)
> is a TI DA8xx/66AK2x
> console [ttyS2] enabled
> brd: module loaded
> libphy: Fixed MDIO Bus: probed
> davinci_mdio 1e24000.mdio: davinci mdio revision 1.5, bus freq 2200000
> davinci_mdio 1e24000.mdio: no live phy, scanning all
> davinci_mdio: probe of 1e24000.mdio failed with error -5
> i2c /dev entries driver
> <nothing after this>

This is because of a bug in bootloader PLL configuration which got
uncovered only with CCF conversion. The bootloader that comes
pre-flashed with the board or the latest U-Boot master should work fine.

Here is the log with latest U-Boot master:
https://pastebin.ubuntu.com/p/HkwY9g4YDc/

Thanks,
Sekhar
