From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v3 4/7] palmetto: Request relevant mux functions in
 devicetree
Date: Wed, 14 Sep 2016 06:58:15 +1000
Message-ID: <1473800295.8689.295.camel@kernel.crashing.org>
References: <20160830075600.11559-1-andrew@aj.id.au>
         <20160830075600.11559-5-andrew@aj.id.au>
         <CACPK8Xe-dowcwXkO8rDH2reMzGadUMSq5ZtV=23FP4virt+DUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACPK8Xe-dowcwXkO8rDH2reMzGadUMSq5ZtV=23FP4virt+DUQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc: Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Jeremy Kerr <jk@ozlabs.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2016-09-13 at 22:11 +0930, Joel Stanley wrote:
> It's not clear that all systems use these pins in that way. I will
> not
> include this one for now.

Well, it has VGA so the VGA hsync, vsync and DDC should be there at
least...

Ben.
