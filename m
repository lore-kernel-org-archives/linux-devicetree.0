From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/10] pinctrl: use postcore_initcall
Date: Fri, 19 Oct 2012 10:16:12 +0800
Message-ID: <CAN1soZy17wO2s7WoRSRod8k5Zh7fuUc1gxhQiHEb0=zwLhyj6A@mail.gmail.com>
References: <1350551224-12857-1-git-send-email-haojian.zhuang@gmail.com>
 <5080802B.3000209@wwwdotorg.org>
 <20121018222802.GG30550@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121018222802.GG30550-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 19, 2012 at 6:28 AM, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote:
> * Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> [121018 15:20]:
>> On 10/18/2012 03:06 AM, Haojian Zhuang wrote:
>> > Since pins are configured in device driver, pinctrl driver should be
>> > loaded by those device driver. module_platform_driver() only declares
>> > pinctrl driver is in module_initcall privilege. Use postcore_initcall
>> > privilege instead.
>>
>> I'm not convinced this is needed; doesn't deferred probe sort out the
>> dependencies correctly?
>
> I'm a bit concerned about this need too as the trend is towards
> initializing things later than earlier. The drivers/Makefile order
> and deferred probe should be already enough?
>
> Specifically could you decribe the cases where this issue happens?
> Also check if one of your client drivers has some early initcall
> that's no longer needed.
>
> Regards,
>
> Tony

Yes, the special case is PMIC. Most of PMIC are based on I2C/SPI bus.
It means that I2C/SPI bus driver should be initialized firstly. For example,
we could find that PMIC mfd driver are initialized in subsys init call level.
It means that pinctrl should be initialized earlier than I2C/SPI bus driver.
Otherwise, pins of I2C bus may not be configured as I2C function since
pinctrl driver is module init call level.

Regards
Haojian
