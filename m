From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: only apply reset hacks to broken hardware
Date: Tue, 7 Aug 2018 12:33:14 -0600
Message-ID: <20180807183314.GA31722@rob-hp-laptop>
References: <20180727183313.137943-1-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180727183313.137943-1-computersforpeace@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Zhiqiang Hou <Zhiqiang.Hou@nxp.com>, NeilBrown <neilb@suse.com>, Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 27, 2018 at 11:33:13AM -0700, Brian Norris wrote:
> Commit 59b356ffd0b0 ("mtd: m25p80: restore the status of SPI flash when
> exiting") is the latest from a long history of attempts to add reboot
> handling to handle stateful addressing modes on SPI flash. Some prior
> mostly-related discussions:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2013-March/046343.html
> [PATCH 1/3] mtd: m25p80: utilize dedicated 4-byte addressing commands
> 
> http://lists.infradead.org/pipermail/barebox/2014-September/020682.html
> [RFC] MTD m25p80 3-byte addressing and boot problem
> 
> http://lists.infradead.org/pipermail/linux-mtd/2015-February/057683.html
> [PATCH 2/2] m25p80: if supported put chip to deep power down if not used
> 
> Previously, attempts to add reboot-time software reset handling were
> rejected, but the latest attempt was not.
> 
> Quick summary of the problem:
> Some systems (e.g., boot ROM or bootloader) assume that they can read
> initial boot code from their SPI flash using 3-byte addressing. If the
> flash is left in 4-byte mode after reset, these systems won't boot. The
> above patch provided a shutdown/remove hook to attempt to reset the
> addressing mode before we reboot. Notably, this patch misses out on
> huge classes of unexpected reboots (e.g., crashes, watchdog resets).
> 
> Unfortunately, it is essentially impossible to solve this problem 100%:
> if your system doesn't know how to reset the SPI flash to power-on
> defaults at initialization time, no amount of software can really rescue
> you -- there will always be a chance of some unexpected reset that
> leaves your flash in an addressing mode that your boot sequence didn't
> expect.
> 
> While it is not directly harmful to perform hacks like the
> aforementioned commit on all 4-byte addressing flash, a
> properly-designed system should not need the hack -- and in fact,
> providing this hack may mask the fact that a given system is indeed
> broken. So this patch attempts to apply this unsound hack more narrowly,
> providing a strong suggestion to developers and system designers that
> this is truly a hack. With luck, system designers can catch their errors
> early on in their development cycle, rather than applying this hack long
> term. But apparently enough systems are out in the wild that we still
> have to provide this hack.
> 
> Document a new device tree property to denote systems that do not have a
> proper hardware (or software) reset mechanism, and apply the hack (with
> a loud warning) only in this case.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> Note that I intentionall didn't split the documentation patch. It seems
> clearer to do these together IMO, but if it's *really* important to
> someone...I can resend

How is it cleaner in this specific case?

The reason to separate the binding besides that I only review the 
binding part (generally) is so the DT only repository we generate[1] has 
a history and commit msgs that make sense.

That being said, if there are no other changes I'm not going to ask for 
it to be split.

Acked-by: Rob Herring <robh@kernel.org>
 
> ---
>  .../devicetree/bindings/mtd/jedec,spi-nor.txt  |  9 +++++++++
>  drivers/mtd/spi-nor/spi-nor.c                  | 18 ++++++++++++++++--
>  include/linux/mtd/spi-nor.h                    |  1 +
>  3 files changed, 26 insertions(+), 2 deletions(-)

[1] https://git.kernel.org/pub/scm/linux/kernel/git/devicetree/devicetree-rebasing.git/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
