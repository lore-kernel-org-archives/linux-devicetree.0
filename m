From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] regulator: Use of_node_name_eq for node name comparisons
Date: Wed, 13 Mar 2019 14:36:35 -0300
Message-ID: <CAOMZO5CwxZv=kAiqZ7YE2eRV1tTA13xbz1czUXOiScBoBfk75A@mail.gmail.com>
References: <20181205195050.4759-21-robh@kernel.org> <1552497686.2453.49.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552497686.2453.49.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Lucas,

On Wed, Mar 13, 2019 at 2:22 PM Lucas Stach <l.stach@pengutronix.de> wrote:

> Unfortunately this change causes a regression on systems with MC13xxx
> regulators. The desc.name field is filled with an uppercase name of the
> regulator, while the existing DTs (as far as I know) all use lowercase
> node names, so the matching in the function above doesn't work anymore.
>
> Any opinions about how to proceed here?

Does this patch fix the problem?
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20190306&id=ec520911ecc7eaf01a
