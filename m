From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] arm64: dts: stingray: Add otp device node
Date: Mon, 4 Jun 2018 14:24:51 -0700
Message-ID: <c9219029-6e45-1889-6326-470d2bc9e46c@gmail.com>
References: <1527106630-4760-1-git-send-email-scott.branden@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1527106630-4760-1-git-send-email-scott.branden@broadcom.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Scott Branden <scott.branden@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/23/2018 01:17 PM, Scott Branden wrote:
> Add otp device node for Stingray SOC.
> 
> Fixes: 2fa9e9e29ea2 ("arm64: dts: Add GPIO DT nodes for Stingray SOC")
> Signed-off-by: Scott Branden <scott.branden@broadcom.com>

Applied to devicetree-arm64/next with s/otp/OTP/ and removing the Fixes
line since that is not a bug fix AFAICT.

Thank you
-- 
Florian
