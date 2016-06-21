From: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
Subject: Re: [PATCH v2 1/3] Documentation: DT: Add iproc-static-adc binding
Date: Tue, 21 Jun 2016 15:30:17 +0530
Message-ID: <CAAFb_voGMfQvvW5yknv0n73KTEh7e_vy_UuKf4FL2+iUz8t6rA@mail.gmail.com>
References: <1466330790-2820-1-git-send-email-raveendra.padasalagi@broadcom.com>
 <1466330790-2820-2-git-send-email-raveendra.padasalagi@broadcom.com>
 <20160620180458.GA10171@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160620180458.GA10171@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pramod Kumar <pramod.kumar@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-iio@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org, Jon Mason <jonmason@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, linux-arm-kernel@lists.infradead.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Kumar Gala <galak@codeaurora.org>, Jonathan Cameron <jic23@kernel.org>, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Please find my reply inline.

Regards,
Raveendra

On Mon, Jun 20, 2016 at 11:34 PM, Rob Herring <robh@kernel.org> wrote:
> On Sun, Jun 19, 2016 at 03:36:28PM +0530, Raveendra Padasalagi wrote:
>> The patch adds devicetree binding document for broadcom's
>> iproc-static-adc controller driver.
>>
>> Signed-off-by: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
>> Reviewed-by: Ray Jui <ray.jui@broadcom.com>
>> Reviewed-by: Scott Branden <scott.branden@broadcom.com>
>> ---
>>  .../bindings/iio/adc/brcm,iproc-static-adc.txt     | 43 ++++++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/adc/brcm,iproc-static-adc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/brcm,iproc-static-adc.txt b/Documentation/devicetree/bindings/iio/adc/brcm,iproc-static-adc.txt
>> new file mode 100644
>> index 0000000..1de0dfa
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/brcm,iproc-static-adc.txt
>> @@ -0,0 +1,43 @@
>> +* Broadcom's IPROC Static ADC controller
>> +
>> +Required properties:
>> +
>> +- compatible: Must be "brcm,iproc-static-adc"
>> +
>
>> +- #address-cells: Specify the number of u32 entries needed in child nodes.
>> +  Should set to 1.
>> +
>> +- #size-cells: Specify number of u32 entries needed to specify child nodes size
>> +  in reg property. Should set to 1.
>
> Why are these needed? What child nodes can you have?

Yes, these are not needed. ADC can't have any child nodes.

I will fix it in the next patch. Thanks.

>> +
>> +- adc-syscon: Handler of syscon node defining physical base address of the
>> +  controller and length of memory mapped region.
>> +
>> +- #io-channel-cells = <1>; As ADC has multiple outputs
>> +  refer to Documentation/devicetree/bindings/iio/iio-bindings.txt for details.
>> +
>> +- clocks: Clock used for this block.
>> +
>> +- clock-names: Clock name should be given as tsc_clk.
>> +
>> +- interrupts: interrupt line number.
>> +
>> +For example:
>> +
>> +     ts_adc_syscon: ts_adc_syscon@180a6000 {
>> +             compatible = "brcm,iproc-ts-adc-syscon","syscon";
>> +             reg = <0x180a6000 0xc30>;
>> +     };
>> +
>> +     adc: adc@180a6000 {
>> +             compatible = "brcm,iproc-static-adc";
>> +             #address-cells = <1>;
>> +             #size-cells = <1>;
>> +             adc-syscon = <&ts_adc_syscon>;
>> +             #io-channel-cells = <1>;
>> +             io-channel-ranges;
>> +             clocks = <&asiu_clks BCM_CYGNUS_ASIU_ADC_CLK>;
>> +             clock-names = "tsc_clk";
>> +             interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
>> +             status = "disabled";
>> +     };
>> --
>> 1.9.1
>>
