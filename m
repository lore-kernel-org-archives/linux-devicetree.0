From: Duc Dang <dhdang@apm.com>
Subject: Re: [PATCH] arm64: dts: apm: Use lowercase consistently for hex constants
Date: Mon, 13 Jun 2016 19:33:59 -0700
Message-ID: <CADaLNDnjuunP9Nj1F=9ddgx5d5rrT2YrzmuAU_nTH3ZJgs1sCg@mail.gmail.com>
References: <20160606201756.4978.58010.stgit@bhelgaas-glaptop2.roam.corp.google.com>
 <20160608194828.GA2398@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160608194828.GA2398@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 8, 2016 at 12:48 PM, Rob Herring <robh@kernel.org> wrote:
> On Mon, Jun 06, 2016 at 03:17:56PM -0500, Bjorn Helgaas wrote:
>> The convention in these files is to use lowercase for "0x" prefixes and for
>> the hex constants themselves, but a few changes didn't follow that
>> convention, which makes the file annoying to read.
>>
>> Use lowercase consistently for the hex constants.  No functional change
>> intended.
>>
>> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
>> ---
>>  .../devicetree/bindings/net/apm-xgene-enet.txt     |    4 +-
>>  arch/arm64/boot/dts/apm/apm-shadowcat.dtsi         |   40 ++++++++++----------
>>  arch/arm64/boot/dts/apm/apm-storm.dtsi             |   36 +++++++++---------
>>  3 files changed, 40 insertions(+), 40 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/apm-xgene-enet.txt b/Documentation/devicetree/bindings/net/apm-xgene-enet.txt
>> index 05f705e3..e41b2d5 100644
>> --- a/Documentation/devicetree/bindings/net/apm-xgene-enet.txt
>> +++ b/Documentation/devicetree/bindings/net/apm-xgene-enet.txt
>> @@ -59,8 +59,8 @@ Example:
>>               compatible = "apm,xgene-enet";
>>               status = "disabled";
>>               reg = <0x0 0x17020000 0x0 0xd100>,
>> -                   <0x0 0X17030000 0x0 0X400>,
>> -                   <0x0 0X10000000 0x0 0X200>;
>> +                   <0x0 0x17030000 0x0 0x400>,
>> +                   <0x0 0x10000000 0x0 0x200>;
>>               reg-names = "enet_csr", "ring_csr", "ring_cmd";
>>               interrupts = <0x0 0x3c 0x4>;
>>               port-id = <0>;
>> diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
>> index c569f76..9773687 100644
>> --- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
>> +++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
>> @@ -106,9 +106,9 @@
>>               interrupts = <1 9 0xf04>;       /* GIC Maintenence IRQ */
>>               ranges = <0 0 0 0x79000000 0x0 0x800000>; /* MSI Range */
>>               reg = <0x0 0x78090000 0x0 0x10000>,     /* GIC Dist */
>> -                   <0x0 0x780A0000 0x0 0x20000>,     /* GIC CPU */
>> -                   <0x0 0x780C0000 0x0 0x10000>,     /* GIC VCPU Control */
>> -                   <0x0 0x780E0000 0x0 0x20000>;     /* GIC VCPU */
>> +                   <0x0 0x780a0000 0x0 0x20000>,     /* GIC CPU */
>> +                   <0x0 0x780c0000 0x0 0x10000>,     /* GIC VCPU Control */
>> +                   <0x0 0x780e0000 0x0 0x20000>;     /* GIC VCPU */
>>               v2m0: v2m@0x00000 {
>
> Unit addresses should not have '0x' or leading 0s.
>
>>                       compatible = "arm,gic-v2m-frame";
>>                       msi-controller;
>> @@ -159,35 +159,35 @@
>>                       msi-controller;
>>                       reg = <0x0 0x90000 0x0 0x1000>;
>>               };
>> -             v2m10: v2m@0xA0000 {
>> +             v2m10: v2m@0xa0000 {
>
> and here...

Thanks, Bjorn. Will you have time to post another version that
addresses Rob's comment?

Hi Rob,

If you are fine, I will take these changes into my xgene-next tree for
the next DTS pull request for 4.8 (after your comment is addressed)

Regards,
Duc Dang.
>
> Rob
