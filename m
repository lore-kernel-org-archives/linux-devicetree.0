From: David Collins <collinsd@codeaurora.org>
Subject: Re: [PATCH v4 0/2] regulator: add QCOM RPMh regulator driver
Date: Wed, 30 May 2018 17:11:54 -0700
Message-ID: <da40510b-443d-d8fd-7285-c6e7eff45dc6@codeaurora.org>
References: <cover.1527040878.git.collinsd@codeaurora.org>
 <20180530163343.GV6920@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180530163343.GV6920@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, rnayak@codeaurora.org, sboyd@kernel.org, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

Hello Mark,

On 05/30/2018 09:33 AM, Mark Brown wrote:
> On Tue, May 22, 2018 at 07:43:16PM -0700, David Collins wrote:
>> This patch series adds a driver and device tree binding documentation for
>> PMIC regulator control via Resource Power Manager-hardened (RPMh) on some
>> Qualcomm Technologies, Inc. SoCs such as SDM845.  RPMh is a hardware block
> 
> So, this is a very big driver and obviously it being RPM based it
> doesn't look like other regulators which is causing problems, especially
> when coupled with the desire to implement a bunch of more exotic
> features like the mode setting.  I think this review is going to go a
> lot more smoothly if you split this up into a base driver with just
> normal, standard stuff that doesn't add too many custom properties or
> unusual ways of working and then a series of patches on top of that
> adding things like the mode adjustment and interaction with other RPM
> clients.
> 
> We've got other RPM based regulators in tree already so the baseline bit
> shouldn't be too hard, that'll make the rest of the patches much smaller
> and easier to review and mean that the bits that are simpler and easier
> to cope with don't need to be reposted.

I'll split up the patches so that reviewing is easier.  For the base
patch, would you prefer that I remove *all* mode support (handled by
generic regulator framework DT properties) or only remove the special
purpose drms mode handling support (i.e. qcom,regulator-drms-modes and
qcom,drms-mode-max-microamps)?

Thanks,
David

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
