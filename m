From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: Re: [PATCH 1/1] ARM: dts: armada-xp-linksys-mamba: use wan instead
 of internet for DSA port
Date: Wed, 5 Apr 2017 18:08:08 +0200
Message-ID: <20170405180808.4f8924cb@gmail.com>
References: <20170405052847.326-1-ralph.sennhauser@gmail.com>
 <20170405142824.GB13449@lunn.ch>
 <20170405172224.38c1f9fb@gmail.com>
 <20170405155032.GL13449@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170405155032.GL13449@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On Wed, 5 Apr 2017 17:50:32 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > In fact "internet" label on the case is uppercase, would this matter
> > for you for new bindings, or would you still use the lowercase
> > version?  
> 
> I would use lower case, just to fix with the general convention that
> interface names are lower case.

Thanks

> 
> > > I would say, this is now too late. Changing an interface name will
> > > break configuration scripts. We are stuck with it.
> > >   
> > 
> > If it weren't for commit cb4f71c42988 that would have been obvious
> > for me as well.  
> 
> Yes, that was not nice. But it was also very earlier in the life of
> 38x, so it just affected a few developers with reference boards, not
> real products out in the wild, as far as i remember.
> 
>      Andrew

The mentioned commit bit me amongst others, see
https://lkml.org/lkml/2016/8/21/62

In fact I expect the impact to be much lower this time around, before
4.10 DSA was no contender for swconfig (out of tree switch driver as
used by OpenWrt and others). On Mamba ~200Mbit was top speed. Now they
perform roughly the same.


Thanks
Ralph
