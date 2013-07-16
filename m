From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 00/10] Orion Watchdog fixes
Date: Tue, 16 Jul 2013 08:59:52 +0200
Message-ID: <20130716065952.GA25043@lunn.ch>
References: <1373931163-12670-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1373931163-12670-1-git-send-email-ezequiel.garcia@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, wim@iguana.be, Maen Suleiman <maen@marvell.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 15, 2013 at 08:32:33PM -0300, Ezequiel Garcia wrote:
> This patchset introduces a bunch of fixes that removes the direct use of
> the shared timer control register, and also removes the need to include
> a mach-specific header.
> 
> With this changes the driver can be included in multiplatforms builds,
> and in particular be used for the Armada 370/XP SoC.

Hi Ezequiel

Maybe i'm missing something here. You are making use of
orion_timer_ctrl_clrset() from time-orion.c. How will this work on
370/XP which has a different clocksource driver?

Thanks
	Andrew
