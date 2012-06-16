From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] devicetree: add helper inline for retrieving a node's
 full name
Date: Sat, 16 Jun 2012 14:59:30 +1000
Message-ID: <1339822770.9220.215.camel@pasglop>
References: <1339782625-28192-1-git-send-email-grant.likely@secretlab.ca>
	 <1339801070.9220.211.camel@pasglop> <20120616040028.C83513E0ACE@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120616040028.C83513E0ACE@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Paul Mundt <lethal@linux-sh.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Fri, 2012-06-15 at 22:00 -0600, Grant Likely wrote:
> On Sat, 16 Jun 2012 08:57:50 +1000, Benjamin Herrenschmidt <benh@kernel.crashing.org> wrote:
> > On Fri, 2012-06-15 at 11:50 -0600, Grant Likely wrote:
> > > The pattern (np ? np->full_name : "<none>") is rather common in the
> > > kernel, but can also make for quite long lines.  This patch adds a new
> > > inline function, of_node_full_name() so that the test for a valid node
> > > pointer doesn't need to be open coded at all call sites.
> > 
> > s/of_node_full_name/of_node_path ?
> 
> It would be nicer to have the shorter name, but the data member is
> already named full_name, so I'd rather use the same for the function
> name (unless you argue strongly against, it's not something I'm going
> to fight about).

Nah, it's just that full_name was never a very good choice to begin
with ... Do as you wish. Renaming the data member might be a bit
annoying I can immagine :-)

Cheers,
Ben.
