From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/3] ARM: at91: use chipid device for soc detection
Date: Tue, 29 Mar 2016 15:55:55 +0200
Message-ID: <55618572.U3p4crGV1Y@wuerfel>
References: <1458285681-25684-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458285681-25684-1-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>
Cc: nicolas.ferre@atmel.com, alexandre.belloni@free-electrons.com, plagnioj@jcrosoft.com, boris.brezillon@free-electrons.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 18 March 2016 08:21:19 Ludovic Desroches wrote:
> -struct soc_device * __init at91_soc_init(const struct at91_soc *socs)
> +int __init at91_get_cidr_exid_from_dbgu(u32 *cidr, u32 *exid)
>  {


> +
> +int __init at91_get_cidr_exid_from_chipid(u32 *cidr, u32 *exid)
> +{
> 

These should both be 'static', right?

	Arnd
