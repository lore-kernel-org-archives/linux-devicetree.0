From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] regulator: Use of_node_name_eq for node name comparisons
Date: Wed, 13 Mar 2019 18:51:25 +0100
Message-ID: <1552499485.2453.53.camel@pengutronix.de>
References: <20181205195050.4759-21-robh@kernel.org>
         <1552497686.2453.49.camel@pengutronix.de>
         <CAOMZO5CwxZv=kAiqZ7YE2eRV1tTA13xbz1czUXOiScBoBfk75A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5CwxZv=kAiqZ7YE2eRV1tTA13xbz1czUXOiScBoBfk75A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

Am Mittwoch, den 13.03.2019, 14:36 -0300 schrieb Fabio Estevam:
> Hi Lucas,
> 
> > On Wed, Mar 13, 2019 at 2:22 PM Lucas Stach <l.stach@pengutronix.de> wrote:
> 
> > Unfortunately this change causes a regression on systems with MC13xxx
> > regulators. The desc.name field is filled with an uppercase name of the
> > regulator, while the existing DTs (as far as I know) all use lowercase
> > node names, so the matching in the function above doesn't work anymore.
> > 
> > Any opinions about how to proceed here?
> 
> Does this patch fix the problem?
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20190306&id=ec520911ecc7eaf01a

I wasn't aware of this patch. I haven't tested it yet, but this looks
like it should fix the problem. I just wasn't sure if that's the route
we want to go, as I don't know if there are any out of tree DTs that
use uppercase node names.

But as there seems to be agreement to just change the regulator names
to lowercase, I consider this issue fixed.

Regards,
Lucas
