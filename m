From: "Grant Likely" <grant.likely@secretlab.ca>
Subject: Re: Board level compatibility matching
Date: Fri, 1 Aug 2008 10:24:58 -0600
Message-ID: <fa686aa40808010924p48191472gdf51eab11f4e4d30@mail.gmail.com>
References: <1217564739.11188.482.camel@pasglop>
	<fa686aa40808010727v53fe3580q2813a12cb66f8f68@mail.gmail.com>
	<20080801111141.3543e23b@zod.rchland.ibm.com>
	<20080801.100107.-1666252871.imp@bsdimp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
In-Reply-To: <20080801.100107.-1666252871.imp@bsdimp.com>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: "M. Warner Losh" <imp@bsdimp.com>
Cc: devicetree-discuss@ozlabs.org, linuxppc-dev@ozlabs.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 1, 2008 at 10:01 AM, M. Warner Losh <imp@bsdimp.com> wrote:
> I'd float a radical definition of 'compatible' here.
>
> If the generic code can handle it with just changes to the device
> tree, then it is compatible.  And by generic code, I wouldn't suggest
> a twisty maze of ifdefs or special case hacks.  I'm talking truly
> generic code that is table driven entirely from the dtc.  If you need
> special C code to initialize the board, then it isn't compatible.

When doing the initial board port, you don't *know* if you're going to
need special cases.  Or, you don't know if the special case code
belongs in the platform code, or belongs somewhere else
(implementation detail).  Or, the special code could get refactored in
the future and be moved into or out of the platform code.

Claiming one board is compatible with another tends to just encode a
Linux implementation detail into the device tree.

> This is exactly analogous to the pc-net driver supporting dozens of
> different cards that differ only in their ID.  Are all these cards
> 100% the same: no.  There's plenty of differences between them.
> However, the pc-net driver copes with the small differences so that
> one driver can handle most of the ne2000 class of network cards.

Yes, and we use lists of compatible values for devices.  However, the
board level has much higher complexity.  The likelyhood of getting it
wrong is much greater.

g.
