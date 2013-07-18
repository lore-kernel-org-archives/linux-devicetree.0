From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v1 05/24] clk: wrap I/O access for improved portability
Date: Thu, 18 Jul 2013 10:17:35 +0100
Message-ID: <20130718091735.GW24642@n2100.arm.linux.org.uk>
References: <1373914074-20889-1-git-send-email-gsi@denx.de>
 <1373914074-20889-6-git-send-email-gsi@denx.de>
 <20130715193829.GS14452@pengutronix.de>
 <20130718070402.GO7080@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130718070402.GO7080-kDjWylLy9wD0K7fsECOQyeGNnDKD8DIp@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Detlev Zundel <dzu-ynQEQJNshbs@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 18, 2013 at 09:04:02AM +0200, Gerhard Sittig wrote:
> The common clock API assumes (it's part of the contract) that
> there are potentially expensive operations like get, put, prepare
> and unprepare, as well as swift and non-blocking operations like
> enable and disable.

Let's get something straight here, because what you've said above is
wrong.

1. clk_get() and clk_put() are NOT part of the common clock API.
   They're separate - they're part of the clk API, and the infrastructure
   behind that is clkdev, which is a separately owned thing (by me.)

2. The "contract" of the clk API is defined by the clk API, not by some
   random implementation like the common clock API.  The clk API is
   maintained by myself, and is described in include/linux/clk.h

3. clk_prepare() and clk_unprepare() are functions MUST only be called
   from contexts where sleeping is permitted.  These functions MAY sleep
   for whatever reason they require to, and as long as they require to.
   (This is the whole reason these two functions were created in the
   first place.)

4. clk_enable() and clk_disable() MAY be called from any context, but
   MUST never sleep.  If you need to talk over a non-atomic bus for these,
   then these functions should be no-ops, and the code which does that
   must be executed from the clk_prepare()/clk_unprepare() operations.

That is the "clk API" contract.  The CCF has no bearing on this; if it
disagrees, then the CCF is buggy and is non-conformant.
