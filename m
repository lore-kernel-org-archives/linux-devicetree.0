From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv2 1/2] gpio: add a driver for the Synopsys DesignWare
 APB GPIO block
Date: Tue, 20 Dec 2011 10:04:03 -0600
Message-ID: <4EF0B1F3.8080804@gmail.com>
References: <1324345431-12251-1-git-send-email-jamie@jamieiles.com>
 <4EF0AD6A.7070309@gmail.com> <20111220155445.GA19585@totoro>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111220155445.GA19585@totoro>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/20/2011 09:54 AM, Jamie Iles wrote:
> On Tue, Dec 20, 2011 at 09:44:42AM -0600, Rob Herring wrote:
>> Jamie,
>>
>> On 12/19/2011 07:43 PM, Jamie Iles wrote:
>>> The Synopsys DesignWare block is used in some ARM devices (picoxcell)
>>> and can be configured to provide multiple banks of GPIO pins.  The first
>>> bank (A) can also provide IRQ capabilities.
>>>
>>> v2:	- use Rob Herring's irqdomain in generic irq chip patches
>>> 	- use reg property to indicate bank index
>>> 	- support irqs on both edges based on LinusW's u300 driver
>>>
>>> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>>> Cc: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
>>> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>> Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
>>> ---
> [...]
>>> +++ b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
>>> @@ -0,0 +1,63 @@
>>> +* Synopsys DesignWare APB GPIO controller
>>> +
>>> +Required properties:
>>> +- compatible : Should be "snps,dw-apb-gpio"
>>> +- reg : Address and length of the register set for the device
>>> +
>>> +The GPIO controller has a configurable number of banks, each of which are
>>> +represented as child nodes with the following properties:
>>> +
>>> +Required properties:
>>> +- compatible : "snps,dw-apb-gpio-bank"
>>> +- gpio-controller : Marks the device node as a gpio controller.
>>> +- #gpio-cells : Should be two.  The first cell is the pin number and
>>> +  the second cell is used to specify optional parameters (currently
>>> +  unused).
>>> +- reg : The integer bank index of the bank, a single cell.
>>> +- nr-gpio : The number of pins in the bank, a single cell.
> [...]
>>> +gpio: gpio@20000 {
>>> +	compatible = "snps,dw-apb-gpio";
>>> +	reg = <0x20000 0x1000>;
>>> +	#address-cells = <1>;
>>> +	#size-cells = <0>;
>>> +
>>> +	banka: gpio-controller@0 {
>>> +		compatible = "snps,dw-apb-gpio-bank";
>>> +		gpio-controller;
>>> +		#gpio-cells = <2>;
>>> +		nr-gpio = <8>;
>>> +		reg = <0>;
>>
>> Actually, what I meant was to use the bank addresses here. Sorry that
>> wasn't clear. Then you don't need a calculation of bank offsets.
> 
> Unfortunately the hardware doesn't have a nice register map where the 
> registers for each bank are grouped together and they're all interleaved 
> so it's a bit of a mess really. 
> 
> Some of the picoxcell devices have configurations like 8 pins on bank A, 
> 16 on bank B then 20 or so on bank D, so I do think it makes sense to 
> define the banks as individual nodes and it fits in with the 
> programming model.
> 

Ah. I should have looked more closely at the register layout... From a
DT binding standpoint:

Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Rob
