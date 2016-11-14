Return-Path: <tmshlvck@gmail.com>
Sender: Tomas Hlavacek <tmshlvck@gmail.com>
Date: Mon, 14 Nov 2016 15:51:05 +0100
From: tomas.hlavacek@nic.cz
Subject: Re: [PATCH RFC] ARM: dts: add support for Turris Omnia
Message-Id: <1479135065.27133.1@smtp.gmail.com>
In-Reply-To: <20161114131010.GC26710@lunn.ch>
References: <20161105203841.9661-1-uwe@kleine-koenig.org>
	<1479126185.15557.5@smtp.gmail.com> <20161114131010.GC26710@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-8XfGv+rNhH9hdw/AGQqk"
To: Andrew Lunn <andrew@lunn.ch>
Cc: Uwe =?iso-8859-1?q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>, Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Martin Strba??ka <martin.strbacka@nic.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-ID: <devicetree@vger.kernel.org>

--=-8XfGv+rNhH9hdw/AGQqk
Content-Type: text/plain; charset=us-ascii; format=flowed

Hi Andrew!

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



--=-8XfGv+rNhH9hdw/AGQqk
Content-Type: text/html; charset=us-ascii

Hi Andrew!<br><br>On Mon, Nov 14, 2016 at 2:10 PM, Andrew Lunn &lt;andrew@lunn.ch&gt; wrote:<br>
<blockquote type="cite"><div class="plaintext" style="white-space: pre-wrap;"><blockquote> Actually SFP is connected to SGMII interface of eth1, which is
 routed through SERDES 5.
</blockquote>
You say eth1 here. Yet lower down you say got eth0 and eth1 are
connected to the switch?</div></blockquote><div><br></div><div>Oh sorry, this was a NIC name based on probing order derived from base address of NIC registers:</div><div><br></div><div><div><span style="white-space: pre-wrap;">	</span>eth1: ethernet@30000 - probes as eth0</div><div><div><span style="white-space: pre-wrap;">	</span>eth2: ethernet@34000 -&nbsp;probes as eth1</div><div><span class="Apple-tab-span" style="white-space:pre">	</span>eth0: ethernet@70000&nbsp;- probes as eth2</div></div></div><div><br></div><div>It is a bit confusing. I meant eth2 in DTS. Sorry.</div><br><blockquote type="cite"><div class="plaintext" style="white-space: pre-wrap;">

<blockquote> We have our proprietary support hacked onto mvneta driver for
 disconnecting PHY on the fly. It is a bit nasty, so I suggest to
 ignore SFP in this DTS altogether and let's wait till "phylink based
 SFP module support" or something alike hits upstream, so we can base
 the SFP support on solid code;
</blockquote>
It would be great if you could work on getting the phylink patches
into mainline. It is something i have wanted to do for a long time,
but it is too low down on my priority list to get to. The code is high
quality, so i don't think there will be too many issues. It probably
just needs splitting up into smaller batches, submitting, and working
on any comments.</div></blockquote><div><br></div><div>That is exactly what I thought when I saw the patches for the first time. I will try to merge the patches to the current kernel and see what happens. I still need to learn a lot about PHY subsystem.</div><br><blockquote type="cite"><div class="plaintext" style="white-space: pre-wrap;">

<blockquote> Actually eth0 and eth1 (both are RGMII) are connected to the 88E6176
 switch. The problem is that from what I have read so far the switch
 can not operate in DSA mode with two CPU ports.
</blockquote>
Again, this is something i wanted to do, and i did have a prototype at
one point. But again, not enough time. If you have resources to work
on this, i can find my code, explain my ideas, and let you complete
it.</div></blockquote><br><div>I am definitely interested, though I didn't have time to read and absorb DSA yet, but I definitely want to try to hack&nbsp;88E6176 support. I would be really grateful if you can provide some pointers and/or code to start from.</div><div><br></div><div>Thanks,</div><div>Tomas</div><div><br></div>
--=-8XfGv+rNhH9hdw/AGQqk--
