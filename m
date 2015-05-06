From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/3] regulator: max8973: get rid of extra variable for
 gpio validity
Date: Wed, 6 May 2015 17:39:28 +0530
Message-ID: <554A0478.6070007@nvidia.com>
References: <1429534457-15515-1-git-send-email-ldewangan@nvidia.com> <1429534457-15515-2-git-send-email-ldewangan@nvidia.com> <20150420211939.GQ14892@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150420211939.GQ14892@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Tuesday 21 April 2015 02:49 AM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Mon, Apr 20, 2015 at 06:24:15PM +0530, Laxman Dewangan wrote:
>> To find that dvs-gpio is valid or not, gpio API gpio_is_valid()
>> can be directly used instead of intermediate variable.
> Applied, thanks.
>

This patch is not available on linux-next. Is it pending for any clean-up?
