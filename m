From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 2/2] hwmon: (ina3221) Implement ti,single-shot DT
 property
Date: Thu, 17 Jan 2019 14:58:42 -0800
Message-ID: <20190117225842.GA23511@roeck-us.net>
References: <20190105030636.533-1-nicoleotsuka@gmail.com>
 <20190105030636.533-3-nicoleotsuka@gmail.com>
 <20190107193555.GA13547@roeck-us.net>
 <20190117223012.GH16918@Asurada-Nvidia.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190117223012.GH16918@Asurada-Nvidia.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 17, 2019 at 02:30:13PM -0800, Nicolin Chen wrote:
> On Mon, Jan 07, 2019 at 11:35:55AM -0800, Guenter Roeck wrote:
> 
> > > +	if (of_property_read_bool(np, "ti,single-shot"))
> > > +		ina->single_shot = true;
> > > +
> > 	ina->single_shot = of_property_read_bool(np, "ti,single-shot");
> > 
> > No need to resend right now; let's wait for feedback from Rob.
> 
> Looks like Rob has acked. Is this resend version fine for review?
> 
"Right now" was supposed to mean that you should wait for Rob's
feedback before sending v3 with the feedback above applied.
Did you send that version ? I don't see it in patchwork, nor
in my inbox.

Thanks,
Guenter
