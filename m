From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: ingenic: Explicitly list
 compatible strings
Date: Tue, 28 Aug 2018 19:35:46 -0500
Message-ID: <20180829003546.GA23234@bogus>
References: <20180823131744.744-1-paul@crapouillou.net>
 <20180823131744.744-2-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180823131744.744-2-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, od@zcrc.me, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

On Thu, 23 Aug 2018 15:17:42 +0200, Paul Cercueil wrote:
> This is better than letting the other developers wondering what are the
> supported strings.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     New patch
> 
>  Documentation/devicetree/bindings/clock/ingenic,cgu.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
