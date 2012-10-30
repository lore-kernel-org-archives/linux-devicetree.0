From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH V2 2/3] clk: armada-370-xp: add support for clock framework
Date: Tue, 30 Oct 2012 04:36:52 -0700
Message-ID: <20121030113652.18780.45729@nucleus>
References: <1349125926-16144-1-git-send-email-gregory.clement@free-electrons.com>
 <1349125926-16144-3-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1349125926-16144-3-git-send-email-gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>Gregory Clement <gregory.clement@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Ike Pan <ike.pan@canonical.com>, Nadav Haklai <nadavh@marvell.com>, Ian Molton <ian.molton@codethink.co.uk>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Li Li <li.li@canonical.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Chris Van Hoof <vanhoof@canonical.com>, Nicolas Pitre <nico@fluxnic.net>, Maen Suleiman <maen@marvell.com>, Shadi Ammouri <shadi@marvell.com>Olof Johansson <o>
List-Id: devicetree@vger.kernel.org

Quoting Gregory CLEMENT (2012-10-01 14:12:05)
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

This didn't apply cleanly to -rc3.  Can you rebase this along with the
respin of patch #1 in the series?

<snip>

> diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
> index 71d6b5d..e75f3a2 100644
> --- a/arch/arm/boot/dts/armada-xp.dtsi
> +++ b/arch/arm/boot/dts/armada-xp.dtsi
> @@ -27,6 +27,35 @@
>                     <0xd0021870 0x58>;
>         };
>  
> +       cpus {
> +           #address-cells = <1>;
> +           #size-cells = <0>;
> +
> +           cpu@0 {
> +               compatible = "marvell,sheeva-v7";

Extra white space in front of compatible.  Should be tabs.

Regards,
Mike
