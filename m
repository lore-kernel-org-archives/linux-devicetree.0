From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC 1/4] dt-bindings: clock: Add Realtek RTD1295
Date: Mon, 21 Aug 2017 21:21:03 -0500
Message-ID: <20170822022103.3ud4mzjtozhd5ics@rob-hp-laptop>
References: <20170817112026.24062-1-afaerber@suse.de>
 <20170817112026.24062-2-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170817112026.24062-2-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Roc He <hepeng@zidoo.tv>, =?utf-8?B?6JKL5Li955C0?= <jiang.liqin@geniatech.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 17, 2017 at 01:20:22PM +0200, Andreas Färber wrote:
> Naming inspired from Zidoo X9S Device Tree and clk_summary.
> 
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  .../devicetree/bindings/clock/realtek,rtd129x.txt  | 20 +++++
>  include/dt-bindings/clock/realtek,rtd1295.h        | 99 ++++++++++++++++++++++
>  2 files changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/realtek,rtd129x.txt
>  create mode 100644 include/dt-bindings/clock/realtek,rtd1295.h

Acked-by: Rob Herring <robh@kernel.org>
