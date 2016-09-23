From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 18/19] stmmac: dwmac-sti: Remove obsolete STi platforms
Date: Fri, 23 Sep 2016 10:11:42 -0500
Message-ID: <20160923151142.GG9176@rob-hp-laptop>
References: <1473859677-9231-1-git-send-email-peter.griffin@linaro.org>
 <1473859677-9231-19-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473859677-9231-19-git-send-email-peter.griffin@linaro.org>
Sender: netdev-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, devicetree@vger.kernel.org, lee.jones@linaro.org, peppe.cavallaro@st.com, alexandre.torgue@st.com, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 14, 2016 at 02:27:56PM +0100, Peter Griffin wrote:
> This patch removes support for STiH415/6 SoC's from the
> dwmac-sti driver and dt binding doc, as support for these
> platforms is being removed from the kernel. It also removes
> STiD127 related code, which has never actually been supported
> upstream.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Cc: <peppe.cavallaro@st.com>
> Cc: <alexandre.torgue@st.com>
> Cc: <netdev@vger.kernel.org>
> ---
>  .../devicetree/bindings/net/sti-dwmac.txt          |  3 +-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    | 37 ----------------------
>  2 files changed, 1 insertion(+), 39 deletions(-)
