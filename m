From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [STLinux Kernel] [PATCH 3/6] thermal: sti: Add support for ST's
 System Config Register based Thermal controller
Date: Thu, 5 Jun 2014 16:22:46 +0100
Message-ID: <20140605152246.GC7446@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1401442715-6350-1-git-send-email-lee.jones@linaro.org>
 <1401442715-6350-4-git-send-email-lee.jones@linaro.org>
 <20140605151650.GB7446@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140605151650.GB7446@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: linux-pm-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@stlinux.com, linux-pm@vger.kernel.org, eduardo.valentin@ti.com, rui.zhang@intel.com
List-Id: devicetree@vger.kernel.org

Hi Lee,


> Also a seperate somewhat unrelated question... stih415 and stih416 are very similar 
> dual die parts. Do you know why the stih415 has support for sas & mpe die temperature
> sensors, but the stih416 only has support for the sas die?

Ah I see...support for the stih416 mpe sensor is in a subsquent patch in the series.

regards,

Peter.

