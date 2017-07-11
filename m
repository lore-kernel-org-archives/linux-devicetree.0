From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt: Add bindings for IDT VersaClock 5P49V5925
Date: Mon, 10 Jul 2017 21:53:23 -0500
Message-ID: <20170711025323.xdzgp7jsuvfb5u5o@rob-hp-laptop>
References: <1499621970-12925-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1499622005-13003-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1499622005-13003-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-clk-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 09, 2017 at 08:40:05PM +0300, Vladimir Barinov wrote:
> From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
> 
> IDT VersaClock 5 5P49V5925 has 5 clock outputs, 4 fractional dividers.
> Input clock source can be taken only from external reference clock.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
> ---
> Changes in version 2:
> - fixed typo in patch header: VC5 has 5 clock outputs
> - rebased against patch:
>   [V3,7/8] clk: vc5: Add bindings for IDT VersaClock 5P49V6901
> 
>  Documentation/devicetree/bindings/clock/idt,versaclock5.txt | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
