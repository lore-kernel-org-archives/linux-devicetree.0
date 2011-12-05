From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 04/17] fdt: Add basic support for decoding
	GPIO definitions
Date: Mon, 5 Dec 2011 13:56:59 -0800
Message-ID: <CAPnjgZ3ARCTXVN2MKhfrdCCmmb21zbYdSq8AuQFPdoA=xFr7Mg@mail.gmail.com>
References: <1322878300-5551-1-git-send-email-sjg@chromium.org>
	<1322878300-5551-5-git-send-email-sjg@chromium.org>
	<4EDD3BA8.8040808@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4EDD3BA8.8040808@nvidia.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@nvidia.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <TWarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Mon, Dec 5, 2011 at 1:46 PM, Stephen Warren <swarren@nvidia.com> wrote:
> On 12/02/2011 07:11 PM, Simon Glass wrote:
>> This adds some support into fdtdec for reading GPIO definitions from
>> the fdt. We permit up to FDT_GPIO_MAX GPIOs in the system. Each GPIO
>> is of the form:
>>
>> gpio-function-name =3D <phandle gpio_num flags>;
>>
>> where:
>>
>> phandle is a pointer to the GPIO node
>> gpio_num is the number of the GPIO (0 to 223)
>> flags is some flags, proposed as follows:
>>
>> =A0 =A0bit =A0 =A0meaning
>> =A0 =A00 =A0 =A0 =A00=3Dinput, 1=3Doutput
>> =A0 =A01 =A0 =A0 =A0for output only: inital value of output
>> =A0 =A02 =A0 =A0 =A00=3Dpolarity normal, 1=3Dactive low (inverted)
>
> The meaning of the flags (and even whether there are any flags any if so
> how many cells there are to contain them) is defined by the GPIO
> controller's binding. It's not something that can be interpreted in
> isolation by a generic DT parsing function. See for example #gpio-cells
> in tegra20.dtsi's gpio node and kernel file
> Documentation/devicetree/bindings/gpio/gpio_nvidia.txt.

I see this in my version:

Required properties:
- compatible : "nvidia,tegra20-gpio"
- #gpio-cells : Should be two. The first cell is the pin number and the
  second cell is used to specify optional parameters:
  - bit 0 specifies polarity (0 for normal, 1 for inverted)
- gpio-controller : Marks the device node as a GPIO controller.

so how do I go about adding the other two bits?

>
> This implies that a lot of the code isn't correct, but I haven't
> explicitly mentioned this everywhere for brevity.

Well it's ok - these flags are only used in one place, and only the
input/output flag in fact.

It would be nice to use constants for these in the fdt instead of
numbers. Is that in progress?

enable-propounder =3D <&gpio 43 OUTPUT>;

>
>> An example is:
>>
>> enable-propounder =3D <&gpio 43 1>;
>
> I /think/ convention is to name such properties foo-gpios rather than
> just foo. Still, this is only a comment on the example and not the code,
> since the complete property name is passed into the new functions by the
> caller.

ok, will update.

>
>> +/* For now we allow 224 GPIOs. We can extend this later if required */
>> +enum {
>> + =A0 =A0 FDT_GPIO_NONE =3D 255, =A0 =A0/* an invalid GPIO used to end o=
ur list */
>
> Can't you use 0 for that? (the kernel currently uses -1, but it seems
> there's agreement that was a mistake). If you use 255, the number will
> have to keep getting bumped as more complex systems become supported. If
> not 0, perhaps U32_MAX or whatever the relevant ${type}_MAX is?

But 0 is a valid GPIO isn't it?

I currently use the max value available to the u8. We can change it at
will when we update the u8 type to u16 which is why I made it a
constant.

Thanks for all your help with this.

Regards,
Simon

>
> --
> nvpublic
