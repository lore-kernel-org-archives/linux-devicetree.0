From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/8] [RFC] dt-bindings: renesas: Document R-Car H3 and
 M3-W SiP DT bindings
Date: Fri, 28 Apr 2017 08:39:23 -0500
Message-ID: <20170428133923.ycbqixcxvcsonocn@rob-hp-laptop>
References: <1492593351-13835-1-git-send-email-geert+renesas@glider.be>
 <1492593351-13835-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1492593351-13835-2-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 19, 2017 at 11:15:44AM +0200, Geert Uytterhoeven wrote:
> Document the SiP ("System-in-Package") versions of the R-Car H3 and M3-W
> SoCs, which contain an R-Car H3 or M3-W SoC, RAM, and HyperFlash.
> 
> Add their compatible values to all boards equipped with R-Car Gen3 SiPs.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Questions:
>   - Do we need more compatible values, for different configurations?
>     At least r8j7796 is available with either 2 GiB or 4 GiB of RAM,
>     possibly using RAM parts from different vendors.

Same die, just a different package? If so, I don't think you need a 
different compatible. It's going to be a different board from any 
non-SiP which should be enough to distinguish.

Rob
