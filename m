From: tomas.hlavacek@nic.cz
Subject: Re: [PATCH RFC] ARM: dts: add support for Turris Omnia
Date: Mon, 14 Nov 2016 15:59:57 +0100
Message-ID: <1479135597.27133.2@smtp.gmail.com>
References: <20161105203841.9661-1-uwe@kleine-koenig.org>
 <1479126185.15557.5@smtp.gmail.com> <20161114131010.GC26710@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161114131010.GC26710@lunn.ch>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Martin Strba??ka <martin.strbacka@nic.cz>, Jason Cooper <jason@lakedaemon.net>, Uwe =?iso-8859-1?q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Andrew!

(Sorry for re-posting the previous e-mail, that most likely didn't get 
through.)

On Mon, Nov 14, 2016 at 2:10 PM, Andrew Lunn <andrew@lunn.ch> wrote:
>>  Actually SFP is connected to SGMII interface of eth1, which is
>>  routed through SERDES 5.
> 
> You say eth1 here. Yet lower down you say got eth0 and eth1 are
> connected to the switch?

Oh sorry, this was a NIC name based on probing order derived from base 
address of NIC registers:

	eth1: ethernet@30000 - probes as eth0
	eth2: ethernet@34000 - probes as eth1
	eth0: ethernet@70000 - probes as eth2

It is a bit confusing. I meant eth2 in DTS. Sorry.

> 
> 
>>  We have our proprietary support hacked onto mvneta driver for
>>  disconnecting PHY on the fly. It is a bit nasty, so I suggest to
>>  ignore SFP in this DTS altogether and let's wait till "phylink based
>>  SFP module support" or something alike hits upstream, so we can base
>>  the SFP support on solid code;
> 
> It would be great if you could work on getting the phylink patches
> into mainline. It is something i have wanted to do for a long time,
> but it is too low down on my priority list to get to. The code is high
> quality, so i don't think there will be too many issues. It probably
> just needs splitting up into smaller batches, submitting, and working
> on any comments.

That is exactly what I thought when I saw the patches for the first 
time. I will try to merge the patches to the current kernel and see 
what happens. I still need to learn a lot about PHY subsystem.

> 
> 
>>  Actually eth0 and eth1 (both are RGMII) are connected to the 88E6176
>>  switch. The problem is that from what I have read so far the switch
>>  can not operate in DSA mode with two CPU ports.
> 
> Again, this is something i wanted to do, and i did have a prototype at
> one point. But again, not enough time. If you have resources to work
> on this, i can find my code, explain my ideas, and let you complete
> it.

I am definitely interested, though I didn't have time to read and 
absorb DSA yet, but I definitely want to try to hack 88E6176 support. I 
would be really grateful if you can provide some pointers and/or code 
to start from.

Thanks,
Tomas
