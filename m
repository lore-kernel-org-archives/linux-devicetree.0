From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v2 1/2] of: Ensure unique names without sacrificing
 determinism
Date: Sat, 24 May 2014 15:10:15 -0300
Message-ID: <20140524181014.GA4011@arch.cereza>
References: <1400801769-4506-1-git-send-email-grant.likely@linaro.org>
 <1400801769-4506-2-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1400801769-4506-2-git-send-email-grant.likely@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On 23 May 08:36 AM, Grant Likely wrote:
> The way the driver core is implemented, every device using the same bus
> type is required to have a unique name because a symlink to each device
> is created in the appropriate /sys/bus/*/devices directory, and two
> identical names causes a collision.
> 
> The current code handles the requirement by using an globally
> incremented counter that is appended to the device name. It works, but
> it means any change to device registration will change the assigned
> numbers. Instead, if we build up the name by using information from the
> parent nodes, then it can be guaranteed to be unique without adding a
> random number to the end of it.
> 
> Signed-off-by: Grant Likely <grant.likely@linaro.org>

Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
