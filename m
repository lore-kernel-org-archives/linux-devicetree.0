From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: Fix gpio to pinmux mapping
Date: Tue, 17 Sep 2019 10:22:41 -0700
Message-ID: <20190917172241.31726-1-f.fainelli@gmail.com>
References: <1568018127-26730-1-git-send-email-rayagonda.kokatanur@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568018127-26730-1-git-send-email-rayagonda.kokatanur@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bcm-kernel-feedback-list@broadcom.com, Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon,  9 Sep 2019 14:05:27 +0530, Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com> wrote:
> There are total of 151 non-secure gpio (0-150) and four
> pins of pinmux (91, 92, 93 and 94) are not mapped to any
> gpio pin, hence update same in DT.
> 
> Fixes: 8aa428cc1e2e ("arm64: dts: Add pinctrl DT nodes for Stingray SOC")
> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> ---

Applied to devicetree-arm64/fixes, thanks!
--
Florian
