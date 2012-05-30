From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v4 6/6] pinctrl: add pinctrl gpio binding support
Date: Wed, 30 May 2012 14:35:46 +0800
Message-ID: <20120530063547.01BD83E065C@localhost>
References: <1337952980-14621-1-git-send-email-b29396@freescale.com> <1337952980-14621-6-git-send-email-b29396@freescale.com> <4FBFBB74.901@wwwdotorg.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4FBFBB74.901@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Dong Aisheng <b29396@freescale.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@stericsson.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On Fri, 25 May 2012 11:03:48 -0600, Stephen Warren <swarren@wwwdotorg.org> wrote:
> I believe Grant wants to change the of_xlate prototype in order to be
> able to return a different gc value, so this will probably need slight
> rework work with that change, once they're both approved. Still, I think
> this is fine for now.

I took a different approach.  Now multiple gpio_chips can use the same
of node, and of_xlate needs to match on the entire gpio specifier, not
just the node.  This code is now in mainline.

g.
