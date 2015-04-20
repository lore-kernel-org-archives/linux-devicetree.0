From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH 02/14] MIPS: ath79: Add basic device tree support
Date: Mon, 20 Apr 2015 11:50:56 +0200
Message-ID: <1429523456.14597.23.camel@x220>
References: <1429280669-2986-1-git-send-email-albeu@free.fr>
	 <1429280669-2986-3-git-send-email-albeu@free.fr>
	 <1429340752.16771.120.camel@x220> <20150418183149.69c0795b@tock>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150418183149.69c0795b@tock>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 2015-04-18 at 18:31 +0200, Alban wrote:
> On Sat, 18 Apr 2015 09:05:52 +0200
> Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org> wrote:
> 
> > On Fri, 2015-04-17 at 16:24 +0200, Alban Bedel wrote:
> > 
> > > --- a/arch/mips/ath79/Kconfig
> > > +++ b/arch/mips/ath79/Kconfig
> > >  
> > > +choice
> > > +	prompt "Builtin devicetree selection"
> > > +	default DTB_ATH79_NONE
> > > +	help
> > > +	  Select the devicetree.
> > > +
> > > +	config DTB_ATH79_NONE
> > > +		bool "None"
> > > +endchoice
> > 
> > This adds a choice block with one config entry. So what this achieves
> > is that DTB_ATH79_NONE will always be 'y', right? Besides I didn't
> > notice on a user of CONFIG_DTB_ATH79_NONE. So as far as I can see
> > this choice has no effect on the build.
> > 
> > Why was this choice entry added?
> 
> This menu is for boards that need a built-in DTB, as MIPS currently
> doesn't support appended DTBs it is the only way to load a DTB on
> boards stuck with a broken boot loader. But as no board has been added
> yet it only contain the entry for boards that don't need a built-in
> DTB, which do nothing as you pointed out.
> 
> A board is then added in this menu in patch 14, for some reasons git
> send-email didn't send the whole serie at once :(

I saw 14/14 fly by now. (And I saw 12/12 of v2, which basically replaces
14/14.) That makes things clear.

Perhaps, if you're going to send a v3, you might move this change into
12/12. At least, I see little reason to add this choice block in two
separate steps in this series.

(Side note: you _might_ be able to drop config DTB_ATH79_NONE entirely
if you also replace
	default DTB_ATH79_NONE

with
	optional

optional is a little used option for choice blocks. I haven't tested
this, so this suggestion could end up wasting your time. And even then
this all looks like a complicated way to set just DTB_TL_WR1043ND_V1. I
suppose you expect to add things to this choice block in the future.)

Thanks,


Paul Bolle

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
