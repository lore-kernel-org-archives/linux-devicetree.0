From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Raspberry Pi mailbox drivers
Date: Mon,  2 Mar 2015 12:54:34 -0800
Message-ID: <1425329684-23968-1-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series can also be found at:

https://github.com/anholt/linux/tree/rpi-mailbox

The generic mailbox stuff was seen on the list last October:

http://marc.info/?l=linux-arm-kernel&m=141415695904815&w=2

which got review comments and then, as far as I can see, never got
resubmitted.  I think I've dealt with those comments except for the
following:

- Kconfig should say "Y or M" instead of "Y"

It looks like the majority behavior in Kconfig is to just say "Y"
generally, even for module things.

- Alphabetizing Makefile / Kconfig additions

In the time since the submission, everything else has been added in
submission order rather than alphabetizing, so I'm following that.

- Authorship (Lubomir or Craig) on the patch

Lubomir's patch (the one being reviewed) said it was squash of Craig's
onto previous work by Lubomir.  Craig's patch
(http://marc.info/?l=linux-arm-kernel&m=137907209606316&w=2) looked
like it was a replacement of a previous driver by Lubomir with a
rewrite onto the generic mailbox support.  Enough got rewritten in
Craig's rework that I could easily see his name going on the patch,
but I think it's a derivative of Lubomir's.  However, Lubomir did go
on to do some significant cleanup of Craig's work, as well.  I've left
Lubomir's name on the patch and made the MODULE_AUTHOR be him.  If
Craig is bothered by this, I'd be happy to try to work something out,
but this is one of those places where a certain style of development
is hard to fairly represent given the way we like history to happen in
the kernel tree.

My two driver bits haven't been seen on the list before.  I did read
some other drivers in the process of writing them (particularly the
downstream Raspberry Pi vcio.c and power.c).  I've tested the property
channel with some ad-hoc code to dump a few properties, and the
results look good.

I haven't added a MAINTAINERS entry for this series.  I'm personally
happy with the maintainers being the 2835 arch maintainers, but I'd
also be willing to add myself as a maintainer if that was desired.  I
should also be able to answer questions about the firmware behavior,
which would probably be useful to anyone trying to build more drivers
using this code.
