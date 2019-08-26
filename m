From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] ARM: dts: da850-evm: Use generic jedec, spi-nor for flash
Date: Mon, 26 Aug 2019 19:03:21 +0530
Message-ID: <24eb9276-87e2-575a-2c4f-967b65e61b1c@ti.com>
References: <20190723121042.28634-1-aford173@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723121042.28634-1-aford173@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: adam.ford@logicpd.com, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 23/07/19 5:40 PM, Adam Ford wrote:
> Logic PD re-spun the L138 and AM1808 SOM's with larger flash.
> The m25p80 driver has a generic 'jedec,spi-nor' compatible option
> which is requests to use whenever possible since it will read the
> JEDEC READ ID opcode.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Applied to v5.4/dt

Thanks,
Sekhar
