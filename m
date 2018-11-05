From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v10 5/6] arm64: zynqmp: Add DDRC node
Date: Mon, 5 Nov 2018 21:43:22 +0100
Message-ID: <20181105204322.GE26868@zn.tnic>
References: <1540447621-22870-1-git-send-email-manish.narani@xilinx.com>
 <1540447621-22870-6-git-send-email-manish.narani@xilinx.com>
 <20181105125644.GA7937@zn.tnic>
 <41c5ca53-ed4b-38d0-c612-e1229004293e@xilinx.com>
 <20181105132007.GB7937@zn.tnic>
 <a81f47e0-1778-a6ac-4cd8-634502661d6f@xilinx.com>
 <20181105134218.GD7937@zn.tnic>
 <CAOesGMj=EbWgcYF2Mhh6TFMCdn1ub1Ze6fbXJnFFdsttWByXYg@mail.gmail.com>
 <20181105194721.GB26868@zn.tnic>
 <CAOesGMjsPWeRZEeBH37uLQFBKwAWNMh5yCvuKNYrOUDfRSSYog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMjsPWeRZEeBH37uLQFBKwAWNMh5yCvuKNYrOUDfRSSYog@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Michal Simek <michal.simek@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, manish.narani@xilinx.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Li Yang <leoyang.li@nxp.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 05, 2018 at 12:38:05PM -0800, Olof Johansson wrote:
> Yeah, that's the way we've been trying to do for various subsystems
> and it's been working pretty well. Of course, if there's need to
> coordinate more closely for something in the future we'll be happy to
> do so.

Goodie. Let's do that for now and we can always revisit when there's
real need.

Thx!

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
