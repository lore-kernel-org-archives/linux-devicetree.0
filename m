From: Anton Vorontsov <avorontsov@ru.mvista.com>
Subject: Re: [PATCH RFC 0/3] Implement refcounting for OF GPIO chips
Date: Tue, 9 Feb 2010 22:06:00 +0300
Message-ID: <20100209190600.GA26668@oksana.dev.rtsoft.ru>
References: <20100205204949.GA2575@oksana.dev.rtsoft.ru>
 <4B712DA5.4000802@petalogix.com>
Reply-To: avorontsov@ru.mvista.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B712DA5.4000802@petalogix.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@petalogix.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, David Brownell <dbrownell@users.sourceforge.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, David Miller <davem@davemloft.net>, Michal Simek <monstr@monstr.eu>, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, microblaze-uclinux@itee.uq.edu.au
List-Id: devicetree@vger.kernel.org

On Tue, Feb 09, 2010 at 10:40:53AM +0100, Michal Simek wrote:
[...]
> >The above situation is hard to trigger, but the issue is there
> >nonetheless, and so needs fixing.
> 
> 
> I tested xilinx gpio driver, heartbeat trigger and access through
> sysfs and I haven't found any problem. There is only small part of
> code for Microblaze and it is the same with PowerPC. If is Ben OK
> with it, I am ok too.

Thanks for testing!

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
