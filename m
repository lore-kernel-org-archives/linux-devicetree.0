From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Input: twl6040-vibra: Update for device tree support
Date: Wed, 16 May 2012 12:35:46 -0700
Message-ID: <20120516193546.GA15920@core.coreip.homeip.net>
References: <1337167186-8535-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1337167186-8535-1-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>, Benoit Cousson <b-cousson@ti.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi Peter,

On Wed, May 16, 2012 at 02:19:46PM +0300, Peter Ujfalusi wrote:
> The twl6040 DT support implementation has been changed from the originally
> planned.
> None of the child devices going to have compatible_of property which means
> that the child devices of twl6040 will be created as traditional MFD devices.
> The mfd core driver will decide (based on the DT blob) to create a device
> for the twl6040-vibra or not. If the DT blob has 'vibra' section the device
> will be created without pdata.
> In this case the vibra driver will reach up to the parent node to get the
> needed properties.

So in this case why don't you have parent parse all DT data and
construct instance of pdata for vibra driver to consume?

Thanks.

-- 
Dmitry
