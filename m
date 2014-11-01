From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH] ARM: mvebu: Fix the Aurora L2 cache node with the
 required cache-unified property
Date: Sat, 1 Nov 2014 18:39:23 -0400
Message-ID: <20141101223923.GC3698@titan.lakedaemon.net>
References: <1412588276-4514-1-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1412588276-4514-1-git-send-email-gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Tawfik Bayouk <tawfik@marvell.com>, devicetree@vger.kernel.org, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 06, 2014 at 11:37:56AM +0200, Gregory CLEMENT wrote:
> The L2 cache controller on the Armada 370 and Armada XP SoCs is a
> unified cache. Moreover, the Aurora cache controller is compatible
> with the L2x0 cache controller: the "cache-unified" property is
> required by its binding.
> 
> This patch fixes the Aurora L2 cache node for the Armada 370 and
> Armada XP SoCs by adding this property.
> 
> Reported-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---
>  arch/arm/boot/dts/armada-370.dtsi | 1 +
>  arch/arm/boot/dts/armada-xp.dtsi  | 1 +
>  2 files changed, 2 insertions(+)

Applied to mvebu/dt with Sebastian's Ack.

thx,

Jason.
