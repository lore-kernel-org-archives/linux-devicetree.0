From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v4 5/6] arm64: dt: set initial SR watchdog timeout to 60
 seconds
Date: Mon, 9 Jul 2018 10:40:49 -0700
Message-ID: <12894566-960c-6d62-539b-2e4f09cce366@gmail.com>
References: <1527530497-10392-1-git-send-email-ray.jui@broadcom.com>
 <1527530497-10392-6-git-send-email-ray.jui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1527530497-10392-6-git-send-email-ray.jui@broadcom.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ray Jui <ray.jui@broadcom.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Robin Murphy <robin.murphy@arm.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org



On 05/28/2018 11:01 AM, Ray Jui wrote:
> Set initial Stingray watchdog timeout to 60 seconds
> 
> By the time when the userspace watchdog daemon is ready and taking
> control over, the watchdog timeout will then be reset to what's
> configured in the daemon
> 
> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
> Reviewed-by: Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>
> Reviewed-by: Scott Branden <scott.branden@broadcom.com>

Applied to devicetree-arm64/next, thanks!
-- 
Florian
