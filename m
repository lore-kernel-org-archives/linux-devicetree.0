From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/6] ARM: plat-versatile: add DT support to FPGA IRQ
 controller
Date: Sat, 1 Sep 2012 03:14:15 +0200
Message-ID: <CACRpkdamVhbW_nizDODTu2wg7wX+4ENnLMGH=RoHkG4hwn3Yfg@mail.gmail.com>
References: <1345119357-22702-1-git-send-email-linus.walleij@linaro.org>
 <201208161350.49063.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201208161350.49063.arnd-r2nGTMty4D4@public.gmane.org>
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
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 16, 2012 at 3:50 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 16 August 2012, Linus Walleij wrote:
>> +- irq-start: the u32 hardware IRQ number of the first interrupt handled by
>> +  this FPGA IRQ instance - since there may be many FPGA IRQ controller
>> +  instances, each will have its unique hardware offset number.
>
> The irq-start value is a Linux specific invention, the hardware doesn't
> know anything about these. As long as you depend on specific IRQ numbers
> to get assigned, I would use something like auxdata to find the
> start number.

Sorry that does not work. Auxdata is not used with IRQ controllers,
only with devices.

of_irq_init() will dereference the .data field of struct of_device_id
and use as a callback function to initialize the IRQ controller, no
chance to pass any other data that way.

> When all devices get their IRQ numbers from the device
> tree, you can move to linear IRQ domains instead of legacy, and let
> the irq domain code pick the numbers.

It seems I have no other choice here than to move directly to
linear numbers or atleast dynamically allocated descriptors.

Yours,
Linus Walleij
