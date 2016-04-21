From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [RFC/PATCH] of: of_find_node_by_name - stop dropping reference
 to 'from' node
Date: Fri, 22 Apr 2016 08:42:23 +1000
Message-ID: <1461278543.3135.16.camel@kernel.crashing.org>
References: <20160419170540.GA8327@dtor-ws> <571955A4.7080706@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <571955A4.7080706@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, Scott Wood <oss@buserror.net>, Kumar Gala <galak@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Arnd Bergmann <arnd@arndb.de>, Grant Likely <grant.likely@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2016-04-21 at 15:35 -0700, Frank Rowand wrote:
> No.=C2=A0 It is correct for of_find_by_name() to call of_node_put() f=
or
> the from argument.=C2=A0 The callers should be fixed.

I would argue that if everybody makes the same mistake then our
interface is wrong. In that case I wrote it so I think I can plead
guilty to the mistake ;-)

In hindsight, but I don't have the stammina to do a tree-wide change, I
think we should have differenciated:

	of_find_xxx which does *not* drop the reference

	of_find_next_xxx which does

Cheers,
Ben.
