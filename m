From: Jisheng Zhang <jszhang@marvell.com>
Subject: Re: [PATCH] arm64: dts: berlin4ct: switch to Cortex-A53 specific
 pmu nodes
Date: Tue, 15 Dec 2015 22:47:09 +0800
Message-ID: <20151215224709.2d71d2ba@xhacker>
References: <1450190172-1161-1-git-send-email-jszhang@marvell.com>
	<8261316.NuheDtlQ6N@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8261316.NuheDtlQ6N@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, sebastian.hesselbarth@gmail.com, mark.rutland@arm.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Dear Arnd,

On Tue, 15 Dec 2015 15:43:53 +0100 Arnd Bergmann wrote:

> On Tuesday 15 December 2015 22:36:12 Jisheng Zhang wrote:
> > -               compatible = "arm,armv8-pmuv3";
> > +               compatible = "arm,cortex-a53-pmu";
> >   
> 
> Should this list both?

IMHO, we don't need to list both. The pmu binding document also says:
"compatible : should be one of ...."

Dear Mark,

Could you please give suggestions?

Thanks,
Jisheng
