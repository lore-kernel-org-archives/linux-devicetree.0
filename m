From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Patch v4 0/5] Introduce keystone reset driver
Date: Wed, 21 May 2014 16:52:20 +0200
Message-ID: <8843733.6ZFJt7BN6L@wuerfel>
References: <1400682454-24535-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1400682454-24535-1-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, dbaryshkov@gmail.com, dwmw2@infradead.org, santosh.shilimkar@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, grant.likely@linaro.org, devicetree@vger.kernel.org, grygorii.strashko@ti.com, linux@arm.linux.org.uk, linux-doc@vger.kernel.org, w-kwok2@ti.com, rdunlap@infradead.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, m-karicheri2@ti.com, olof@lixom.net
List-Id: devicetree@vger.kernel.org

On Wednesday 21 May 2014 17:27:29 Ivan Khoronzhuk wrote:
> These patches introduce keystone reset driver.
> 
> The keystone SoC can be rebooted in several ways. By external reset
> pin, by soft and by watchdogs. This driver allows software reset and reset
> by one of the watchdogs. Also added opportunity to set soft/hard reset type.
> 
> Based on linux-next/master

Hi Ivan,

The code looks good to me now, but I have some comments about the
binding. Patches 1, 3 and 5

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Thanks for the quick update.
