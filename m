From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 01/16] dt: davinci: use proper address after @
Date: Fri, 25 Mar 2016 10:13:11 -0500
Message-ID: <CAL_JsqKdVsJaWhKt6tSJNd+oev5qC+7_u=CFCgO980NZk-tdOA@mail.gmail.com>
References: <1458863503-31121-1-git-send-email-david@lechnology.com>
 <1458863503-31121-2-git-send-email-david@lechnology.com>
 <56F53D20.6030709@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <56F53D20.6030709@cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, David Lechner <david@lechnology.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@kernel.org>, Sekhar Nori <nsekhar@ti.com>, open list <linux-kernel@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Petr Kulhavy <petr@barix.com>, David.Laight@aculab.com, Alan Stern <stern@rowland.harvard.edu>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Bin Liu <b-liu@ti.com>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 25, 2016 at 8:29 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Hello.
>
> On 03/25/2016 02:51 AM, David Lechner wrote:
>
>> TI has been using the physical address in DT after the @ in device nodes.
>> The device tree convention is to use the same address that is used for
>> the reg property. This updates all davinci DT files to use the proper
>> convention.
>>
>> Signed-off-by: David Lechner <david@lechnology.com>
>
> [...]
>
>> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
>> index 226cda7..4294849 100644
>> --- a/arch/arm/boot/dts/da850.dtsi
>> +++ b/arch/arm/boot/dts/da850.dtsi
>> @@ -15,7 +15,7 @@
>>                 #address-cells = <1>;
>>                 #size-cells = <1>;
>>                 ranges;
>> -               intc: interrupt-controller {
>> +               intc: interrupt-controller@fffee000 {
>>                         compatible = "ti,cp-intc";
>>                         interrupt-controller;
>>                         #interrupt-cells = <1>;
>> @@ -23,7 +23,7 @@
>>                         reg = <0xfffee000 0x2000>;
>>                 };
>>         };
>> -       soc {
>> +       soc@1c00000 {
>
>
>    This node doesn't have the "reg" prop.

But probably has a ranges property which is correct.

Rob
