From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 3/4] mfd: arizona: Switch to using clock driver for
 32k clock
Date: Mon, 9 May 2016 08:44:59 +0100
Message-ID: <20160509074459.GD8324@dell>
References: <1452252582-20834-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1452252582-20834-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20160507005510.GO3492@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160507005510.GO3492@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, mturquette@baylibre.com, cw00.choi@samsung.com, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Fri, 06 May 2016, Stephen Boyd wrote:

> On 01/08, Charles Keepax wrote:
> > Now we have a clock driver that can control the 32k clock use this
> > rather than directly controlling the 32k clock from the MFD device.
> >=20
> > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> > ---
>=20
> Applied to clk-next

If you're going to take the set though the clk tree, don't forget to
sent out a pull-request of the immutable branch you created.  If
you're not happy to do that, drop the patch and I'll happily oblige.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
