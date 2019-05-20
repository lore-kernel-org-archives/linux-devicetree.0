From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: dts: bcm: Add missing device_type = "memory"
 property
Date: Mon, 20 May 2019 09:30:29 -0700
Message-ID: <d28229cf-3fc5-9599-f886-9e2a0da28080@gmail.com>
References: <20190509171527.2331-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190509171527.2331-1-f.fainelli@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: robh@kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, "maintainer:BROADCOM BCM5301X ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 5/9/19 10:15 AM, Florian Fainelli wrote:
> During the removal of the skeleton.dtsi file with commit abe60a3a7afb
> ("ARM: dts: Kill off skeleton{64}.dtsi") a number of Broadcom SoCs were
> converted, but a few were left unoticed, now causing boot failures with
> v5.1 since the kernel cannot find suitable memory.
> 
> Updating the .dtsi files with the property will be done next, since
> there are some memory nodes that do not follow the proper naming
> convention and lack an unit name.
> 
> Fixes: abe60a3a7afb ("ARM: dts: Kill off skeleton{64}.dtsi")
> Reported-by: Kevin Hilman <khilman@kernel.org>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to devicetree/fixes, thanks!
-- 
Florian
