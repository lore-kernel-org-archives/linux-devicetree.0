From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/5] driver core: move to_platform_driver to platform_device.h
Date: Mon, 22 Apr 2013 09:03:07 +0200
Message-ID: <201304220903.07824.arnd@arndb.de>
References: <1366596798-9457-1-git-send-email-robherring2@gmail.com> <1366596798-9457-3-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1366596798-9457-3-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

On Monday 22 April 2013, Rob Herring wrote:
> From: Rob Herring <rob.herring@calxeda.com>
> 
> In converting the last remaining of_platform_driver (ibmebus) to a regular
> platform driver, to_platform_driver is needed to replace
> to_of_platform_driver.
> 
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Grant Likely <grant.likely@linaro.org>

It sounds like this patch is needed first, so you should swap the first
two patches in the series.

	Arnd
