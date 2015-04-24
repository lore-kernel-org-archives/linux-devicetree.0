From: Alban <albeu@free.fr>
Subject: Re: [PATCH 02/14] MIPS: ath79: Add basic device tree support
Date: Fri, 24 Apr 2015 11:39:40 +0200
Message-ID: <20150424113940.132ac92c@tock>
References: <1429280669-2986-1-git-send-email-albeu@free.fr>
	<1429280669-2986-3-git-send-email-albeu@free.fr>
	<1429340752.16771.120.camel@x220>
	<20150418183149.69c0795b@tock>
	<1429523456.14597.23.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429523456.14597.23.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Aban Bedel <albeu@free.fr>, linux-mips@linux-mips.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 20 Apr 2015 11:50:56 +0200
Paul Bolle <pebolle@tiscali.nl> wrote:

> On Sat, 2015-04-18 at 18:31 +0200, Alban wrote:
> > On Sat, 18 Apr 2015 09:05:52 +0200
> > Paul Bolle <pebolle@tiscali.nl> wrote:
> > 
> > > On Fri, 2015-04-17 at 16:24 +0200, Alban Bedel wrote:
> > > 
> > > > --- a/arch/mips/ath79/Kconfig
> > > > +++ b/arch/mips/ath79/Kconfig
> > > >  
> > > > +choice
> > > > +	prompt "Builtin devicetree selection"
> > > > +	default DTB_ATH79_NONE
> > > > +	help
> > > > +	  Select the devicetree.
> > > > +
> > > > +	config DTB_ATH79_NONE
> > > > +		bool "None"
> > > > +endchoice
> > > 
> > > This adds a choice block with one config entry. So what this
> > > achieves is that DTB_ATH79_NONE will always be 'y', right?
> > > Besides I didn't notice on a user of CONFIG_DTB_ATH79_NONE. So as
> > > far as I can see this choice has no effect on the build.
> > > 
> > > Why was this choice entry added?
> > 
> > This menu is for boards that need a built-in DTB, as MIPS currently
> > doesn't support appended DTBs it is the only way to load a DTB on
> > boards stuck with a broken boot loader. But as no board has been
> > added yet it only contain the entry for boards that don't need a
> > built-in DTB, which do nothing as you pointed out.
> > 
> > A board is then added in this menu in patch 14, for some reasons git
> > send-email didn't send the whole serie at once :(
> 
> I saw 14/14 fly by now. (And I saw 12/12 of v2, which basically
> replaces 14/14.) That makes things clear.
> 
> Perhaps, if you're going to send a v3, you might move this change into
> 12/12. At least, I see little reason to add this choice block in two
> separate steps in this series.

Ok, I'll do that.

> (Side note: you _might_ be able to drop config DTB_ATH79_NONE entirely
> if you also replace
> 	default DTB_ATH79_NONE
> 
> with
> 	optional
> 
> optional is a little used option for choice blocks. I haven't tested
> this, so this suggestion could end up wasting your time. And even then
> this all looks like a complicated way to set just DTB_TL_WR1043ND_V1.

I'll try that.

> I suppose you expect to add things to this choice block in the
> future.)

This is the only ATH79 board I currently have access to. However
openwrt has patches to add support for quiet a few, so I hope more
boards will be submitted once we have DT support in. Most of these
boards are appliance stuck with old bootloaders, so they will need this
too. 

Alban
