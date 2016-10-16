From: Sylvain Rochet <sylvain.rochet@finsecur.com>
Subject: Re: [PATCH] ARM: at91/dt: pullup dbgu rx instead of tx
Date: Sun, 16 Oct 2016 18:43:26 +0200
Message-ID: <20161016164326.ep4gjpbeubyfgsjq@finsecur.com>
References: <1443105855-15738-1-git-send-email-peda@lysator.liu.se>
 <20150924144753.GY4287@piout.net>
 <6d2d5aba-cca3-93c6-0c59-3acbbd7b6169@lysator.liu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <6d2d5aba-cca3-93c6-0c59-3acbbd7b6169@lysator.liu.se>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Rosin <peda@lysator.liu.se>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kumar Gala <galak@codeaurora.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Peter Rosin <peda@axentia.se>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Peter,

On Sun, Oct 16, 2016 at 12:57:09PM +0200, Peter Rosin wrote:
> Hi again,
> 
> I forgot about this, and it's been a year. But isn't it time to
> upstream those pull-up fixes that Sylvain provided?

Thank you for your reminder, actually I waited an answer on this nice 
subject: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-September/368643.html

But this is not relevant for this change anyway, if we should set a 
pull-(up|down) on all push-pull pads to reduce power consumption it 
should be enforced in the pinctrl driver, the dt must stay logical.

I just sent a v2 with all useless comments removed as suggested by 
Alexandre and without the explanation about the removed extra power 
consumption when removing a pull-(up|down) on a push-pull output because 
it does even seem to be the contrary on Atmel SoCs.

Sylvain
