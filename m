From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH] dtbsinstall: don't move target directory out of the way
Date: Sat, 28 Mar 2015 15:59:14 +0000
Message-ID: <20150328155913.GB25778@io.lakedaemon.net>
References: <20150328132320.GA24391@n2100.arm.linux.org.uk>
 <E1YbqvP-000283-5m@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <E1YbqvP-000283-5m@rmk-PC.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Pawel Moll <pawel.moll@arm.com>, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kbuild@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Olof Johansson <olof@lixom.net>, Michal Marek <mmarek@suse.cz>, Stephen Warren <swarren@wwwdotorg.org>, torvalds@linux-foundation.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Mar 28, 2015 at 01:37:19PM +0000, Russell King wrote:
> No other kernel installation target moves the target directory out of
> the way, even deleting an old version of it.  These are destructive
> operations, ones which the kernel build system should not be making.
> 
> Remove this behaviour.
> 
> If this behaviour is required at installation time, this should be
> done by the installation external to the kernel makefiles, just like
> it would be done for 'make modules_install'.
> 
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
> ---
>  scripts/Makefile.dtbinst | 2 --
>  1 file changed, 2 deletions(-)

Acked-by: Jason Cooper <jason@lakedaemon.net>

thx,

Jason.
