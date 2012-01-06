From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] ARM: at91: pit add DT support
Date: Fri, 06 Jan 2012 14:37:41 +0100
Message-ID: <4F06F925.1030204@atmel.com>
References: <1325771308-19770-1-git-send-email-nicolas.ferre@atmel.com>
 <1325784348-29481-1-git-send-email-nicolas.ferre@atmel.com>
 <20120105180028.GB22653@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120105180028.GB22653-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/05/2012 07:00 PM, Grant Likely :
> On Thu, Jan 05, 2012 at 06:25:48PM +0100, Nicolas Ferre wrote:
>> From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
>>
>> Retreive registers address and IRQ from device tree entry. Fall back
>> to built-in values if an error occurs.
>>
>> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
>> [nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org: change error path and interrupts property handling]
>> Signed-off-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>> ---
>> v3: - use irq_of_parse_and_map() for handling irq numbers specified by DT.
>>       Correction proposed by Jamie Iles.
>>
>> v2: - new specification of irq numbers in DT (due to modification of AIC code)
>>     - new error path in of_at91sam926x_pit_init()
>>     - fall back to built-in values if an error occurs
>>     - use of of_property_read_u32() to get irq property
>>
>>  .../devicetree/bindings/arm/atmel-at91.txt         |    8 +++
>>  arch/arm/boot/dts/at91sam9g20.dtsi                 |    5 ++
>>  arch/arm/boot/dts/at91sam9g45.dtsi                 |    6 ++
>>  arch/arm/mach-at91/at91sam926x_time.c              |   53 +++++++++++++++++++-
>>  4 files changed, 70 insertions(+), 2 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/arm/atmel-at91.txt

[..]

>> --- a/arch/arm/mach-at91/at91sam926x_time.c
>> +++ b/arch/arm/mach-at91/at91sam926x_time.c

[..]

>> +	/* Get the interrupts property */
>> +	ret = irq_of_parse_and_map(np, 0);
>> +	if (ret <= 0)
>> +		goto ioremap_err;
> 
> if (!ret)
> 
> The DT irq functions return 0 on failure.

Ok, modified in new revision.

Best regards,
-- 
Nicolas Ferre
