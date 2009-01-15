From: Matt Sealey <matt@genesi-usa.com>
Subject: Re: dtc/u-boot tool naming, "ftdump", "mkimage"
Date: Wed, 14 Jan 2009 18:34:34 -0600
Message-ID: <496E849A.8020707@genesi-usa.com>
References: <496E2796.3090405@genesi-usa.com>
	<20090114181028.GB7768@yoda.jdub.homelinux.org>
	<496E3604.8030007@genesi-usa.com> <496E38DA.8080408@ge.com>
	<20090114191905.GA18581@yoda.jdub.homelinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <20090114191905.GA18581@yoda.jdub.homelinux.org>
List-Unsubscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Josh Boyer <jwboyer@gmail.com>
Cc: u-boot@lists.denx.de, devicetree-discuss@ozlabs.org
List-Id: devicetree@vger.kernel.org

Josh Boyer wrote:

> David has said before that ftdump is sort of a pointless debugging tool.
> Or at least that is what the Debian bug report referrenced as the reason
> from removing it from the Debian dtc package.

As long as you have the original device tree source code to hand. I tend 
to find that the guy who sent me the device tree and kernel for me to 
test, has gone to bed and will not be back for 8 to 10 hours. Rather 
than hang around, on the event that I think it's a device tree problem I 
tend to ftdump to see what's going on.

It might have some use somewhere someday, but yeah.. I guess.. bringing 
it out from a build into a package is kind of a dumb idea.

> Maybe we should just remove it entirely if it's not really going to be
> maintained long-term.

Up to you.

-- Matt
