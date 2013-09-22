From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5] clk: si570: Add a driver for SI570 oscillators
Date: Sat, 21 Sep 2013 19:31:04 -0700
Message-ID: <523E5668.2000201@roeck-us.net>
References: <1379806839-13762-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1379806839-13762-1-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-doc-owner@vger.kernel.org
To: Soren Brinkmann <soren.brinkmann@xilinx.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Mike Turquette <mturquette@linaro.org>, Grant Likely <grant.likely@linaro.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Joe Perches <joe@perches.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Hyun Kwon <hyunk@xilinx.com>
List-Id: devicetree@vger.kernel.org

On 09/21/2013 04:40 PM, Soren Brinkmann wrote:
> Add a driver for SILabs 570, 571, 598, 599 programmable oscillators.
> The devices generate low-jitter clock signals and are reprogrammable via
> an I2C interface.
>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>

Looks good to me. Thanks a lot for picking this up.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

