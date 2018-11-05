From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v10 5/6] arm64: zynqmp: Add DDRC node
Date: Mon, 5 Nov 2018 06:51:26 -0800
Message-ID: <CAOesGMj=EbWgcYF2Mhh6TFMCdn1ub1Ze6fbXJnFFdsttWByXYg@mail.gmail.com>
References: <1540447621-22870-1-git-send-email-manish.narani@xilinx.com>
 <1540447621-22870-6-git-send-email-manish.narani@xilinx.com>
 <20181105125644.GA7937@zn.tnic> <41c5ca53-ed4b-38d0-c612-e1229004293e@xilinx.com>
 <20181105132007.GB7937@zn.tnic> <a81f47e0-1778-a6ac-4cd8-634502661d6f@xilinx.com>
 <20181105134218.GD7937@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181105134218.GD7937@zn.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: Michal Simek <michal.simek@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, manish.narani@xilinx.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Li Yang <leoyang.li@nxp.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 5, 2018 at 5:42 AM Borislav Petkov <bp@alien8.de> wrote:
>
> On Mon, Nov 05, 2018 at 02:32:55PM +0100, Michal Simek wrote:
> > you don't have that HW anyway.
>
> Grrr, I'm not talking about me - I'm talking about people testing
> linux-next. And perhaps in this particular case it won't matter because
> this hw is not shipping yet or whatever but the question is about the
> principle of the whole thing.
>
> > I looked at v10 and I can't see your ack there. Can you please give me
> > a link?
>
> I'm talking about *other* patches for another driver.
>
> Please note that I'm replying to this thread as an example - the
> procedural question I have is not only related to the synopsys changes
> but the synopsys changes are a good example for the problem of EDAC
> changes being sent to me along with DT additions.
>
> As such, the question was aimed more at arm-soc people - that's why they
> were in To: - not at you.

Hi Boris,

In general, for new functionality where needing both the driver change
and a DT change to enable it (or a driver change and a config change
to enable it), we have been merging the changes separately between
driver trees and arm-soc. I.e. things will be in place, but not
enabled, until both sides land. Main reason for doing so is to cut
down on arbitrary dependencies between the trees, since there can
sometimes end up being a lot of them.

Since DT should strive for being backwards compatible (i.e, a driver
change shouldn't require a DT change for the kernel to not regress
functionally), this has been working pretty well.

However, if there's some other reason to share a base between the two
trees, we can do that. For most cases we've found that it's not needed
though. So let us know what you prefer here.


-Olof
