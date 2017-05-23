From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: Re: [PATCH 08/13] ARM: dts: armada-385-linksys: use binary unit
 prefixes
Date: Tue, 23 May 2017 10:33:02 +0200
Message-ID: <20170523103302.4f78eb93@gmail.com>
References: <20170521124903.11050-1-ralph.sennhauser@gmail.com>
        <20170521124903.11050-9-ralph.sennhauser@gmail.com>
        <20170522150001.GM29447@lunn.ch>
        <20170522202416.1c48d91a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170522202416.1c48d91a@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-kernel@lists.infradead.org, Gregory Clement <gregory.clement@free-electrons.com>, Imre Kaloz <kaloz@openwrt.org>, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 22 May 2017 20:24:16 +0200
Ralph Sennhauser <ralph.sennhauser@gmail.com> wrote:

> On Mon, 22 May 2017 17:00:01 +0200
> Andrew Lunn <andrew@lunn.ch> wrote:
> 
> > On Sun, May 21, 2017 at 02:48:57PM +0200, Ralph Sennhauser wrote:  
> > > Use IEEE 1541-2002 unit prefixes for sizes.    
> > 
> > Does ePAPR recommend this?  
> 
> Not directly, but the paper (v1.1) itself is using MiB as well which
> could be seen as a recommendation.

Found the pdf again on the web, so here a link:
http://elinux.org/images/c/cf/Power_ePAPR_APPROVED_v1.1.pdf

Funny thing it's using KB(instead of KiB) and MiB. So it's
inconsistent, also the unit with SI prefix would be kB and not KB. So
I'd say ePAPR doesn't care / the authors didn't pay any attention to
this.

Ralph
