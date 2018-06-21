From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2 2/2] hwmon: npcm750: add NPCM7xx PWM and Fan
	driver
Date: Thu, 21 Jun 2018 07:48:38 -0700
Message-ID: <8f9c37fd13abe2596521afb5d2779f644c214a93.camel@perches.com>
References: <20180619105352.97181-1-tmaimon77@gmail.com>
 <20180619105352.97181-3-tmaimon77@gmail.com>
 <20180620164853.GA3459@roeck-us.net>
 <a6a5a21236c37cfc63329e54248d941bf6d49e3c.camel@perches.com>
 <alpine.DEB.2.20.1806211515060.3774@hadrien>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cocci-bounces@systeme.lip6.fr>
In-Reply-To: <alpine.DEB.2.20.1806211515060.3774@hadrien>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jdelvare@suse.com, Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, brendanhiggins@google.com, linux-kernel@vger.kernel.org, yuenn@google.com, robh+dt@kernel.org, joel@jms.id.au, linux-hwmon@vger.kernel.org, cocci <cocci@systeme.lip6.fr>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

On Thu, 2018-06-21 at 15:17 +0200, Julia Lawall wrote:
> On Wed, 20 Jun 2018, Joe Perches wrote:
> > Also, spatch (1.0.4) seems to have a defect for this
> > when the type is used in operations that change a
> > smaller type to int or unsigned int.
> > 
> > i.e.: (offset is u16, but offset * 2 is int)
> 
> Ah.  The rule is that the result type is always the larger one?

Yes, but not quite, no.

The c90 rules are called "integer promotions" and are
detailed in section 6.3 Conversions

Basically, if any type is smaller than int, all operations
are done as int if possible, or unsigned int if necessary.
If any type is larger than int, then the larger type is used.

If you don't have the c90 standard, this one is close enough.
http://c0x.coding-guidelines.com/6.3.html
(use the next button several times to read the whole section)

Also, section 6.5 details "expressions" where the operands 
of things like bit operations use integer promotions.

> Unfortunately, Coccinelle doesn't know the size of any type.  I could add
> some special cases, but that may be more confusing than helpful.

Maybe, but when I saw the suggested removal, I was surprised.
