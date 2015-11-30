From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 1/4] ARM: dt: mvebu: ix4-300d: remove whole flash partition
Date: Mon, 30 Nov 2015 15:16:06 +0100
Message-ID: <87si3n609l.fsf@free-electrons.com>
References: <1448709248-21177-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<1448709248-21177-2-git-send-email-sebastian.hesselbarth@gmail.com>
	<20151128211129.GK32356@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151128211129.GK32356@lunn.ch> (Andrew Lunn's message of "Sat,
	28 Nov 2015 22:11:29 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Benoit Masson <yahoo@perenite.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sebastian and Andrew,
 
 On sam., nov. 28 2015, Andrew Lunn <andrew@lunn.ch> wrote:

>>On Sat, Nov 28, 2015 at 12:14:05PM +0100, Sebastian Hesselbarth wrote:
>> Current NAND node has an additional flash partition for the whole
>> flash overlapping with real partitions. Remove this partition as
>> the whole flash is already represented by the NAND device itself.
>> 
>> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
>
> Given Benoit comment
>
> Acked-by: Andrew Lunn <andrew@lunn.ch>


Applied on mvebu/dt

Thanks,

Gregory


>
> 	  Andrew

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
