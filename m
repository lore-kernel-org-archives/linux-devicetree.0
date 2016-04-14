From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 4/5] dt-bindings: arm: add DT binding for Marvell
 CP110 system controller
Date: Thu, 14 Apr 2016 12:37:38 -0500
Message-ID: <20160414173738.GA24292@rob-hp-laptop>
References: <1460648013-31320-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1460648013-31320-5-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460648013-31320-5-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Hanna Hawa <hannah@marvell.com>, Yehuda Yitschak <yehuday@marvell.com>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 14, 2016 at 05:33:32PM +0200, Thomas Petazzoni wrote:
> This commit adds the DT binding documentation for the Marvell CP110
> system controller, which is part of the CP110 HW block, itself used in
> the Marvell Armada 7K and 8K SoCs.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../arm/marvell/cp110-system-controller0.txt       | 83 ++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt

Acked-by: Rob Herring <rob@kernel.org>
