From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2] ARM: dts: da850: Fix interrups property for gpio
Date: Wed, 27 Jun 2018 17:41:26 +0530
Message-ID: <8572a60f-982c-9981-ff73-15d1532d5965@ti.com>
References: <1528193271-10726-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528193271-10726-1-git-send-email-j-keerthy@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: khilman@kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday 05 June 2018 03:37 PM, Keerthy wrote:
> The intc #interrupt-cells is equal to 1. Currently gpio
> node has 2 cells per IRQ which is wrong. Remove the additional
> cell for each of the interrupts.
> 
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> Fixes: 2e38b946dc54 ("ARM: davinci: da850: add GPIO DT node")

Applied to fixes for v4.18

Thanks,
Sekhar
