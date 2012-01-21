From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v4 03/20] fdt: Add basic support for decoding
	GPIO definitions
Date: Sat, 21 Jan 2012 09:08:03 -0800
Message-ID: <CAPnjgZ0TCNTZjR_Fc1+UvYxyjH-a-Bxtkz60OERR7YmC5tbuug@mail.gmail.com>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
	<1326342789-5781-4-git-send-email-sjg@chromium.org>
	<4F1744FE.4090409@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F1744FE.4090409@nvidia.com>
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <TWarren@nvidia.com>, Jerry Van Baren <vanbaren@cideas.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Wed, Jan 18, 2012 at 2:17 PM, Stephen Warren <swarren@nvidia.com> wrote:
> On 01/11/2012 09:32 PM, Simon Glass wrote:
>> This adds some support into fdtdec for reading GPIO definitions from
>> the fdt. We permit up to FDT_GPIO_MAX GPIOs in the system. Each GPIO
>> is of the form:
>>
>> gpio-function-name =3D <phandle gpio_num flags>;
>
> That's not true in general.
>
> The binding definition for the GPIO controller that provides the GPIO in
> question defines the number and meaning of all cells after the phandle
> cell. In practice, this usually does mean two cells with the meanings
> above, but there's no need for this to be true in general.
>
> For reference, the correct way to parse such a property is:
>
> * Read the first cell.
> * Find the node referenced by the phandle.
> * Ensure property gpio-controller is present in the controller node.
> * Read property #gpio-cells from the controller node.
> * Extract #gpio-cells from the original property.
> * Keep processing more cells from the original property; there may be
> multiple GPIOs listed.
>
> Still, I'll review this patch under the assumption that it's understood
> that its applicability is limited to the subset of controllers that use
> the same GPIO specifier as Tegra, i.e. that which you documented.
>
>> where:
>>
>> phandle is a pointer to the GPIO node
>> gpio_num is the number of the GPIO (0 to 223)
>> flags is a flag, as follows:
>>
>> =A0 =A0bit =A0 =A0meaning
>> =A0 =A00 =A0 =A0 =A00=3Dpolarity normal, 1=3Dactive low (inverted)
>
> For reference, according to the binding documentation in the Linux
> kernel, Samsung Exynos4 doesn't use this format, and while all other
> chips do have a flags cell, about 50% of the controllers indicate the
> cell is unused.
>
>> An example is:
>>
>> gpio-enable-propounder =3D <&gpio 43 0>;
>
> It appears to be idiomatic to name GPIO-related properties as plural
> even when only one GPIO is expected, so e.g. "wp-gpios" for an SDHCI
> controller's write-proptect GPIO, rather than simply "wp-gpio.

OK, for both of those I will update the commit message. I have so far
been avoiding having the fdtdec library keep any state around. Looking
up a phandle and properties every time we need to decode a GPIO might
push me towards adding some sort of structure to speed decoding of the
device tree. For now we don't need it, and these functions only do
what they say they do, but it looks like at some point in the future
we might need more complexity here.

Regarding multiple GPIOs - there is a static function
fdtdec_decode_gpios() for decoding such a list which we can export as
needed later. But not everything is required to be a list. For many
GPIOs it makes no sense to have more than one, so a single GPIO is
convenient and conceptually simple for people, and easy to code.

>
> ...
>> diff --git a/include/fdtdec.h b/include/fdtdec.h
> ...
>> +/* GPIOs are numbered from 0 */
>> +enum {
>> + =A0 =A0 FDT_GPIO_NONE =3D -1U, =A0 =A0/* an invalid GPIO used to end o=
ur list */
>
> Is this due to the way U-Boot works right now, or something defined by
> this patch? It's been pointed out that the kernel's choice to use -1 as
> "invalid GPIO" rather than 0 was a mistake, since that prevents GPIO
> fields being easily added to platform data structures, since you then
> have to go and initialize every new instance to -1, rather than relying
> on BSS initializing it to 0. I assume this is just the way U-Boot works,
> so solving this is outside the scope of this patch.

It is nothing to do with U-Boot itself - we can choose any number.
What is Linux using now / planning to use?

The number -1U is convenient because it allows us to number GPIOs from
0, which is natural for people and easier to see what is going on when
debugging. Off-by-one situations can be very confusing for people.

At present you must call fdtdec_decode_gpio() to decode a gpio
property in the node. If you don't then you can't know if anything was
there. U-Boot doesn't really have a device model yet, but if it did,
and if you wanted to add a GPIO to a core structure that the driver
used, then indeed the driver (or the code that owns the structure)
would need to call fdtdec_decode_gpio() to set it up. If it did not
then the GPIO number would be 0, which is valid.

A few things do come to mind though. First ->name is set to the
property name - if that is NULL then fdtdec_decode_gpio() has not been
called. Also we could add a 'valid' flag to the flags byte perhaps.
Perhaps in Linux a GPIO is represented just with a number, but here we
are using a structure and can fairly easily add something else to
indicate validity.

Should we try to do something about this now, or later? I am
especially interested in what Linux plans to do here.

>
> Ignoring all the above, the code looks correct to perform as documented.

Thanks for looking at it.

Regards,
Simon

>
> --
> nvpublic
