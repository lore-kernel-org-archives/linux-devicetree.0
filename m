From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: (ina3221) Implement ti,single-shot DT
 property
Date: Thu, 17 Jan 2019 14:30:13 -0800
Message-ID: <20190117223012.GH16918@Asurada-Nvidia.nvidia.com>
References: <20190105030636.533-1-nicoleotsuka@gmail.com>
 <20190105030636.533-3-nicoleotsuka@gmail.com>
 <20190107193555.GA13547@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190107193555.GA13547@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 07, 2019 at 11:35:55AM -0800, Guenter Roeck wrote:

> > +	if (of_property_read_bool(np, "ti,single-shot"))
> > +		ina->single_shot = true;
> > +
> 	ina->single_shot = of_property_read_bool(np, "ti,single-shot");
> 
> No need to resend right now; let's wait for feedback from Rob.

Looks like Rob has acked. Is this resend version fine for review?

Thank you
Nicolin
