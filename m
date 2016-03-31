From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Thu, 31 Mar 2016 12:36:08 +0530
Message-ID: <56FCCC60.3080303@nvidia.com>
References: <20160229174751.GQ21240@tuxbot> <20160301022326.GC18327@sirena.org.uk> <56D5111E.6090606@nvidia.com> <20160302033833.GV18327@sirena.org.uk> <56D65F7E.3090907@nvidia.com> <20160302043506.GC18327@sirena.org.uk> <56E81103.8010903@nvidia.com> <CAJAp7OgUjN+Ymh+vM8g9Wex0JDRSOFkvpTKHm8fXYkDgTQ+0Tw@mail.gmail.com> <56ED0F58.7060005@nvidia.com> <56FBD4A3.7080208@nvidia.com> <20160330181623.GQ2350@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160330181623.GQ2350@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn@kryo.se>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gandhar Dighe <gdighe@nvidia.com>, Stuart Yates <syates@nvidia.com>
List-Id: devicetree@vger.kernel.org


On Wednesday 30 March 2016 11:46 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Wed, Mar 30, 2016 at 06:59:07PM +0530, Laxman Dewangan wrote:
>
>> Like to add property as "regulator-device-ramp-delay" which will be used for
>> PMIC configuration and regulator-ramp-delay will be used for delay
>> calculation. This is case when advertised ramp delay does not match with the
>> platform measured ramp delay.
> Why -device?
>
This is device specific and just to differentiate with 
regulator-ramp-delay which is the platform specific.
May be there is some other good name. I can think of other name as 
regulator-typical-ramp-delay, regulator-advertised-ramp-delay etc.
