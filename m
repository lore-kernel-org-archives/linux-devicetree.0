From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH 2/2] uio: add an of_genirq driver
Date: Sun, 14 Jun 2009 12:27:07 -0700
Message-ID: <20090614192707.GA11003@suse.de>
References: <1244765062-14144-1-git-send-email-w.sang@pengutronix.de>
	<1244765062-14144-3-git-send-email-w.sang@pengutronix.de>
	<20090614122136.GD3639@local>
	<20090614171406.GA1010@pengutronix.de>
	<20090614183357.GE3639@local>
	<20090614190533.GA7387@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <20090614190533.GA7387@pengutronix.de>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: linuxppc-dev@ozlabs.org, "Hans J. Koch" <hjk@linutronix.de>, linux-kernel@vger.kernel.org, devicetree-discuss@ozlabs.org
List-Id: devicetree@vger.kernel.org

On Sun, Jun 14, 2009 at 09:05:33PM +0200, Wolfram Sang wrote:
> Well, I assume that issues regarding checkpatch do not have the highest
> priority (especially while the merge-window is open), which is understandable.

Hm, the "merge-window" for new stuff like these patches is pretty much
already closed, as you didn't send them _before_ the merge window opened
up.  You need to get them to us sooner, so we can test stuff out in the
-next tree for a while before we can merge them.

thanks,

greg k-h
