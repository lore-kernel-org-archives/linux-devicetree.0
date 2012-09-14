From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v3 2/5] Documentation: add description of DT binding for
 the gpio-mvebu driver
Date: Fri, 14 Sep 2012 16:54:08 +0200
Message-ID: <20120914165408.4beaefe7@skate>
References: <1347551658-24449-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1347551658-24449-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <50524026.20104@gmail.com> <20120913223059.2d0606b2@skate>
 <50524363.9070100@gmail.com>
 <CACRpkdY3ePZLUJsX_X9QGyo6dCDmweUd5Lq7BYnQ4P0uGVj-uQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdY3ePZLUJsX_X9QGyo6dCDmweUd5Lq7BYnQ4P0uGVj-uQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Stephen Warren <swarren@wwwdotorg.org>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Maen Suleiman <maen@marvell.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Gregory CLEMENT <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@stericsson.com>
List-Id: devicetree@vger.kernel.org

Dear Linus Walleij,

On Fri, 14 Sep 2012 15:17:09 +0200, Linus Walleij wrote:

> >> Yes, I know, but MAINTAINERS does not mention an alternate maintainer
> >> for the GPIO subsystem. Who is the interim maintainer that will
> >> ultimately have to ack/nack those patches?
> >
> > Linus W. is.
> 
> I stated Reviewed-by: on the GPIO patch, please merge it through the
> Marvell tree (I guess that's the plan?)

Yes, I guess it's the easiest plan (Jason ? Andrew ?). We however need
Acks on the pinctrl patch series as well, since this one depends on it.

Thanks a lot for your review!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
