From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 2/3] regulator: max8973: make default/unset dvs gpio as
 invalid gpio
Date: Tue, 21 Apr 2015 18:45:24 +0530
Message-ID: <55364D6C.4090702@nvidia.com>
References: <1429534457-15515-1-git-send-email-ldewangan@nvidia.com> <1429534457-15515-3-git-send-email-ldewangan@nvidia.com> <20150420211514.GO14892@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150420211514.GO14892@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Tuesday 21 April 2015 02:45 AM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Mon, Apr 20, 2015 at 06:24:16PM +0530, Laxman Dewangan wrote:
>> If platform data has dvs-gpio value 0 as default/unset then
>> make this as invalid gpio so that function gpio_is_valid()
>> can return false on this case.
> OK, so this handles the problem with the first patch - it should have
> been the first patch to help with review.
>
Yaah, I realized after reading your comment on patch 1 that I should 
have on different sequence.

Thanks for accepting the patches.
