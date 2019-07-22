From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/5] MIPS: ralink: add dt binding header for mt7621-pll
Date: Mon, 22 Jul 2019 14:40:39 -0700
Message-ID: <20190722214039.E9D9F21951@mail.kernel.org>
References: <20190709182018.23193-1-gch981213@gmail.com>
 <20190709182018.23193-2-gch981213@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20190709182018.23193-2-gch981213@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>, Chuanhong Guo <gch981213@gmail.com>, open list <linux-kernel@vger.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Weijie Gao <hackpascal@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, James Hogan <jhogan@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, Rob Herring <robh+dt@kernel.org>, John Crispin <john@phrozen.org>, NeilBrown <neil@brown.name>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

The subject of this patch is confusing. Not sure what it has to do with
"MIPS:" so maybe remove that and prefix it "dt-bindings: clock:"
instead.

Quoting Chuanhong Guo (2019-07-09 11:20:14)
> This patch adds dt binding header for mediatek,mt7621-pll
> 
> Signed-off-by: Weijie Gao <hackpascal@gmail.com>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Otherwise looks ok to me. Should I apply it to clk tree?

>  include/dt-bindings/clock/mt7621-clk.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mt7621-clk.h
> 
