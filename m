From: Ian Campbell <ijc@hellion.org.uk>
Subject: Re: [PATCH 4/4] ARM: Kirkwood: Add support for many Synology NAS
 devices
Date: Thu, 06 Feb 2014 16:52:04 +0000
Message-ID: <1391705524.2162.10.camel@kazak.uk.xensource.com>
References: <1391634309-3123-1-git-send-email-andrew@lunn.ch>
 <1391634309-3123-5-git-send-email-andrew@lunn.ch>
 <20140206153939.GD8533@titan.lakedaemon.net>
 <1391704765.2162.7.camel@kazak.uk.xensource.com>
 <20140206165003.GJ29860@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140206165003.GJ29860@lunn.ch>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ben Peddell <klightspeed@killerwolves.net>, Jason Cooper <jason@lakedaemon.net>, pawel.moll@arm.com, Kumar Gala <galak@codeaurora.org>, linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2014-02-06 at 17:50 +0100, Andrew Lunn wrote:
> On Thu, Feb 06, 2014 at 04:39:25PM +0000, Ian Campbell wrote:
> > On Thu, 2014-02-06 at 10:39 -0500, Jason Cooper wrote:
> > > 
> > > > +                     pmx_fan_33: pmx-fan-33 {
> > > > +                             marvell,pins = "mpp33";
> > > > +                             marvell,function = "gpo";
> > > > +                     }; 
> > 
> > Typo I think.
> 
> Hi Ian
> 
> drivers/pinctrl/mvebu/pinctrl-kirkwood.c:
> 
>         MPP_MODE(33,
>                 MPP_VAR_FUNCTION(0x0, "gpo", NULL,       V(0, 1, 1, 1, 1, 0)),
>                 MPP_VAR_FUNCTION(0x2, "tdm", "dtx",      V(0, 0, 1, 1, 1, 0)),
>                 MPP_VAR_FUNCTION(0x3, "ge1", "txctl",    V(0, 1, 1, 1, 1, 0)),
>                 MPP_VAR_FUNCTION(0xb, "lcd", "d13",      V(0, 0, 0, 0, 1, 0))),
>         MPP_MODE(34,
> 
> It is output only.

Oops, Sorry for the noise!

> 
> I actually had the opposite bug in v1, setup two gpo's as gpio's.
> 
>   Andrew
> 
