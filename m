From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 0/2] hwmon (ina3221) Add single-shot mode support
Date: Thu, 17 Jan 2019 15:36:51 -0800
Message-ID: <20190117233651.GA24862@roeck-us.net>
References: <20190117231253.8828-1-nicoleotsuka@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190117231253.8828-1-nicoleotsuka@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 17, 2019 at 03:12:51PM -0800, Nicolin Chen wrote:
> By default, ina3221, as a hardware monitor, continuously measures
> the inputs and generates corresponding data. However, for battery
> powered devices, this mode might be power consuming.
> 
> This series of patches add a feature of changing default operating
> mode to its single-shot mode via DT.
> 
> Changelog
> v2->v3:
>  * Added "Reviewed-by" from Rob to PATCH-1
>  * Cleaned-up PATCH-2
> v1->v2:
>  * Cleaned-up PATCH-2
> 
> Nicolin Chen (2):
>   dt-bindings: hwmon: ina3221: Add ti,single-shot property
>   hwmon: (ina3221) Implement ti,single-shot DT property
> 
>  .../devicetree/bindings/hwmon/ina3221.txt     | 10 ++++++++++
>  drivers/hwmon/ina3221.c                       | 19 +++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
Series applied to hwmon-next.

Thanks,
Guenter
