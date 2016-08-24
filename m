From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [Patch v8] driver/clk/clk-si5338: Add common clock framework
 driver for si5338
Date: Tue, 23 Aug 2016 21:48:21 -0700
Message-ID: <20160824044821.GS6502@codeaurora.org>
References: <1471991933-29798-1-git-send-email-york.sun@nxp.com>
 <201608240859.Pj8tsDaR%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201608240859.Pj8tsDaR%fengguang.wu@intel.com>
Sender: linux-clk-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: York Sun <york.sun@nxp.com>, kbuild-all@01.org, linux-clk@vger.kernel.org, York Sun <yorksun@freescale.com>, Mike Turquette <mturquette@baylibre.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Andrey Filippov <andrey@elphel.com>, Paul Bolle <pebolle@tiscali.nl>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/24, kbuild test robot wrote:
> 
>   2827		if (drv_type < 0)
>   2828			return drv_type;
>   2829	
>   2830		drv_vdd =  get_drv_vdd(drvdata, i);
>   2831		if (drv_vdd < 0)
>   2832			return drv_vdd;
>   2833	
>   2834		drv_trim = get_drv_trim(drvdata, i);
>   2835		if (drv_trim < 0)
>   2836			return drv_trim;
>   2837	
>   2838		drv_invert = get_drv_invert(drvdata, i);
>   2839		if (drv_invert < 0)
>   2840			return drv_invert;
>   2841	
>   2842		for (j = 0; drv_configs[j].description; j++) {
> > 2843			if (drv_configs[j].fmt == drv_type &&
>   2844			    drv_configs[j].vdd == drv_vdd &&
>   2845			    drv_configs[j].trim == drv_trim &&
>   2846			    (drv_invert | (drv_configs[j].invert >> 2)) ==
>   2847				((drv_configs[j].invert & 3) |
>   2848				 (drv_configs[j].invert>>2)))

It might be better to write it as a set of continues instead so
that it isn't one complicated conditional

				config = &drv_configs[j];
				if (config->fmt != drv_type)
					continue;
				if (config->vdd != drv_vdd)
					continue;
				...
				seq_puts()
				match = 1;
				break;
				

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
