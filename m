From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: Add optional label property for ina2xx
Date: Tue, 27 Aug 2019 12:06:39 -0500
Message-ID: <20190827170639.GA18927@bogus>
References: <cover.1566310292.git.michal.simek@xilinx.com>
 <3c56deb8cc1842d2915b203e622be1eb442414de.1566310292.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3c56deb8cc1842d2915b203e622be1eb442414de.1566310292.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, 20 Aug 2019 16:11:40 +0200, Michal Simek wrote:
> Using optional "label" property is adding an option to user to use better
> name for device identification.
> 
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
> 
>  Documentation/devicetree/bindings/hwmon/ina2xx.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
