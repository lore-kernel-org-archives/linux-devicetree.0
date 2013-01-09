From: Florian Fainelli <florian@openwrt.org>
Subject: Re: [PATCH V2 0/4] add RTC support for Armada 370 and Armada XP
Date: Wed, 09 Jan 2013 19:49:40 +0100
Message-ID: <6174336.QCHWFhIiR1@bender>
References: <1355303186-9267-1-git-send-email-gregory.clement@free-electrons.com>
 <50C849E8.70105@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <50C849E8.70105@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, Nadav Haklai <nadavh@marvell.com>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, rtc-linux@googlegroups.com, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Alessandro Zummo <a.zummo@towertech.it>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Chris Van Hoof <vanhoof@canonical.com>, Nicolas Pitre <nico@fluxnic.net>
List-Id: devicetree@vger.kernel.org

On Wednesday 12 December 2012 10:10:00 Gregory CLEMENT wrote:
> On 12/12/2012 10:06 AM, Gregory CLEMENT wrote:
> > Hello,
> > 
> > This small patch set adds RTC support for Armada 370 and Armada XP. It
> > was successfully tested on the evaluation board. The third patch add
> > the lacking documentation for the device tree binding and was already
> > taken by Grant Likely, I keep this one in the series for
> > coherency. The only differences with the previous patch set was the
> > add of the Acked-by from Andrew Lunn and a new small patch to update
> > of the mvebu_configuration. I also split the patch wich add the RTC
> > support in two part, one for the RTC subsytem and on for
> > mach-mvebu. This series is 3.9 material.

Tested-by: Florian Fainelli <florian@openwrt.org>

on RD-A370-A1
-- 
Florian
