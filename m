From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v10 5/6] arm64: zynqmp: Add DDRC node
Date: Mon, 5 Nov 2018 14:20:07 +0100
Message-ID: <20181105132007.GB7937@zn.tnic>
References: <1540447621-22870-1-git-send-email-manish.narani@xilinx.com>
 <1540447621-22870-6-git-send-email-manish.narani@xilinx.com>
 <20181105125644.GA7937@zn.tnic>
 <41c5ca53-ed4b-38d0-c612-e1229004293e@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <41c5ca53-ed4b-38d0-c612-e1229004293e@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Manish Narani <manish.narani@xilinx.com>, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, amit.kucheria@linaro.org, sudeep.holla@arm.com, leoyang.li@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 05, 2018 at 02:06:11PM +0100, Michal Simek wrote:
> I don't think that driver will be broken. You can build them, use them
> on out of tree HW. And when this patch is merged to mainline it will be
> enabled for xilinx soc.

But if the DT entries are missing, the driver won't load, would it?

> TBH I can't see any reason to do merges but if you want to do that way
> we can also do it.

The reason is because there's a separate DT tree and all those arm
drivers need DT.

I have already acked EDAC patches to go through other trees too, FWIW.
Which is not optimal either if someone sends fixes ontop but I cannot
apply them yet because the dependent patches are in a different tree.

So yes, there are at least two good reasons for merging a shared branch.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
