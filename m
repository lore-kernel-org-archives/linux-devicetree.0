From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 2/2] sfp: add sff module support
Date: Thu, 14 Dec 2017 11:16:04 -0800
Message-ID: <65d19928-ae41-aa62-edba-36e9ab1c245e@gmail.com>
References: <20171214102712.GP10595@n2100.armlinux.org.uk>
 <E1ePQjz-0003q6-Tf@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <E1ePQjz-0003q6-Tf@rmk-PC.armlinux.org.uk>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 12/14/2017 02:27 AM, Russell King wrote:
> Add support for SFF modules, which are soldered down SFP modules.
> These have a different phys_id value, and also have the present and
> rate select signals omitted compared with their socketed counter-parts.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks!
-- 
Florian
