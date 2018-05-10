From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v6 06/11] firmware: xilinx: Add debugfs interface
Date: Thu, 10 May 2018 15:26:26 +0100
Message-ID: <b880a598-54cb-6428-e60d-232615e809c1@arm.com>
References: <1523389127-14243-1-git-send-email-jollys@xilinx.com>
 <1523389127-14243-7-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523389127-14243-7-git-send-email-jollys@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jolly Shah <jolly.shah@xilinx.com>, ard.biesheuvel@linaro.org, mingo@kernel.org, gregkh@linuxfoundation.org, matt@codeblueprint.co.uk, hkallweit1@gmail.com, keescook@chromium.org, dmitry.torokhov@gmail.com, mturquette@baylibre.com, sboyd@codeaurora.org, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, rajanv@xilinx.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org



On 10/04/18 20:38, Jolly Shah wrote:
> From: Rajan Vaja <rajanv@xilinx.com>
> 
> Firmware-debug provides debugfs interface to all APIs.
> Debugfs can be used to call firmware APIs with required
> parameters.
> 
> Usage:
> * Calling firmware API through debugfs:
>   # echo "<api-name> <arg1> .. <argn>" > /sys/.../zynqmp-firmware/pm
> 
> * Read output of last called firmware API:
>   # cat /sys/.../zynqmp-firmware/pm
> 
> Refer ug1200 for more information on these APIs:
>   * https://www.xilinx.com/support/documentation/user_guides/ug1200-eemi-api.pdf
> 
> Add basic debugfs file to get API version.
Who are the users of this apart from debugging ? I am bit over sensitive
as this remote processor manages/controls the power and other shared
resources in the system. Giving such fine grained access to user space
is not a good idea. I assume you want this DEBUGFS off by default on
production images ?

-- 
Regards,
Sudeep
