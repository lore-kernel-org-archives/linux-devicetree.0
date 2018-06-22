From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: thermal: Add binding document for SR thermal
Date: Fri, 22 Jun 2018 11:21:41 +0530
Message-ID: <CABe79T74ycjqCAo5gnKkdMKZfcVGSuOX-EiUuhiwZ-iMtacPzQ@mail.gmail.com>
References: <1529310679-13482-1-git-send-email-srinath.mannam@broadcom.com>
 <1529310679-13482-2-git-send-email-srinath.mannam@broadcom.com> <20180620195214.GA10436@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180620195214.GA10436@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Pramod Kumar <pramod.kumar@broadcom.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Please find my comments for the reason to have multiple DT nodes.

On Thu, Jun 21, 2018 at 1:22 AM, Rob Herring <robh@kernel.org> wrote:
> On Mon, Jun 18, 2018 at 02:01:17PM +0530, Srinath Mannam wrote:
>> From: Pramod Kumar <pramod.kumar@broadcom.com>
>>
>> Add binding document for supported thermal implementation
>> in Stingray.
>>
>> Signed-off-by: Pramod Kumar <pramod.kumar@broadcom.com>
>> Reviewed-by: Ray Jui <ray.jui@broadcom.com>
>> Reviewed-by: Scott Branden <scott.branden@broadcom.com>
>> Reviewed-by: Srinath Mannam <srinath.mannam@broadcom.com>
>> ---
>>  .../bindings/thermal/brcm,sr-thermal.txt           | 45 ++++++++++++++++++++++
>>  1 file changed, 45 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt b/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
>> new file mode 100644
>> index 0000000..33f9e11
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
>> @@ -0,0 +1,45 @@
>> +* Broadcom Stingray Thermal
>> +
>> +This binding describes thermal sensors that is part of Stingray SoCs.
>> +
>> +Required properties:
>> +- compatible : Must be "brcm,sr-thermal"
>> +- reg : memory where tmon data will be available.
>> +
>> +Example:
>> +     tmons {
>> +             compatible = "simple-bus";
>> +             #address-cells = <1>;
>> +             #size-cells = <1>;
>> +             ranges;
>> +
>> +             tmon_ihost0: thermal@8f100000 {
>> +                     compatible = "brcm,sr-thermal";
>> +                     reg = <0x8f100000 0x4>;
>> +             };
>
> You still haven't given me a compelling reason why you need a node per
> register.
>
> You have a single range of registers. Make this 1 node.
>

We Have two reasons to have multiple nodes..
1. Our chip has multiple functional blocks. Each functional block has
its own thermal zone.
Functional blocks and their thermal zones enabled/disabled based on end product.
Few functional blocks need to disabled for few products so thermal
zones also need to disable.
In that case, nodes of specific thermal zones are removed from DTS
file of corresponding product.

2. Thermal framework provides sysfs interface to configure thermal
zones and read temperature of thermal zone.
To configure individual thermal zone, we need to have separate DT node.
Same to read temperature of individual thermal zone.
Ex: To read temperature of thermal zone 0.
         cat /sys/class/thermal/thermal_zone0/temp
     To configure trip temperature of thermal zone 0.
          echo 110000 > /sys/class/thermal/thermal_zone0/trip_point_0_temp

Also to avoid driver source change for the multiple products it is
clean to have multiple DT nodes.

> Rob
