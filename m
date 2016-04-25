From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v5 0/5] clk: mvebu: clock drivers for Marvell Armada
 7K/8K
Date: Mon, 25 Apr 2016 15:44:38 +0200
Message-ID: <20160425154438.07cca521@free-electrons.com>
References: <1460648013-31320-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1460648013-31320-1-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Yehuda Yitschak <yehuday@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Hanna Hawa <hannah@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Stephen, Michael,

On Thu, 14 Apr 2016 17:33:28 +0200, Thomas Petazzoni wrote:

>   clk: mvebu: new driver for Armada AP806 system controller
>   dt-bindings: arm: add DT binding for Marvell CP110 system controller
>   clk: mvebu: new driver for Armada CP110 system controller

Do you have any comments on those three patches? Rob Herring gave his
Acked-by on the DT binding for both drivers and as you can imagine,
those drivers are essential to making this new platform work in
mainline.

Do not hesitate to let me know if anything still needs some
adaptations/changes in the clock drivers.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
