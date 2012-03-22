From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ARM: SPEAr600: Add device-tree support to SPEAr600 boards
Date: Thu, 22 Mar 2012 08:10:00 +0000
Message-ID: <201203220810.00628.arnd@arndb.de>
References: <1331650032-15274-1-git-send-email-sr@denx.de>
 <201203211826.38993.arnd@arndb.de>
 <CAOh2x=nZUobbRJo7kdAwmEG+s51BabxPwUVz=S3oNJyTpuRpCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAOh2x=nZUobbRJo7kdAwmEG+s51BabxPwUVz=S3oNJyTpuRpCQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: viresh kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>, Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 22 March 2012, viresh kumar wrote:
> On Wed, Mar 21, 2012 at 11:56 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > I just noticed that you have git trees on http://git.stlinux.com/,
> > which I would personally prefer you to use actually. git.kernel.org
> > is most useful for people that don't have their own git servers.
> 
> Ah, that's even better for me too. I don't really have to manage
> two trees.
> 
> Just to understand the flow, how does this work now?
> There can be two sources of patches:
> - From ST internal developers
> - From external developers
> 
> Should i apply them all to my tree and then send you a pull request?
> Or you automatically pull everyday from some specific branch?
> 
> Sorry i am new to this. :(

No problem. Just apply them all to one tree and send me pull
requests when you think they are stable enough and should get into
arm-soc. Once they are in there, I'm not rebasing the patches
any more, but you are free to rebase and reorder the patches
before you send them to me.

If you would like me to take patches that are still under work
and may have to get changed, that's fine too, but tell me in advance
so we can put them into a staging branch that will be part of 
the linux-next kernel but can still get rebased. I'm not sending
staging branches to Linus though, unless you tell me to turn
them into stable branches before the merge window.

Also, please base all your pull requests on an -rc release from
Linus, or (if you have special dependencies) on a stable branch
from another person that then needs to get sent to Linus before
I send your changes. The pull requests should be split up by
topic, e.g. 'general cleanup', 'consolidation of SPEAr3xx and
SPEAr600', 'device tree conversion', 'board specific changes'
etc. so we can combine them with similar topics from other
platform maintainers when sending them out to Linus.

There are two bug fix branches, one for the current kernel (now
3.4) and one for the 'next' kernel (will be 3.5). Any important
changes should go into the 'current' fixes branch, and patches
that also apply to older kernels should get marked 'Cc:
stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org' so that Greg will automatically grab
them and apply them to his stable kernel series.

When you send a pull request, please send it to arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
so it reaches both Olof and me, as we are taking turns in
applying them to the arm-soc tree.

Don't hesitate to ask if you have further process questions, I
know this can be confusing and we're doing things much stricter
than other maintainters in order to keep up with ~600 patches
per merge window.

	Arnd
