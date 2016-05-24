From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 00/23] ARM/arm64: dts: renesas: Fix W=1 dtc warnings
Date: Tue, 24 May 2016 09:34:11 +0900
Message-ID: <20160524003410.GC2477@verge.net.au>
References: <1463728214-13838-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1463728214-13838-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, May 20, 2016 at 09:09:51AM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus, Morimoto-san, Rob,
> 
> This patch series fixes the new warnings related to Renesas arm32/arm64
> DTSes that can be seen in -next using "make W=1 dtbs", courtesy of
> commit b993734718c01064 ("scripts/dtc: Update to upstream version
> 53bf130b1cdd") in Rob herring's for-next branch. For testing, you can just
> cherry-pick that commit (showing the warning for W=1 only was a separate
> commit).

Thanks, I have queued this up.
