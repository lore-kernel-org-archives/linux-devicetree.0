Return-Path: <SRS0=z9fA=TD=broadcom.com=florian.fainelli@kernel.org>
Subject: Re: [PATCH 3/3] MIPS: BMIPS: add clock controller nodes
References: <20190502122657.15577-1-jonas.gorski@gmail.com>
 <20190502122657.15577-4-jonas.gorski@gmail.com>
From: Florian Fainelli <florian.fainelli@broadcom.com>
Message-ID: <3fb6cf9b-1c07-e897-c9dd-71cd94db9a17@broadcom.com>
Date: Thu, 2 May 2019 18:47:26 -0700
MIME-Version: 1.0
In-Reply-To: <20190502122657.15577-4-jonas.gorski@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Jonas Gorski <jonas.gorski@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Kevin Cernekee <cernekee@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>
List-ID: <devicetree@vger.kernel.org>



On 5/2/2019 5:26 AM, Jonas Gorski wrote:
> Now that we have a driver for the clock controller, add nodes to allow
> devices to make use of it.
> 
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
