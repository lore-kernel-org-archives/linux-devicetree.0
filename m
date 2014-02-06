From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 4/4] ARM: Kirkwood: Add support for many Synology NAS
 devices
Date: Thu, 6 Feb 2014 18:03:33 +0100
Message-ID: <20140206170333.GK29860@lunn.ch>
References: <1391634309-3123-1-git-send-email-andrew@lunn.ch>
 <20140206153939.GD8533@titan.lakedaemon.net>
 <20140206160126.GH29860@lunn.ch> <107057891.kz6j7UkZNk@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <107057891.kz6j7UkZNk@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Ben Peddell <klightspeed@killerwolves.net>, Jason Cooper <jason@lakedaemon.net>, pawel.moll@arm.com, devicetree@vger.kernel.org, Ian Campbell <ijc@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 06, 2014 at 05:38:28PM +0100, Arnd Bergmann wrote:
> On Thursday 06 February 2014 17:01:26 Andrew Lunn wrote:
> 
> > , but this is, imho,
> > > over-fragmenting.  I'm sure there's a reason you chose this path, but
> > > you haven't explained why in your commit log. So I'm left guessing...
> > 
> > Synology seem to build there devices like lego. They have two
> > different RTC blocks. They have three different fan alarm blocks, four
> > different led blocks, etc. And to build a product, the just select a
> > group of blocks and put them together.
> 
> I guess the Armada-370 and newer based ds213j and dsx14 will also be
> able to reuse some of the blocks, right?

Hi Arnd

I've not looked at any sources for those yet. I guess the RTC .dtsi
files should be reusable. The ethernet driver on 370 is different so
no re-use there. Maybe the fan controller, but the rest will depend on
what GPIO lines they have used, if they are compatible.

     Andrew
