From: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Mon, 8 Feb 2016 16:49:25 +0530
Message-ID: <56B879BD.2070608@ti.com>
References: <1452486886-8049-1-git-send-email-marex@denx.de>
 <201602041225.11679.marex@denx.de> <56B38AB3.3070801@ti.com>
 <201602060842.38290.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201602060842.38290.marex-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 02/06/2016 01:12 PM, Marek Vasut wrote:
> On Thursday, February 04, 2016 at 06:30:27 PM, R, Vignesh wrote:
>> On 2/4/2016 4:55 PM, Marek Vasut wrote:

[...]

>> Yeah, there is delay(of few ns) required between writing to
>> INDIRECTWR_START bit and actually writing data to flash(i.e writesl()
>> call). This is specific to TI K2G SoC and needs to be tied to the new
>> binding.
> 
> Can't you somehow poll the hardware to check whether or not it's ready instead
> of adding some random delay ?

There is no dedicated register to poll as such.

According to TRM:
"Wait for couple of cycles of QSPI_REF_CLK(functional clock of QSPI
@384MHz) until CQSPI_REG_INDIRECTWR[0] bit is internally synchronized by
the QSPI module before writing to flash".

So, a few ns(~6ns @384MHz) delay is needed (or accessing a QSPI module
register should be sufficient as it will take more than 2 clock cycles).
I believe this delay is specific to TI K2G SoC and maybe needs to be
tied to the binding.


-- 
Regards
Vignesh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
