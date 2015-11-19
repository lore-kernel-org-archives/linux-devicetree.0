From: Bastien Nocera <hadess@hadess.net>
Subject: Re: [PATCH v11 2/8] Input: goodix - reset device at init
Date: Thu, 19 Nov 2015 16:25:03 +0100
Message-ID: <1447946703.24088.73.camel@hadess.net>
References: <1447936001-21420-1-git-send-email-irina.tirdea@intel.com>
	 <1447936001-21420-3-git-send-email-irina.tirdea@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1447936001-21420-3-git-send-email-irina.tirdea@intel.com>
Sender: linux-input-owner@vger.kernel.org
To: Irina Tirdea <irina.tirdea@intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Aleksei Mamlin <mamlinav@gmail.com>, Karsten Merker <merker@debian.org>, linux-input@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Octavian Purdila <octavian.purdila@intel.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2015-11-19 at 14:26 +0200, Irina Tirdea wrote:
> After power on, it is recommended that the driver resets the device.
> The reset procedure timing is described in the datasheet and is used
> at device init (before writing device configuration) and
> for power management. It is a sequence of setting the interrupt
> and reset pins high/low at specific timing intervals. This procedure
> also includes setting the slave address to the one specified in the
> ACPI/device tree.

This fails on a 4.3 kernel with an ACPI device (WinBook TW100):
Goodix-TS: probe of i2c-GDIX1001:00 failed with error -16

Can you please document which upstream commit is necessary to make this
behave properly?

I'll test again with a newer kernel.

Cheers
