From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 3/7] tegra: fdt: Add extra I2C bindings for U-Boot
Date: Mon, 23 Jan 2012 11:25:28 -0700
Message-ID: <4F1DA618.9020605@nvidia.com>
References: <1326394818-32227-1-git-send-email-sjg@chromium.org>	<1326394818-32227-4-git-send-email-sjg@chromium.org>	<4F188261.4060607@nvidia.com>
 <CAPnjgZ0cOquTwqg4wx3Cz1+OKXUzYoBvUi2PMA7oHN=2riOHmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ0cOquTwqg4wx3Cz1+OKXUzYoBvUi2PMA7oHN=2riOHmQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/22/2012 10:41 AM, Simon Glass wrote:
> Hi Stephen,
> 
> On Thu, Jan 19, 2012 at 12:51 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On 01/12/2012 12:00 PM, Simon Glass wrote:
>>> Add U-Boot's peripheral clock information to the Tegra20 device tree file.
>>
>>> diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
>>> index ca7b523..963cf27 100644
>>> --- a/arch/arm/dts/tegra20.dtsi
>>> +++ b/arch/arm/dts/tegra20.dtsi
>>> @@ -45,6 +45,8 @@
>>>               compatible = "nvidia,tegra20-i2c";
>>>               reg = <0x7000C000 0x100>;
>>>               interrupts = < 70 >;
>>> +             clock-frequency = <100000>;
>>
>> That's board-specific information. I'd rather not include it in the SoC
>> .dtsi file even as a default; that way, it forces people to think about
>> the correct value and put it in their board file, whereas including a
>> default means people probably won't think about it.
> 
> OK I moved this into the board file - sadly this means everyone will
> need to specify it here. Or should we have a default?

I think I'd rather not have the default. That way, people need to think
about the correct value to use in their board file, rather than having
it magically work without having validated the value.

If people disagree, we'd need to update the kernel's tegra[23]0.dtsi,
since they assume ${board}.dts will set this property.

-- 
nvpublic
