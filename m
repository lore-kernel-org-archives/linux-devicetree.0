From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V4 REPOST] mfd: add MAX8907 core driver
Date: Wed, 12 Sep 2012 10:29:04 -0600
Message-ID: <5050B850.807@wwwdotorg.org>
References: <1346973015-7252-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1346973015-7252-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Gyungoh Yoo <jack.yoo@maxim-ic.com>, devicetree-discuss@lists.ozlabs.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Stephen Warren <swarren@nvidia.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/06/2012 05:10 PM, Stephen Warren wrote:
> From: Gyungoh Yoo <jack.yoo@maxim-ic.com>
> 
> The MAX8907 is an I2C-based power-management IC containing voltage
> regulators, a reset controller, a real-time clock, and a touch-screen
> controller.

Samuel,

This patch as-is won't compile due to the mfd_add_devices() API change.
Do you want to fix this up when you apply (simply add an extra parameter
"NULL" to the mfd_add_devices() call), or should I send an updated V5
for this?

Thanks.
