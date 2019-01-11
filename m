From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: ina3221: Add ti,single-shot
 property
Date: Fri, 11 Jan 2019 15:31:25 -0600
Message-ID: <20190111213125.GA17790@bogus>
References: <20190105004904.17947-1-nicoleotsuka@gmail.com>
 <20190105004904.17947-2-nicoleotsuka@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190105004904.17947-2-nicoleotsuka@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, mark.rutland@arm.com, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri,  4 Jan 2019 16:49:03 -0800, Nicolin Chen wrote:
> By default, ina3221, as a hardware monitor, continuously measures
> the inputs and generates corresponding data. However, for battery
> powered devices, this mode might be power consuming.
> 
> This patch adds a "ti,single-shot" property to allow changing the
> default continuous mode to single-shot operating mode.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  Documentation/devicetree/bindings/hwmon/ina3221.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
