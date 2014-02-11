From: Christopher Covington <cov@codeaurora.org>
Subject: Re: [PATCH 1/3] driver core & of: Mark of_nodes of added device as
 populated
Date: Tue, 11 Feb 2014 12:32:36 -0500
Message-ID: <52FA5EB4.7080008@codeaurora.org>
References: <1392137610-27842-1-git-send-email-pawel.moll@arm.com> <1392137610-27842-2-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1392137610-27842-2-git-send-email-pawel.moll@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Moll <pawel.moll@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, lm-sensors@lm-sensors.org, arm@kernel.org, Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>, David Woodhouse <dwmw2@infradead.org>, Jean Delvare <jdelvare@suse.de>
List-Id: devicetree@vger.kernel.org

Hi Pawel,

On 02/11/2014 11:53 AM, Pawel Moll wrote:
> This patch tries to solve that issue in a generic way,
> adding a "populated" flag which is set in the device_node
> structure when a device is being created in the core.
> Later, of_platform_populate() skips such nodes (and
> its children) in a similar way to the non-available ones.

Will there never be a case where it is useful for a parent node to be created
early, but not necessarily the child nodes? Might only skipping nodes
explicitly marked as populated be a more universal solution?

Regards,
Christopher

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by the Linux Foundation.
