From: "Jon Medhurst (Tixy)" <tixy@linaro.org>
Subject: Re: [PATCH v2 1/4] drm: arm: Add DT bindings documentation for
 HDLCD driver.
Date: Thu, 12 Nov 2015 10:52:25 +0000
Message-ID: <1447325545.2825.9.camel@linaro.org>
References: <1447258010-2234-1-git-send-email-Liviu.Dudau@arm.com>
	 <1447258010-2234-2-git-send-email-Liviu.Dudau@arm.com>
	 <20151111184849.GA9172@rob-hp-laptop>
	 <20151112104210.GZ963@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151112104210.GZ963@e106497-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Rob Herring <robh@kernel.org>, David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Punit Agrawal <punit.agrawal@arm.com>, DRI devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, LAKML <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2015-11-12 at 10:42 +0000, Liviu Dudau wrote:
> > This is on-chip RAM or nornal system RAM? We already have bindings
> for 
> > both.
>
> Juno has a set of TLX (ThinLinks) connectors on the board where an
> FPGA can be attached. On r1
> the code running on FPGA can even participate as an AXI master with
> full coherency. The FPGA
> has local memory that we want to share with the HDLCD to be used as a
> framebuffer.

The HDLCD on the Juno chip or one implemented in the FPGA? I assume you
mean the latter but just wanted to check.

-- 
Tixy
