From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] mfd: add MAX8907 core driver
Date: Thu, 02 Aug 2012 11:11:21 -0600
Message-ID: <501AB4B9.5030805@wwwdotorg.org>
References: <1343854085-29663-1-git-send-email-swarren@wwwdotorg.org> <20120802161544.GE4537@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120802161544.GE4537@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>, Laxman Dewangan <ldewangan@nvidia.com>, Gyungoh Yoo <jack.yoo@maxim-ic.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 08/02/2012 10:15 AM, Mark Brown wrote:
> On Wed, Aug 01, 2012 at 02:48:05PM -0600, Stephen Warren wrote:
>> From: Gyungoh Yoo <jack.yoo@maxim-ic.com>
>>
>> The MAX8907 is an I2C-based power-management IC containing voltage
>> regulators, a reset controller, a real-time clock, and a touch-screen
>> controller.
> 
> Reviewed-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

Thanks very much.

Samuel, please don't apply this just yet though - it looks like I need
to make some minor changes to the header file and DT binding
documentation to add in a definition for one more regulator. I'll repost
the amended version along with the regulator driver later.
