From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/3] of platforms: Move common static initialization to
	of_node_init()
Date: Tue, 9 Feb 2010 10:22:04 -0700
Message-ID: <fa686aa41002090922p73abf37bm2ae44823b9d0853@mail.gmail.com>
References: <20100205204949.GA2575@oksana.dev.rtsoft.ru> <20100205205041.GA4178@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100205205041.GA4178@oksana.dev.rtsoft.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Anton Vorontsov <avorontsov@ru.mvista.com>
Cc: David Brownell <dbrownell@users.sourceforge.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, David Miller <davem@davemloft.net>, Michal Simek <monstr@monstr.eu>, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, microblaze-uclinux@itee.uq.edu.au
List-Id: devicetree@vger.kernel.org

On Fri, Feb 5, 2010 at 1:50 PM, Anton Vorontsov
<avorontsov@ru.mvista.com> wrote:
> So far of_node_init() just initializes a kref, later we'll have to
> initialize other fields (for example node->data_lock).
>
> Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>
> ---
> =A0arch/microblaze/kernel/prom.c =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A04 +=
+--
> =A0arch/powerpc/kernel/prom.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
4 ++--
> =A0arch/powerpc/platforms/iseries/vio.c =A0 =A0 =A0| =A0 =A05 +++--
> =A0arch/powerpc/platforms/pseries/dlpar.c =A0 =A0| =A0 =A07 ++++---
> =A0arch/powerpc/platforms/pseries/reconfig.c | =A0 =A07 ++++---
> =A0arch/powerpc/sysdev/msi_bitmap.c =A0 =A0 =A0 =A0 =A0| =A0 =A04 ++-=
-
> =A0arch/sparc/kernel/prom_common.c =A0 =A0 =A0 =A0 =A0 | =A0 =A06 +++=
---
> =A0drivers/of/base.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 10 ++++++++++
> =A0include/linux/of.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A02 ++
> =A09 files changed, 32 insertions(+), 17 deletions(-)

unflatten_dt_*() has been merged and moved to drivers/of.  Please
rebase this series on top of my next-devicetree branch in this git
tree:

git://git.secretlab.ca/git/linux-2.6

Otherwise, this looks fine to me.

g.
