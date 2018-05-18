From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 2/4] rtc: ds1307: support m41t11 variant
Date: Fri, 18 May 2018 11:35:10 -0500
Message-ID: <20180518163510.GA12620@rob-hp-laptop>
References: <20180516210842.5874-1-giulio.benetti@micronovasrl.com>
 <20180516210842.5874-2-giulio.benetti@micronovasrl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180516210842.5874-2-giulio.benetti@micronovasrl.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Giulio Benetti <giulio.benetti@micronovasrl.com>
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, May 16, 2018 at 11:08:40PM +0200, Giulio Benetti wrote:
> The m41t11 variant is very similar to the already supported m41t00 and
> m41t0, but it has also 56 bytes of NVRAM.
> 
> Add it to driver taking into account NVRAM section.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  .../devicetree/bindings/rtc/rtc-ds1307.txt         |  1 +
>  drivers/rtc/rtc-ds1307.c                           | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
