From: Willy Tarreau <w@1wt.eu>
Subject: Re: [PATCH v5 00/20] Armada 370/XP watchdog support
Date: Fri, 31 Jan 2014 18:25:25 +0100
Message-ID: <20140131172525.GL31190@1wt.eu>
References: <1390836440-12744-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140129181949.GB27143@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20140129181949.GB27143@localhost>
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
Cc: Lior Amsalem <alior@marvell.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Daniel Lezcano <daniel.lezcano@linaro.org>, Wim Van Sebroeck <wim@iguana.be>, Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 29, 2014 at 03:19:50PM -0300, Ezequiel Garcia wrote:
> On Mon, Jan 27, 2014 at 12:27:00PM -0300, Ezequiel Garcia wrote:
> > A new round, mostly fixing some minor nitpicks.
> > 
> 
> If anyone wants to give this a test, here's a public branch:
> 
> https://github.com/MISL-EBU-System-SW/mainline-public/tree/wdt_for_v3.14_v5

Tested-By: Willy Tarreau <w@1wt.eu>

Works like a charm on the mirabox, I've long been missing a hardware
watchdog to save me from unplugging the power cord after some hangs
during development.

Thanks,
Willy
