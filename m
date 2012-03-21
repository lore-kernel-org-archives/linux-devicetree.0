From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ARM: SPEAr600: Add device-tree support to SPEAr600 boards
Date: Wed, 21 Mar 2012 18:26:38 +0000
Message-ID: <201203211826.38993.arnd@arndb.de>
References: <1331650032-15274-1-git-send-email-sr@denx.de>
 <CAOh2x==J4qkp29w+v=GWORBua-DE3yb0MRGOtBLyELxbGZwcuA@mail.gmail.com>
 <201203211404.35847.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201203211404.35847.arnd-r2nGTMty4D4@public.gmane.org>
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

On Wednesday 21 March 2012, Arnd Bergmann wrote:
> 
> On Wednesday 21 March 2012, viresh kumar wrote:
> > On Wed, Mar 21, 2012 at 6:06 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > > Just let me know how you want to handle
> > > these things in the future -- the normal way would be to always let you
> > > forward the patches to me, rather than having them applied to arm-soc
> > > directly.
> > 
> > Hmmm. I don't know how exactly it works, but maybe you can add me as
> > an custodian for SPEAr, with a git repo somewhere in kernel.org (?).
> > So that i can apply patches directly to my branch, you pull it.
> > What do you say?
> 
> Yes, that would be the ideal way. You are already listed in the MAINTAINERS
> file, so nothing would change in theory. If you don't have an account on
> kernel.org yet, see http://www.kernel.org/faq/#account for how to get
> one. This will require that you have your gpg keys signed by at least
> one person in the kernel web of trust, so you may have to find people
> locally who can sign yours and are already signed.

I just noticed that you have git trees on http://git.stlinux.com/,
which I would personally prefer you to use actually. git.kernel.org
is most useful for people that don't have their own git servers.

	Arnd
