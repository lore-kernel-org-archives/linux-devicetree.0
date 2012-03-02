From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: kirkwood: fdt: convert kirkwood init funcs to fdt
Date: Fri, 2 Mar 2012 16:58:11 +0000
Message-ID: <201203021658.12047.arnd@arndb.de>
References: <cover.1330625877.git.jason@lakedaemon.net>
 <201203012214.07019.arnd@arndb.de>
 <20120302163121.GI11986@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120302163121.GI11986-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 02 March 2012, Jason wrote:
> > 
> > I have other commit IDs for the two patches that I took from your
> > emails, so you should rebase the other patches on top of the
> > version that I have in the arm-soc/kirkwood/board branch, otherwise
> > we end up with duplicate commits my tree when I pull them again.
> 
> Got it, I cherry-picked the series over and incorporated Grant's
> suggestions.
> 

Just making sure you know about this one:

git rebase -i --onto arm-soc/kirkwood/board torvalds/master

The '-i' lets you pick which ones you want to move over, then it
applies all patches from the current branch that are not on
torvalds/master on top of the last commit from arm-soc/kirkwood/board.

If you don't know it yet, I suggest you play with this for an hour
or so that will be very well invested time. If you knew this, then nevermind.

	Arnd
