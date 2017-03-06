From: Jon Mason <jon.mason@broadcom.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: bcm5301x: Add I2C support to the DT
Date: Mon, 6 Mar 2017 10:12:26 -0500
Message-ID: <CAC3K-4qHPpFJj_UKo3VePw-1qwk-y6Zt2R00O9UpyXqJnt31rA@mail.gmail.com>
References: <1488500494-20622-1-git-send-email-jon.mason@broadcom.com>
 <1488500494-20622-4-git-send-email-jon.mason@broadcom.com>
 <bb91cbbd-f5e5-9ce8-e925-89e6f831e50c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <bb91cbbd-f5e5-9ce8-e925-89e6f831e50c@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Jon Mason <jonmason@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Mar 5, 2017 at 8:13 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>
> On 03/02/2017 04:21 PM, Jon Mason wrote:
>> From: Jon Mason <jonmason@broadcom.com>
>>
>> Add I2C support to the bcm5301x Device Tree.  Since no driver changes
>> are needed to enable this hardware, only the device tree changes are
>> required to make this functional.
>>
>> Signed-off-by: Jon Mason <jonmason@broadcom.com>
>> ---
>>  arch/arm/boot/dts/bcm5301x.dtsi | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
>> index 4e3fbce..2a343f2 100644
>> --- a/arch/arm/boot/dts/bcm5301x.dtsi
>> +++ b/arch/arm/boot/dts/bcm5301x.dtsi
>> @@ -338,6 +338,15 @@
>>               };
>>       };
>>
>> +     i2c0: i2c@18009000 {
>> +             compatible = "brcm,iproc-i2c";
>> +             reg = <0x18009000 0x50>;
>> +             interrupts = <GIC_SPI 121 IRQ_TYPE_NONE>;
>> +             #address-cells = <1>;
>> +             #size-cells = <0>;
>> +             clock-frequency = <100000>;
>
> Should not this have a:
>                 status = "disabled"
>
> property by default such that boards can override this by phandle when
> there are actual I2C devices available?

Your comment appears to match the way it is being done in most device trees.

NSP implementation is identical to this.  So, if I should change it
here, I should make there too.

Thanks,
Jon

>> +     };
>> +
>>       lcpll0: lcpll0@1800c100 {
>>               #clock-cells = <1>;
>>               compatible = "brcm,nsp-lcpll0";
>>
>
> --
> Florian
