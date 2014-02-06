From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 4/4] ARM: Kirkwood: Add support for many Synology NAS
 devices
Date: Thu, 06 Feb 2014 17:38:28 +0100
Message-ID: <107057891.kz6j7UkZNk@wuerfel>
References: <1391634309-3123-1-git-send-email-andrew@lunn.ch>
 <20140206153939.GD8533@titan.lakedaemon.net> <20140206160126.GH29860@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140206160126.GH29860@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Ben Peddell <klightspeed@killerwolves.net>, Jason Cooper <jason@lakedaemon.net>, pawel.moll@arm.com, devicetree@vger.kernel.org, Ian Campbell <ijc@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thursday 06 February 2014 17:01:26 Andrew Lunn wrote:

> , but this is, imho,
> > over-fragmenting.  I'm sure there's a reason you chose this path, but
> > you haven't explained why in your commit log. So I'm left guessing...
> 
> Synology seem to build there devices like lego. They have two
> different RTC blocks. They have three different fan alarm blocks, four
> different led blocks, etc. And to build a product, the just select a
> group of blocks and put them together.

I guess the Armada-370 and newer based ds213j and dsx14 will also be
able to reuse some of the blocks, right?

	Arnd
