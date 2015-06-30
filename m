From: Bastien Nocera <hadess@hadess.net>
Subject: Re: [PATCH v3 3/5] Input: goodix - add power management support
Date: Tue, 30 Jun 2015 17:56:12 +0200
Message-ID: <1435679772.2612.12.camel@hadess.net>
References: <1435595304-4840-1-git-send-email-irina.tirdea@intel.com>
	 <1435595304-4840-4-git-send-email-irina.tirdea@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1435595304-4840-4-git-send-email-irina.tirdea@intel.com>
Sender: linux-input-owner@vger.kernel.org
To: Irina Tirdea <irina.tirdea@intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Octavian Purdila <octavian.purdila@intel.com>
List-Id: devicetree@vger.kernel.org

On Mon, 2015-06-29 at 19:28 +0300, Irina Tirdea wrote:
> Implement suspend/resume for goodix driver.
> 
> The suspend and resume process uses the gpio pins.
> If the device ACPI/DT information does not declare gpio pins,
> suspend/resume will not be available for these devices.
> 
> This is based on Goodix datasheets for GT911 and GT9271
> and on Goodix driver gt9xx.c for Android (publicly available
> in Android kernel trees for various devices).

How can I functionally test this?
