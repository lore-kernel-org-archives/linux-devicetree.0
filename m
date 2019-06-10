From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC PATCH 12/57] of: platform: Use bus_find_device_by_of_node helper
Date: Mon, 10 Jun 2019 14:44:24 -0600
Message-ID: <CAL_JsqLRwC6ZnSgrp_N8X-vefUEUCaAakG7Dvu034WMWzaYYZg@mail.gmail.com>
References: <1559577023-558-1-git-send-email-suzuki.poulose@arm.com> <1559577023-558-13-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559577023-558-13-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 3, 2019 at 9:51 AM Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> Switch to using the bus_find_device_by_of_node helper
>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  drivers/of/platform.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
