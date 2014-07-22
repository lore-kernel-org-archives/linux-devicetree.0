From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v8 00/11] ARM: brcmstb: Add Broadcom STB SoC support
Date: Wed, 23 Jul 2014 00:24:23 +0200
Message-ID: <6456081.JRV4vu9CHq@wuerfel>
References: <1405976886-27807-1-git-send-email-computersforpeace@gmail.com>
 <5044348.IEPQPrahyu@wuerfel> <20140722213350.GX2593@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140722213350.GX2593@beef>
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Christian Daudt <bcm@fixthebug.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Matt Porter <mporter@linaro.org>, Sebastian Reichel <sre@kernel.org>, Gregory Fong <gregory.0xf0@gmail.com>, Olof Johansson <olof@lixom.net>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 22 July 2014 17:33:50 Matt Porter wrote:
> 
> > > For the reset of mach-bcm stuff, I'll just send an arm-soc pull request
> > > soon enough, unless Matt/Arnd/Olof object.
> > 
> > I'll wait for Matt to comment before pulling it, otherwise that sounds
> > fine.
> 
> I'm fine with it, but we were asked to have one request for bcm5301x to
> make life easy for the arm-soc team. If we want each platform to do pull
> requests directly with arm-soc we should advise Hauke to do the same as
> well with bcm5301x. I think the chances of Kconfig/Makefile conflicts are
> relatively low as there's a dwindling amount of code of interest in new
> platform mach directories like ours.
> 
> I would like to see a consistent path for all BCM platform maintainers.
> 

Ok. Brian, please send the pull request or patches to Matt then.

	Arnd
