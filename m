From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 3/4] mfd: arizona: Switch to using clock driver for
 32k clock
Date: Mon, 11 Jan 2016 10:25:46 +0000
Message-ID: <20160111102545.GX14104@x1>
References: <1452252582-20834-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1452252582-20834-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452252582-20834-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-clk-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: mturquette@baylibre.com, cw00.choi@samsung.com, sboyd@codeaurora.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Fri, 08 Jan 2016, Charles Keepax wrote:

> Now we have a clock driver that can control the 32k clock use this
> rather than directly controlling the 32k clock from the MFD device.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>=20
> No changes since v2.
>=20
> Thanks,
> Charles
>=20
>  drivers/mfd/arizona-core.c       | 104 +++++++++--------------------=
----------
>  include/linux/mfd/arizona/core.h |   7 +--
>  2 files changed, 25 insertions(+), 86 deletions(-)

I guess this needs to go in with the Clk changes, which are yet to be
reviewed, right?

=46or my own reference:
  Acked-by: Lee Jones <lee.jones@linaro.org>

[...]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
