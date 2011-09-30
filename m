From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCHv3 0/4] Initial support for Picochip picoXcell
Date: Fri, 30 Sep 2011 22:49:26 +0200
Message-ID: <201109302249.26525.arnd@arndb.de>
References: <1317050689-16417-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1317050689-16417-1-git-send-email-jamie@jamieiles.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Jamie,

On Monday 26 September 2011, Jamie Iles wrote:
> This is largely a repost of v2, but with a couple of minor changes:
>         - Removed bootargs from board dts files
>         - Fix up the VIC binding documentation
> 
> I've also added a 4th patch which removes the picoxcell specific ioremap
> functionality.  This could either be applied/folded into the first patch
> if Nicolas' vmalloc cleanups go in.
> 
> These patches can also be found in a git tree at:
> 
>         git://github.com/jamieiles/linux-2.6-ji.git for-next

I've pulled it into the next/soc branch now, and I'll also pul
Rob's highbank patches in there.

Sorry for taking so long.

There might be a few things that break when this is merged with the
cross-platform changes, so I'm planning right now to submit these
rather late in the merge window to allow fixing any mismerges
before it gets upstream.

	Arnd
