From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/2] dt-bindings: hwmon: Add optional regulator
 support to pwm-fan
Date: Mon, 18 Feb 2019 13:47:14 -0600
Message-ID: <20190218194714.GA6350@bogus>
References: <1549557480-14436-1-git-send-email-stefan.wahren@i2se.com>
 <1549557480-14436-2-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1549557480-14436-2-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

On Thu,  7 Feb 2019 17:37:59 +0100, Stefan Wahren wrote:
> This adds an optional regulator support (e.g. switchable supply) to the
> pwm fan binding.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  Documentation/devicetree/bindings/hwmon/pwm-fan.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
