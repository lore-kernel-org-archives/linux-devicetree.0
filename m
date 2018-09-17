From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: marvell,
 prestera: Add common compatible string
Date: Mon, 17 Sep 2018 01:45:09 -0400
Message-ID: <5b9f3f66.1c69fb81.e9b3c.3a62@mx.google.com>
References: <20180907005926.27134-1-chris.packham@alliedtelesis.co.nz>
 <20180907005926.27134-2-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180907005926.27134-2-chris.packham@alliedtelesis.co.nz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, andrew@lunn.ch, jason@lakedaemon.net, devicetree@vger.kernel.org, netdev@vger.kernel.org, gregory.clement@bootlin.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri,  7 Sep 2018 12:59:25 +1200, Chris Packham wrote:
> Add "marvell,prestera" as a compatible string so that drivers can be
> written to account for any prestera variant without needing to
> specialise to the more specific values.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  Documentation/devicetree/bindings/net/marvell,prestera.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
