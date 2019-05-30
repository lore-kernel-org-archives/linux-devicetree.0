From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] edac: add support for Amazon's Annapurna Labs EDAC
Date: Thu, 30 May 2019 04:57:32 -0700
Message-ID: <20190530115732.GB14088@kroah.com>
References: <1559211329-13098-1-git-send-email-hhhawa@amazon.com>
 <1559211329-13098-3-git-send-email-hhhawa@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559211329-13098-3-git-send-email-hhhawa@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hanna Hawa <hhhawa@amazon.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, davem@davemloft.net, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, linux-edac@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, May 30, 2019 at 01:15:29PM +0300, Hanna Hawa wrote:
> +static void al_a57_edac_cpumerrsr(void *arg)
> +{
> +	struct edac_device_ctl_info *edac_dev =
> +		(struct edac_device_ctl_info *)arg;

No need for casting anything here, just assign it.  Doesn't checkpatch
catch this type of thing these days?  You did run it, right?

Please fix that up everywhere you do this in the driver.


thanks,

greg k-h
