From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v4 0/4] dmaengine driver for Marvell XOR v2 engine
Date: Tue, 28 Jun 2016 16:37:48 +0200
Message-ID: <20160628163748.48bc2ad8@free-electrons.com>
References: <1466080116-26777-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160628143850.GD14945@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160628143850.GD14945@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Yehuda Yitschak <yehuday@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, devicetree@vger.kernel.org, Hanna Hawa <hannah@marvell.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Nadav Haklai <nadavh@marvell.com>, Gregory Clement <gregory.clement@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, dmaengine@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello,

On Tue, 28 Jun 2016 20:08:50 +0530, Vinod Koul wrote:
> On Thu, Jun 16, 2016 at 02:28:32PM +0200, Thomas Petazzoni wrote:
> > Hello,
> > 
> > Here is the fourth version of the mv_xor_v2 driver, which allows to
> > use the XOR engines available on the Marvell Armada 7K/8K ARM64 SoCs.  
> 
> Looks okay. But need ack on two ARM patches...

Thanks for the review! Please don't take the two ARM patches in your
tree, let the mvebu platform maintainer take them, to avoid conflicts.

So if you're happy with patches 1 and 2, could you take them? I'll talk
with the mvebu platform maintainer (who is in Cc) to get patches 3 and
4 merged.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
