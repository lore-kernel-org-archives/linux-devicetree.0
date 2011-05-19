From: Kumar Gala <galak@kernel.crashing.org>
Subject: Re: [PATCH 4/4] powerpc/mpic: add the mpic global timer support
Date: Thu, 19 May 2011 01:01:49 -0500
Message-ID: <A8328BF9-349B-4CC4-B9FF-C98DEA2CD74B@kernel.crashing.org>
References: <20110324214355.GC9524@schlenkerla.am.freescale.net>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20110324214355.GC9524@schlenkerla.am.freescale.net>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Scott Wood <scottwood@freescale.com>
Cc: devicetree-discuss@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


On Mar 24, 2011, at 4:43 PM, Scott Wood wrote:

> Add support for MPIC timers as requestable interrupt sources.
> 
> Based on http://patchwork.ozlabs.org/patch/20941/ by Dave Liu.
> 
> Signed-off-by: Dave Liu <daveliu@freescale.com>
> Signed-off-by: Scott Wood <scottwood@freescale.com>
> ---
> arch/powerpc/include/asm/mpic.h |    3 +-
> arch/powerpc/sysdev/mpic.c      |   92 ++++++++++++++++++++++++++++++++++++---
> 2 files changed, 88 insertions(+), 7 deletions(-)

applied to next, fixed for upstream changes.

- k
