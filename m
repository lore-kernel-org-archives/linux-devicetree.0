From: John Stultz <johnstul@us.ibm.com>
Subject: Re: [PATCH V4 3/3] clocksource: time-armada-370-xp converted to clk
 framework
Date: Tue, 13 Nov 2012 10:58:54 -0800
Message-ID: <50A2986E.9020202@us.ibm.com>
References: <1351621413-3637-1-git-send-email-gregory.clement@free-electrons.com>
 <1351621413-3637-4-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1351621413-3637-4-git-send-email-gregory.clement@free-electrons.com>
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
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, Nadav Haklai <nadavh@marvell.com>, Ian Molton <ian.molton@codethink.co.uk>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, Mike Turquette <mturquette@linaro.org>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Chris Van Hoof <vanhoof@canonical.com>, Nicolas Pitre <nico@fluxnic.net>, linux-k
List-Id: devicetree@vger.kernel.org

On 10/30/2012 11:23 AM, Gregory CLEMENT wrote:
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> cc: John Stultz <johnstul@us.ibm.com>
> ---
>   arch/arm/boot/dts/armada-370-db.dts      |    4 ----
>   arch/arm/boot/dts/armada-370-xp.dtsi     |    1 +
>   drivers/clocksource/time-armada-370-xp.c |   11 ++++++-----
>   3 files changed, 7 insertions(+), 9 deletions(-)

This is missing the patch description.  Since none of it is 
code/hardware I'm familiar with, I can't really closely review whats 
being done. So its much more critical that the patch have a clear 
description of what its doing.

thanks
-john
