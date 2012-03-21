From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: SPEAr600: Add device-tree support to SPEAr600 boards
Date: Wed, 21 Mar 2012 14:04:35 +0000
Message-ID: <201203211404.35847.arnd@arndb.de>
References: <1331650032-15274-1-git-send-email-sr@denx.de>
 <201203211236.37891.arnd@arndb.de>
 <CAOh2x==J4qkp29w+v=GWORBua-DE3yb0MRGOtBLyELxbGZwcuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOh2x==J4qkp29w+v=GWORBua-DE3yb0MRGOtBLyELxbGZwcuA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: viresh kumar <viresh.linux@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Stefan Roese <sr@denx.de>, spear-devel <spear-devel@list.st.com>, "devicetree-discuss@ozlabs.org" <devicetree-discuss@ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 21 March 2012, viresh kumar wrote:
> On Wed, Mar 21, 2012 at 6:06 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> > Just let me know how you want to handle
> > these things in the future -- the normal way would be to always let you
> > forward the patches to me, rather than having them applied to arm-soc
> > directly.
> 
> Hmmm. I don't know how exactly it works, but maybe you can add me as
> an custodian for SPEAr, with a git repo somewhere in kernel.org (?).
> So that i can apply patches directly to my branch, you pull it.
> What do you say?

Yes, that would be the ideal way. You are already listed in the MAINTAINERS
file, so nothing would change in theory. If you don't have an account on
kernel.org yet, see http://www.kernel.org/faq/#account for how to get
one. This will require that you have your gpg keys signed by at least
one person in the kernel web of trust, so you may have to find people
locally who can sign yours and are already signed.

> > I think spear is simple and clean enough that it can serve as an example
> > for others doing DT conversion. Do you also plan to unify 3xx and 6xx?
> > I think there is hardly anything left in mach-spear6xx that justifies
> > having a separate platform, especially since with the DT conversion done,
> > we can actually remove most of the header file contents as well.
> 
> I issue with us was that we were not able to push stuff mainline in time and
> were too busy supporting customers.
> 
> We have lot of patches locally, that we would like to upstream. But it
> can't happen
> without updating it with new expectations of list. I actually wanted
> to ask you few
> things:
> 
> - DT: Obviously we would have this in our patches
> - Pinmux: I would remove our padmux and use pinmux, but what about its
> DT support.
>   I know stephen had few patches for it, but don't know there
> progress. I don't want to
>   do stuff twice. First add support for it in board and the *.dts files.

AFAICT, the pinmux DT binding should be ready for v3.5, I don't think it
made it into v3.4.

> - Clock Framework: Is common clock framework ready for use or can we update our
>   local clock framework?

I'm sending it to Linus now and you can start using it, but it may still
change in a number of ways based on the requirements of new platforms that
start migrate to it.

> I will see if merging 3xx & 6xx is feasible. If yes, then i will
> surely move in that direction.
> I always like cleaning stuff. :)

I've looked at this earlier today out of curiosity and found:

debug_macro.h, gpio.h, hardware.h, timex.h, uncompress.h:
	 identical already
clock.c: almost identical, can be easily merged, or both copies
         kept around during transition.
misc_regs.h: can be merged into clock.c
spear.h: can merged into spear6xx.c but mostly go away
generic.h, irqs.h: not needed any more for spear6xx

Once you have taken care of these, files, you can enable building 3xx
and 6xx together, and move the contents of mach-spear3xx, mach-spear6xx
and plat-spear into one directory.

> I would be adding 13xx (cortex-A9) patches again later, once done with 3xx.

Ok, excellent. Note that there is no requirement to do it all in the order
you line out above. You can always get support for new stuff into the
existing platform without cleaning up all of it right away, as long as you
have a good balance between cleanups and new functionality.

In particular, you don't have to start using pinctrl and the common clk
immediately for spear3xx, although you might find that it helps you.

For spear13xx, the platform being completely new, I would however ask
you to use those from the start.

	Arnd
