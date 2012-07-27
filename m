From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: specifying two conflicting configs
Date: Thu, 26 Jul 2012 20:05:43 -0700
Message-ID: <CAOesGMgs8R-9-pNB8DBZ0z2ECsS-4x=tDUjogGjTLAxM0MPpcA@mail.gmail.com>
References: <20120724113450.328c27430ebc4438d0048346@kinali.ch>
 <20120725034801.GB23430@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120725034801.GB23430-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 24, 2012 at 8:48 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Jul 24, 2012 at 11:34:50AM +0200, Attila Kinali wrote:
>> Hi,
>>
>> I have here an embedded system where i use a serial port as SD Card
>> interface as well as SPI interface. I select what i want to use
>> by setting a GPIO pin high or low.
>>
>> Currently i'm using two different dts files, one that specifies the
>> serial port as SD Card interface and one that specifies the serial
>> port as SPI interface.
>>
>> Now i would like to merge them into one file so that i can select
>> which mode to use at runtime. The documentation gave me the impression
>> that this should be possible, but i was not able to figure out how
>> to do it.
>>
>> Would someone be so kind and point me to the documentation/example
>> i've missed?
>>
>> The current configuration i use is either:
>>
>> ssp0: ssp@80010000 {
>>         compatible = "fsl,imx23-mmc";
>>         pinctrl-names = "default";
>>         pinctrl-0 = <&mmc0_8bit_pins_a &mmc1_pins_fixup>;
>>         bus-width = <8>;
>>         status = "okay";
>> };
>>
>> or:
>>
>> ssp0: ssp@80010000 {
>>         #address-cells = <1>;
>>         #size-cells = <0>;
>>         compatible = "fsl,imx23-spi";
>>         fsl,ssp-dma-channel = <1>;
>>         pinctrl-names = "default";
>>         pinctrl-0 = <&spi_pins_a>;
>>         status = "okay";
>>
>> };
>
> So, Mitch may have better insights here, but my inclination would be
> to do something like this:
>
> ssp-mux@80010000 {
>         #address-cells = <1>;
>         #size-cells = <0>;
>         compatible = "yourvendor,ssp-mux";
>         control-line = <&gpio 17>;
>         ranges = <0x0 0x80010000>;
>
>         ssp-mmc@0 {
>                   compatible = "fsl,imx23-mmc";
>                   /* ... */
>                   status = "okay";
>         };
>
>         ssp-spi@1 {
>                   compatible = "fsl,imx23-spi";
>                   /* ... */
>                   status = "disabled";
>         };
> };
>
> ranges would need tweaking depending on #size-cells of the parent and
> the existing node reg properties, which you don't show.
>
> A hackier, but possibly simpler alternative would be to simply include
> both nodes, but have the one that's active by default marked status =
> "okay" and the other marked status = "disabled".  Platform specific
> knowledge would then me needed to know that with the right gpio magic
> the original one can be disabled and the other enabled.

I think the missing piece for a bystander looking at this proposal
(besides Mitch' comment about ranges) is that the probing by the
kernel would stop at the mux level, and the driver binding on the mux
device would have the option of restarting tree walk on its children.

That means that the standard unmodified drivers can be used since the
selection is done outside of them.


-Olof
