From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 3/7] dt-bindings: net: stmmac: Add the bindings
 documentation for delays
Date: Mon, 14 Jan 2019 20:56:31 +0530
Message-ID: <20190114152631.GA13372@vkoul-mobl.Dlink>
References: <20190102091729.18582-1-vkoul@kernel.org>
 <20190102091729.18582-4-vkoul@kernel.org>
 <20190111150104.GA1465@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190111150104.GA1465@bogus>
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Niklas Cassel <niklas.cassel@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

HI Rob,

On 11-01-19, 09:01, Rob Herring wrote:
> On Wed, Jan 02, 2019 at 02:47:25PM +0530, Vinod Koul wrote:
> > Some controllers require that phy delay should be disabled. So add
> 
> If the MAC requires it, then the compatible string should imply this. If 
> it depends on the PHY, then okay.

Thanks for the review, yes this was targeted to PHY. After feedback
from Andrew, I have removed this is v2 posted earlier!

-- 
~Vinod
