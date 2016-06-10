From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v5 4/7] phy: da8xx-usb: new driver for DA8xx SoC USB PHY
Date: Fri, 10 Jun 2016 18:46:41 +0530
Message-ID: <575ABDB9.8000502@ti.com>
References: <1462837203-12125-1-git-send-email-david@lechnology.com>
 <1462837203-12125-5-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462837203-12125-5-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, khilman@kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kishon Vijay Abraham I <kishon@ti.com>, Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>, Lee Jones <lee.jones@linaro.org>
Cc: petr@barix.com, sergei.shtylyov@cogentembedded.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday 10 May 2016 05:10 AM, David Lechner wrote:
> This is a new phy driver for the SoC USB controllers on the TI DA8xx
> family of microcontrollers. The USB 1.1 PHY is just a simple on/off.
> The USB 2.0 PHY also allows overriding the VBUS and ID pins.
> 
> Signed-off-by: David Lechner <david@lechnology.com>

Reviewed-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar
