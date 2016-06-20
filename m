From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: dma: add binding for the Marvell XOR
 v2 engine
Date: Mon, 20 Jun 2016 08:07:24 -0500
Message-ID: <20160620130724.GA23860@rob-hp-laptop>
References: <1466080116-26777-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1466080116-26777-2-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1466080116-26777-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Yehuda Yitschak <yehuday@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, devicetree@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Hanna Hawa <hannah@marvell.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Nadav Haklai <nadavh@marvell.com>, Gregory Clement <gregory.clement@free-electrons.com>, Kumar Gala <galak@codeaurora.org>, dmaengine@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 16, 2016 at 02:28:33PM +0200, Thomas Petazzoni wrote:
> This commit adds the Device Tree binding documentation for the Marvell
> XOR v2 engine, which is found on Marvell Armada 7K/8K ARM64 SoCs.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../devicetree/bindings/dma/mv-xor-v2.txt          | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/mv-xor-v2.txt

Acked-by: Rob Herring <robh@kernel.org>
