From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 3/5] arm: mvebu: Added IPI support via doorbells
Date: Mon, 22 Oct 2012 19:30:28 +0200
Message-ID: <20121022173028.GM21046@lunn.ch>
References: <1350925368-24243-1-git-send-email-gregory.clement@free-electrons.com>
 <1350925368-24243-4-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1350925368-24243-4-git-send-email-gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, Will Deacon <will.deacon@arm.com>, Nadav Haklai <nadavh@marvell.com>, Ian Molton <ian.molton@codethink.co.uk>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, Russell King <linux@arm.linux.org.uk>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Li Li <li.li@canonical.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Ben Dooks <ben-linux@fluff.org>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.or
List-Id: devicetree@vger.kernel.org

On Mon, Oct 22, 2012 at 07:02:45PM +0200, Gregory CLEMENT wrote:
> From: Yehuda Yitschak <yehuday@marvell.com>
> 
> Signed-off-by: Yehuda Yitschak <yehuday@marvell.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---
>  arch/arm/boot/dts/armada-xp.dtsi        |    2 +-
>  arch/arm/mach-mvebu/armada-370-xp.h     |   10 ++++
>  arch/arm/mach-mvebu/irq-armada-370-xp.c |   92 +++++++++++++++++++++++++++++--
>  3 files changed, 97 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
> index f521ed8..531619f 100644
> --- a/arch/arm/boot/dts/armada-xp.dtsi
> +++ b/arch/arm/boot/dts/armada-xp.dtsi
> @@ -24,7 +24,7 @@
>  
>  	mpic: interrupt-controller@d0020000 {
>  	      reg = <0xd0020a00 0x1d0>,
> -		    <0xd0021870 0x58>;
> +		    <0xd0021070 0x58>;
>  	};

Hi Gregory

Is this a bug fix needed for 3.7?

   Andrew
