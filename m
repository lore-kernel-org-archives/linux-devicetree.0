From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] dt: add helper function to read u8 & u16 variables &
 arrays
Date: Tue, 20 Nov 2012 10:21:40 -0700
Message-ID: <50ABBC24.5000707@wwwdotorg.org>
References: <0ee5b74534a09d75c14b22c2d9330c4971ab30fb.1353386646.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0ee5b74534a09d75c14b22c2d9330c4971ab30fb.1353386646.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rob.herring@calxeda.com, grant.likely@secretlab.ca, spear-devel@list.st.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, andriy.shevchenko@intel.com, linaro-dev@lists.linaro.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On 11/19/2012 09:45 PM, Viresh Kumar wrote:
> This adds following helper routines:
> - of_property_read_u8_array()
> - of_property_read_u16_array()
> - of_property_read_u8()
> - of_property_read_u16()
> 
> This expects arrays from DT to be passed as:
> - u8 array:
> 	property = /bits/ 8 <0x50 0x60 0x70>;
> - u16 array:
> 	property = /bits/ 16 <0x5000 0x6000 0x7000>;

Reviewed-by: Stephen Warren <swarren@nvidia.com>
