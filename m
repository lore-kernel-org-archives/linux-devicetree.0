From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Subject: Re: getting allwinner SoC support upstream (was Re:
	Uploading linux (3.9.4-1))
Date: Wed, 5 Jun 2013 23:38:52 +0100
Message-ID: <CAPweEDzk0T+fZ1aW16D8K4XpvRR2GRrOFtfcjzstnmEJWxmREg@mail.gmail.com>
References: <CAPweEDx3mAy40BZrzrKPRbvg7vKMj7KevDQ3m_v4p6Yo50eSGg@mail.gmail.com>
	<CAKON4OxDD5orX2w-_+d5kawTGXbE3KKj2QLERo9m7=NiUSXhgQ@mail.gmail.com>
	<CAPweEDzDC87KmOQ=0hyPcjPtPsRuXHxNTs97vbEqVNNnix69rA@mail.gmail.com>
	<19865137.ey1FePPnmD@flatron>
Reply-To: Linux on small ARM machines <arm-netbook@lists.phcomp.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <arm-netbook-bounces@lists.phcomp.co.uk>
In-Reply-To: <19865137.ey1FePPnmD@flatron>
List-Unsubscribe: <http://lists.phcomp.co.uk/mailman/options/arm-netbook>,
	<mailto:arm-netbook-request@lists.phcomp.co.uk?subject=unsubscribe>
List-Archive: <http://lists.phcomp.co.uk/pipermail/arm-netbook/>
List-Post: <mailto:arm-netbook@lists.phcomp.co.uk>
List-Help: <mailto:arm-netbook-request@lists.phcomp.co.uk?subject=help>
List-Subscribe: <http://lists.phcomp.co.uk/mailman/listinfo/arm-netbook>,
	<mailto:arm-netbook-request@lists.phcomp.co.uk?subject=subscribe>
Errors-To: arm-netbook-bounces@lists.phcomp.co.uk
Sender: "arm-netbook" <arm-netbook-bounces@lists.phcomp.co.uk>
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: devicetree-discuss <devicetree-discuss@ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, debian-arm@lists.debian.org, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, Linux on small ARM machines <arm-netbook@lists.phcomp.co.uk>, linux-arm-kernel@lists.infradead.org, debian-kernel@lists.debian.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 5, 2013 at 10:52 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Luke,

 allo tomasz :)

 ok - much of what you say is duplicated by what russell said, so in
effect the same reply is relevant, but there's been some cross-over.
i'll summarise below and cut all but the key question below:

> I tend to disagree with your view. Is it really our task to convince such
> companies to work with open source community?

 their sheer overwhelming success provides us with mass-volume
ultra-low cost hardware.  to not make an effort to accommodate them
would in this specific instance be a huge missed opportunity,
responsibility for which currently falls on the shoulders of the sunxi
community, where that small community is in no way considered
"authoritative" as an upstream source and thus every single GNU/Linux
Distro is left in a position of forcing people to follow insane
non-standard build procedures that are *way* outside of the capability
of the average person.

 so by the linux kernel developers intransigent position, the reach of
free software as a whole is greatly reduced.  simple logical
unavoidable conclusion.

 please feel free - linux kernel developers - to maintain this
intransigent position for as long as you find it useful to you to do
so.  btw, that is a sincere statement, devoid and completely free of
all and any implicit or explicit additional statements and
implications.


>> > Device tree on ARM's goal is to achieve a single kernel across
>> > vendors, not just a single kernel for a single vendor.
>>
>>  you'll be aware that i've mentioned a number of times and have
>> discussed at some length why this is a goal that is completely
>> impossible to achieve [*1].  sadly.
>
> I tend to disagree on this as well, but it's another story. Have read one
> of the discussions on this topic and it seemed to look more like lobbying
> for one of the standards being promoted by some company,

 yeahh, that's rather unfortunate.  i went to some lengths to avoid
mentioning eoma [*1] until there was a natural point at which it
became difficult *not* to bring it up, not least because i didn't hear
anyone else presenting any actual real workable solutions.

but, you have to bear in mind a couple of things:

a) i'm a free software developer and advocate.  "business", "lobbying"
etc. do not come naturally to me.  my associates scream at me
regularly.

b) i've been thinking about this incredibly hard problem for at least
4 years and almost *all* of my background in computing of the past 30
years leads me naturally towards actually coming up with a solution

c) i'm actually really, really really and truly going about *actively*
implementing that solution rather than just complaining about it *and*
i'm inviting free software developers to participate, why, because see
first sentence of a) above.

l.

[*1] which is an open standard, not a proprietary locked one.
