From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: armada-385-linksys: disk-activity trigger for all
Date: Wed, 05 Apr 2017 17:27:02 +0200
Message-ID: <87pogq6fjt.fsf@free-electrons.com>
References: <20170330165405.14540-1-ralph.sennhauser@gmail.com>
        <20170331153549.GA12814@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170331153549.GA12814@lunn.ch> (Andrew Lunn's message of "Fri,
        31 Mar 2017 17:35:49 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Ralph,
 
 On ven., mars 31 2017, Andrew Lunn <andrew@lunn.ch> wrote:

> On Thu, Mar 30, 2017 at 06:54:04PM +0200, Ralph Sennhauser wrote:
>> Commit a4ee7e18d808 ("ARM: dts: armada: Add default trigger for sata
>> led") adds the default trigger to individual boards, move it to
>> armada-385-linksys.dtsi which effectively enables the definition for
>> the WRT1900ACS (Shelby) as well as for future boards.
>> 
>> Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
>
> Centralising this makes sense.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Applied on mvebu/dt

Thanks,

Gregory


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
