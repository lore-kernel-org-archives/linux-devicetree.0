From: Ian Campbell <ian.campbell@citrix.com>
Subject: Re: [PATCH] dtb: Create a common home for cross-architecture dtsi
 files.
Date: Wed, 22 Jul 2015 10:47:18 +0100
Message-ID: <1437558438.8383.72.camel@citrix.com>
References: <1437496204-5438-1-git-send-email-ian.campbell@citrix.com>
	 <20150722084753.GC14923@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <20150722084753.GC14923@e106497-lin.cambridge.arm.com>
Sender: linux-kbuild-owner@vger.kernel.org
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Sudeep Holla <Sudeep.Holla@arm.com>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Kristina Martsenko <Kristina.Martsenko@arm.com>, Kevin Hilman <khilman@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2015-07-22 at 09:47 +0100, Liviu Dudau wrote:
> 
> Acked-by: Liviu Dudau <Liviu.Dudau@arm.com>

Thanks.

> Picking your brains here: would it be worth to have some vendor directories in
> this shared area or we can hope that there will be very few files living here?

I'm honestly not sure.

I don't expect there will be very many files under here, and I would
expect the norm would be that common .dtsi files used by multiple
arches would be things from the same vendor, but I don't think we can
guarantee that.

Ian.
