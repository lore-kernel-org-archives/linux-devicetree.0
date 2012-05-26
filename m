From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH v4 2/6] gpio: re-add of_node_to_gpiochip function
Date: Sat, 26 May 2012 09:15:09 -0700
Message-ID: <CAA+hA=SLSk9wMtiFiarVR0t+T6KHSTQkYwPk99Kj75RYFP205g@mail.gmail.com>
References: <1337952980-14621-1-git-send-email-b29396@freescale.com>
	<1337952980-14621-2-git-send-email-b29396@freescale.com>
	<20120526000127.A53903E0D27@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120526000127.A53903E0D27@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Dong Aisheng <b29396@freescale.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@stericsson.com, swarren@wwwdotorg.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On Sat, May 26, 2012 at 8:01 AM, Grant Likely <grant.likely@secretlab.c=
a> wrote:
> On Fri, 25 May 2012 21:36:16 +0800, Dong Aisheng <b29396@freescale.co=
m> wrote:
>> From: Dong Aisheng <dong.aisheng@linaro.org>
>>
>> Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>
>
> Nack. =A0Several problems here. =A0First and foremost there isn't any
> description of *why* this change is needed or when it was removed.
Sorry i sent it too fast to eager to see people's comments on the main
issue of patch 6.
It should have description on what you pointed out.
It's needed by the patch 6 in this series that it wants to find gpiochi=
p from
node then calculate the gpio number from device tree in a standard way.

> Any patch beyond the most trivial change needs to have a commit
> message the describes it.
>
> Second, of_node_to_gpiochip() is no longer a valid API because gpioli=
b
> now allows multiple gpiochips to use the same device tree node. =A0Se=
e
> commit 3d0f7cf0f "gpio: Adjust of_xlate API to support multiple GPIO
> chips" to see a description of why this was changed.
>
I noticed that of_node_to_gpiochip() is removed by that patch.
But i did not realized that this API was broken before.
After looking a bit more on the sample code of an banked gpio,
https://lkml.org/lkml/2012/5/18/51
it seems besides the gpio node, we also depend on controller specific
gpio .of_xlate function
to find the correct gpiochip in the same bank for the same node.
So it's correct that of_node_to_gpiochip() is broken now.

I may change it if we finally still find this API is needed.

Thanks for the review.

Regards
Dong Aisheng

>> ---
>> =A0drivers/gpio/gpiolib-of.c | =A0 11 +++++++++++
>> =A0include/linux/of_gpio.h =A0 | =A0 =A05 +++++
>> =A02 files changed, 16 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
>> index 8389d4a..b8010a9 100644
>> --- a/drivers/gpio/gpiolib-of.c
>> +++ b/drivers/gpio/gpiolib-of.c
>> @@ -234,3 +234,14 @@ void of_gpiochip_remove(struct gpio_chip *chip)
>> =A0 =A0 =A0 if (chip->of_node)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_node_put(chip->of_node);
>> =A0}
>> +
>> +/* Private function for resolving node pointer to gpio_chip */
>> +static int of_gpiochip_is_match(struct gpio_chip *chip, void *data)
>> +{
>> + =A0 =A0 return chip->of_node =3D=3D data;
>> +}
>> +
>> +struct gpio_chip *of_node_to_gpiochip(struct device_node *np)
>> +{
>> + =A0 =A0 return gpiochip_find(np, of_gpiochip_is_match);
>> +}
>> diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
>> index c454f57..880783b 100644
>> --- a/include/linux/of_gpio.h
>> +++ b/include/linux/of_gpio.h
>> @@ -61,6 +61,7 @@ extern void of_gpiochip_remove(struct gpio_chip *g=
c);
>> =A0extern int of_gpio_simple_xlate(struct gpio_chip *gc,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const st=
ruct of_phandle_args *gpiospec,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 *fla=
gs);
>> +extern struct gpio_chip *of_node_to_gpiochip(struct device_node *np=
);
>>
>> =A0#else /* CONFIG_OF_GPIO */
>>
>> @@ -84,6 +85,10 @@ static inline int of_gpio_simple_xlate(struct gpi=
o_chip *gc,
>> =A0 =A0 =A0 return -ENOSYS;
>> =A0}
>>
>> +static struct gpio_chip *of_node_to_gpiochip(struct device_node *np=
)
>> +{
>> + =A0 =A0 return NULL;
>> +}
>> =A0static inline void of_gpiochip_add(struct gpio_chip *gc) { }
>> =A0static inline void of_gpiochip_remove(struct gpio_chip *gc) { }
>>
>> --
>> 1.7.0.4
>>
>>
>
> --
> Grant Likely, B.Sc, P.Eng.
> Secret Lab Technologies, Ltd.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
