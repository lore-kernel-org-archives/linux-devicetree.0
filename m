From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 2/5] dmaengine: Add STM32 DMAMUX driver
Date: Mon, 1 May 2017 11:33:53 +0530
Message-ID: <20170501060353.GO6263@localhost>
References: <1489414561-28912-1-git-send-email-cedric.madianga@gmail.com>
 <1489414561-28912-3-git-send-email-cedric.madianga@gmail.com>
 <20170406064046.GF4094@localhost>
 <d18cb12d-1fd1-39d2-501a-18c000b9982e@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d18cb12d-1fd1-39d2-501a-18c000b9982e@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Cc: M'boumba Cedric Madianga <cedric.madianga@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 26, 2017 at 09:17:37AM +0000, Pierre Yves MORDRET wrote:
> >> +
> >> +	ret = of_property_read_u32(node, "dma-channels",
> >> +				   &dmamux->dmamux_channels);
> >
> > can we have property_xxx calls alone, that way driver is not strictly
> > dependent on of
> 
> Can you please explain what you are asking for ? Not sure to understand 
> correctly.

Use device_property_read_u32() which is a generic property API.


> >> +static int __init stm32_dmamux_init(void)
> >> +{
> >> +	return platform_driver_register(&stm32_dmamux_driver);
> >> +}
> >> +arch_initcall(stm32_dmamux_init);
> >
> > why not module init, wouldnt defer probe solve the dependencies
> >
> 
> The reason behind many devices (device_initcall level) rely on DMAs. If 
> init is deferred DMAMUX driver will be probed twice if dependents rely 
> on it. This sounds not a good call. This explains arch_initcall level.

Why not deferred probe was introduced to help with dependencies...

-- 
~Vinod
