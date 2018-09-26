From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH ARM-next] ARM: dts: qcom-msm8974: change invalid flag IRQ
 NONE to valid value
Date: Wed, 26 Sep 2018 11:43:24 -0500
Message-ID: <20180926164324.GA20233@hector.attlocal.net>
References: <20180925104651.16596-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180925104651.16596-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, frank.rowand@sony.com
List-Id: devicetree@vger.kernel.org

On Tue, Sep 25, 2018 at 06:46:51AM -0400, Brian Masney wrote:
> The following commits used IRQ_TYPE_NONE since that matched what was
> already in the file and I do not have access to the datasheets for
> these devices. After these patches were submitted, commit dcf145011400
> ("ARM: dts: qcom-msm8974: change invalid flag IRQ NONE to valid value")
> changed all of these values to IRQ_TYPE_LEVEL_HIGH. This patch corrects
> the IRQ type for these two commits:
> 
> commit bd9392507588 ("ARM: dts: qcom: msm8974-hammerhead: add device
> tree bindings for ALS / proximity")
> 
> commit fe8d81fe7d9a ("ARM: dts: qcom: msm8974-hammerhead: add device
> tree bindings for mpu6515") 
> 
> Prior to these patches, I was having issues with the bmp280 sensor
> returning temperature / pressure skipped errors, however these errors
> have gone away with these patches.
> 
> Patches were tested on a LG Nexus 5 (hammerhead) phone.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---

Thanks for submitting this fix.  I added it and it will be part of the pull
request.

Thanks,

Andy
