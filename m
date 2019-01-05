From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH 2/2] hwmon: (ina3221) Implement ti,single-shot DT property
Date: Fri, 4 Jan 2019 18:48:24 -0800
Message-ID: <20190105024823.GA20936@Asurada-Nvidia.nvidia.com>
References: <20190105004904.17947-1-nicoleotsuka@gmail.com>
 <20190105004904.17947-3-nicoleotsuka@gmail.com>
 <c5d8771d-3274-6982-2f9f-903fd5310488@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c5d8771d-3274-6982-2f9f-903fd5310488@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 04, 2019 at 06:37:55PM -0800, Guenter Roeck wrote:
> > +enum ina3221_modes {
> > +	INA3221_MODE_SINGLE_SHOT,
> > +	INA3221_MODE_CONTINUOUS,
> > +	INA3221_NUM_MODES,
> 
> Is NUM_MODES used anywhere ? Please drop unless there is a reason to keep it.

Will clean it up in v2.

Thanks
Nicolin
