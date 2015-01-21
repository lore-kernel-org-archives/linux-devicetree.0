From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] of: Custom printk format specifier for device node
Date: Wed, 21 Jan 2015 09:52:07 -0800
Message-ID: <1421862727.10574.25.camel@perches.com>
References: <1421859974-24507-1-git-send-email-pantelis.antoniou@konsulko.com>
	 <1421861843.10574.23.camel@perches.com>
	 <D84576D1-27F5-44F9-83DA-347C26F593FE@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <D84576D1-27F5-44F9-83DA-347C26F593FE@antoniou-consulting.com>
Sender: linux-doc-owner@vger.kernel.org
To: Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robherring2@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 2015-01-21 at 19:39 +0200, Pantelis Antoniou wrote:
> Hi Joe,
>=20
> > On Jan 21, 2015, at 19:37 , Joe Perches <joe@perches.com> wrote:
> >=20
> > On Wed, 2015-01-21 at 19:06 +0200, Pantelis Antoniou wrote:
> >> 90% of the usage of device node's full_name is printing it out
> >> in a kernel message. Preparing for the eventual delayed allocation
> >> introduce a custom printk format specifier that is both more
> >> compact and more pleasant to the eye.
> >>=20
> >> For instance typical use is:
> >> 	pr_info("Frobbing node %s\n", node->full_name);
> >>=20
> >> Which can be written now as:
> >> 	pr_info("Frobbing node %pO\n", node);
> >=20
> > Still disliking use of %p0.
> >=20
>=20
> Choices are limited. And it=E2=80=99s pO not p0.

Yet another reason to dislike it.

> > This isn't pretty.  Perhaps there's a better way?
> >=20
>=20
> No there isn=E2=80=99t.

There always is.


