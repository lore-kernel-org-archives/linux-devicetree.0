From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 2/3] of: Introduce safe accessors for node->data
Date: Tue, 9 Feb 2010 10:25:22 -0700
Message-ID: <fa686aa41002090925q30f362d6x4d14894a72439125@mail.gmail.com>
References: <20100205204949.GA2575@oksana.dev.rtsoft.ru> <20100205205043.GB4178@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100205205043.GB4178@oksana.dev.rtsoft.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Anton Vorontsov <avorontsov@ru.mvista.com>
Cc: David Brownell <dbrownell@users.sourceforge.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, David Miller <davem@davemloft.net>, Michal Simek <monstr@monstr.eu>, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, microblaze-uclinux@itee.uq.edu.au
List-Id: devicetree@vger.kernel.org

On Fri, Feb 5, 2010 at 1:50 PM, Anton Vorontsov
<avorontsov@ru.mvista.com> wrote:
> Platform code use node->data to store some private information
> associated with a node.
>
> Previously there was no need for any locks and accessors since we were
> initializing the data mostly at boot time and never modified it later.
>
> Though, nowadays OF GPIO infrastructure supports GPIO chips detaching,
> so to handle this correctly we have to introduce locking for the
> node->data field.

I'm not convinced this is needed.  What's wrong with using the
whole-tree devtree_lock?

g.
