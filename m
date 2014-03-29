From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH v2 03/10] ARM: at91: introduce OLD_IRQ_AT91 Kconfig option
Date: Sat, 29 Mar 2014 10:12:54 +0100
Message-ID: <7407417.cSDunZuEhW@wuerfel>
References: <1396029548-10928-1-git-send-email-b.brezillon.dev@gmail.com> <1396029548-10928-4-git-send-email-b.brezillon.dev@gmail.com> <20140329100639.5ea454bc@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140329100639.5ea454bc@skate>
Sender: linux-doc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Boris BREZILLON <b.brezillon.dev@gmail.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Rob Landley <rob@landley.net>, Thomas Gleixner <tglx@linutronix.de>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
List-Id: devicetree@vger.kernel.org

On Saturday 29 March 2014 10:06:39 Thomas Petazzoni wrote:
> Dear Boris BREZILLON,
> 
> On Fri, 28 Mar 2014 18:59:01 +0100, Boris BREZILLON wrote:
> 
> > +config OLD_IRQ_AT91
> > +     bool
> > +     default false
> 
> I don't think "default false" is a valid Kconfig construct. It could be
> "default n", but that's useless since "default n" is the default
> behavior. So I believe you can simply get rid of that line.

I think the above is syntactically correct, but it would be highly confusing in
anyone ever does

config false
	def_bool y

;-)

Aside from that, these three have completely identical meaning:

config OLD_IRQ_AT91
	bool

config OLD_IRQ_AT91
	def_bool n

config OLD_IRQ_AT91
	bool
	default n

	Arnd


