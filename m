From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH V5 0/4] ARM: Kirkwood: Add support for DNS-320 and
 DNS-325 using devicetree
Date: Wed, 18 Apr 2012 15:24:45 +0200
Message-ID: <20120418132445.GB25584@lunn.ch>
References: <1334743603-8488-1-git-send-email-jm@lentin.co.uk>
 <20120418131635.GK15711@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20120418131635.GK15711@titan.lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, Jamie Lentin <jm@lentin.co.uk>, Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> > dies at "Gating clock of unused units", presumably as CGC_RUNIT isn't set.
> > Is this something known or is it worth further investigation?
> 
> That could potentially mess up a future bisect.  However, it would only
> crop up for dnskw boards.  I'll let Grant weigh in on this since he's
> the one who asked that the nand init be removed.

Turning off RUNIT is bad. Both the NAND and SPI controllers use this
clock. You can only safely turn it off if none of these are active.

       Andrew
