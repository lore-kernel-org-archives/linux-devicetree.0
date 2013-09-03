From: Markus Mayer <markus.mayer@linaro.org>
Subject: Re: [PATCH v7 2/3] ARM: bcm281xx: Enable GPIO driver
Date: Tue, 3 Sep 2013 10:44:27 -0700
Message-ID: <CAPdLdqm-M=ZZiHp1zr8_6Xst7WFq6w2o6k07ZArbiovyB9Yj1w@mail.gmail.com>
References: <1377882914-30152-1-git-send-email-markus.mayer@linaro.org>
 <1377882914-30152-3-git-send-email-markus.mayer@linaro.org>
 <522127E7.6090501@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <522127E7.6090501@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christian Daudt <csd@broadcom.com>
Cc: Device Tree List <devicetree@vger.kernel.org>, Linaro Patches <patches@linaro.org>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Tim Kryger <tim.kryger@linaro.org>, Matt Porter <matt.porter@linaro.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 30 August 2013 16:16, Christian Daudt <csd@broadcom.com> wrote:
> On 13-08-30 10:15 AM, Markus Mayer wrote:
>>
>> Turn on the bcm281xx GPIO driver in the kernel configuration.
>> ---
>>   arch/arm/mach-bcm/Kconfig |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
>> index f112895..5819126 100644
>> --- a/arch/arm/mach-bcm/Kconfig
>> +++ b/arch/arm/mach-bcm/Kconfig
>> @@ -9,7 +9,7 @@ config ARCH_BCM
>>         select CLKSRC_OF
>>         select GENERIC_CLOCKEVENTS
>>         select GENERIC_TIME
>> -       select GPIO_BCM
>> +       select GPIO_BCM_KONA
>>         select SPARSE_IRQ
>>         select TICK_ONESHOT
>>         help
>
> Reviewed-by: Christian Daudt <csd@broadcom.com>

Also

Signed-off-by: Markus Mayer <markus.mayer@linaro.org>

Looks like I forgot to add the sign-off to this re-introduced patch.
Please let me know if you want me to re-send rather than just adding
it here on the mailing list.

Regards,
-Markus

-- 
Markus Mayer
Broadcom Landing Team
