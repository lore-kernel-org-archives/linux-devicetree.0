From: Jason <jason@lakedaemon.net>
Subject: Re: [PATCH 0/4] ARM: kirkwood: fdt: convert kirkwood init funcs to fdt
Date: Fri, 2 Mar 2012 12:04:41 -0500
Message-ID: <20120302170441.GK11986@titan.lakedaemon.net>
References: <cover.1330625877.git.jason@lakedaemon.net>
 <201203012214.07019.arnd@arndb.de>
 <20120302163121.GI11986@titan.lakedaemon.net>
 <201203021658.12047.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <201203021658.12047.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 02, 2012 at 04:58:11PM +0000, Arnd Bergmann wrote:
> On Friday 02 March 2012, Jason wrote:
> > > 
> > > I have other commit IDs for the two patches that I took from your
> > > emails, so you should rebase the other patches on top of the
> > > version that I have in the arm-soc/kirkwood/board branch, otherwise
> > > we end up with duplicate commits my tree when I pull them again.
> > 
> > Got it, I cherry-picked the series over and incorporated Grant's
> > suggestions.
> > 
> 
> Just making sure you know about this one:
> 
> git rebase -i --onto arm-soc/kirkwood/board torvalds/master
> 
> The '-i' lets you pick which ones you want to move over, then it
> applies all patches from the current branch that are not on
> torvalds/master on top of the last commit from arm-soc/kirkwood/board.
> 
> If you don't know it yet, I suggest you play with this for an hour
> or so that will be very well invested time. If you knew this, then nevermind.

I use the daylights out of git rebase -i, but hadn't made use of --onto
yet.  Thanks for the tip.

thx,

Jason.
