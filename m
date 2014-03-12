From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 3/3] pinctrl: mvebu: silence WARN to dev_warn
Date: Wed, 12 Mar 2014 11:46:24 -0400
Message-ID: <20140312154624.GB7811@titan.lakedaemon.net>
References: <1393977790-29110-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1393977790-29110-4-git-send-email-sebastian.hesselbarth@gmail.com>
 <20140306201803.GL1872@titan.lakedaemon.net>
 <CACRpkda0JCLZUv_KPmwucDh3ko2YbtG2ukMMscSodAbBpiY+zw@mail.gmail.com>
 <20140307035056.GQ1872@titan.lakedaemon.net>
 <CACRpkdbEQSj7jLWT2BFR22m7phwmyKCByhQuFFgHvHoKvQFD5g@mail.gmail.com>
 <20140307134616.GR1872@titan.lakedaemon.net>
 <CACRpkdbcbMNim9LRkr75Mk5yHfwbA1OAexByHG50qDUPwts4uQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbcbMNim9LRkr75Mk5yHfwbA1OAexByHG50qDUPwts4uQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 12, 2014 at 03:02:02PM +0100, Linus Walleij wrote:
> On Fri, Mar 7, 2014 at 2:46 PM, Jason Cooper <jason@lakedaemon.net> wrote:
> > On Fri, Mar 07, 2014 at 11:56:11AM +0800, Linus Walleij wrote:
> 
> >> For a single patch?
> >
> > Well, just the doc change and WARN change.  I've already taken the dts
> > change into mvebu/dt (for arm-soc).
> 
> I've applied this patch [3/3] to the pinctrl tree.

Ok, thanks.

> > There should be no need for these two to be in mvebu's for-next, so if
> > it's easier for you to pick them, please do so.
> >
> > I'll drop them from mvebu/pinctrl and update mvebu's for-next right now.
> 
> No, I mean, please apply patch 1/3 and 2/3 to the mvebu tree.
> There is no need to sync DTS and pinctrl driver changes. This
> patch to the pinctrl driver I want to carry however.

Sorry I wasn't clear.  patch 2/3 depends on

  356ca6ce0aa4 devicetree: bindings: update MVEBU pinctrl binding documentation

Which is in the mvebu/pinctrl branch you have merged into your tree.

I usually keep the binding documentation changes in the same branch with
the code changes so that during a future bisect, the documentation has a
better chance of being consistent with the code at the point of failure.
It's a detail thing, I know, but I couldn't find a downside to doing it.
Well, until now.  :-)

thx,

Jason.
