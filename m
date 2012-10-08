From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 04/16] tegra: fdt: Add LCD definitions for Tegra
Date: Mon, 8 Oct 2012 13:01:52 -0700
Message-ID: <CAPnjgZ2+a56FLumrC3pZ-5TP+wJ1HmRs94_FwpgDZO+98B7F8g@mail.gmail.com>
References: <1348793077-10126-1-git-send-email-sjg@chromium.org>
 <1348793077-10126-5-git-send-email-sjg@chromium.org>
 <506CC301.6050508@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <506CC301.6050508-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Wed, Oct 3, 2012 at 3:58 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 09/27/2012 06:44 PM, Simon Glass wrote:
>> Add LCD definitions and also a proposed binding for LCD displays.
>>
>> The PWM is as per what will likely be committed to linux-next soon.
>>
>> The displaymode binding comes from a proposal here:
>>
>> http://lists.freedesktop.org/archives/dri-devel/2012-July/024875.html
>>
>> The panel binding is new, and fills a need to specify the panel
>> timings and other tegra-specific information. Should a binding appear
>> that allows the pwm to handle this automatically, we can revisit
>> this.
>
>> diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
>
>> +     host1x {
>> +             compatible = "nvidia,tegra20-host1x", "simple-bus";
>> +             reg = <0x50000000 0x00024000>;
>> +             interrupts = <0 65 0x04   /* mpcore syncpt */
>> +                           0 67 0x04>; /* mpcore general */
>> +
>> +             #address-cells = <1>;
>> +             #size-cells = <1>;
>> +
>> +             ranges = <0x54000000 0x54000000 0x04000000>;
>> +
>> +             /* video-encoding/decoding */
>> +             mpe {
>> +                     reg = <0x54040000 0x00040000>;
>> +                     interrupts = <0 68 0x04>;
>> +             };
>
> Shouldn't all of these nodes have status="disabled", since in general
> boards will want to opt-in to these modules. In fact, many of these
> nodes won't end up (ever?) being used in U-Boot; perhaps we should only
> add the nodes we care about.
>
>> +             /* display controllers */
>> +             dc@54200000 {
>> +                     compatible = "nvidia,tegra20-dc";
>> +                     reg = <0x54200000 0x00040000>;
>> +                     interrupts = <0 73 0x04>;
>> +
>> +                     rgb {
>> +                             status = "disabled";
>> +                     };
>> +             };
>
> I think we definitely want status="disabled" in the dc nodes themselves,
> since we definitely want boards in U-Boot to control whether to enable
> the dc.
>

OK I will update these, thanks.

Regards,
Simon
