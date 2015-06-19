From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH v2 3/5] extcon: arizona: Convert to gpiod
Date: Fri, 19 Jun 2015 18:50:03 +0900
Message-ID: <CAGTfZH3RWaSGKM66dp1YeLivPq504mys-xnBFJ56ob_qWZ03nA@mail.gmail.com>
References: <1434638631-16451-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
	<1434638631-16451-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
	<CAGTfZH0AsRwcFwevAiQeyL=VUxiCvCx+3OEFKQ4nV3DpRdsdoQ@mail.gmail.com>
	<20150619081433.GR32730@opensource.wolfsonmicro.com>
	<CAGTfZH3USsR5AVQn2UMBH_y-25nsXBw3cdjBLbEiRWJu7Q+Tsg@mail.gmail.com>
	<20150619091349.GU32730@opensource.wolfsonmicro.com>
Reply-To: cw00.choi@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150619091349.GU32730@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Lee Jones <lee.jones@linaro.org>, "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Fri, Jun 19, 2015 at 6:13 PM, Charles Keepax
<ckeepax@opensource.wolfsonmicro.com> wrote:
> On Fri, Jun 19, 2015 at 05:39:22PM +0900, Chanwoo Choi wrote:
>> On Fri, Jun 19, 2015 at 5:14 PM, Charles Keepax
>> <ckeepax@opensource.wolfsonmicro.com> wrote:
>> > On Fri, Jun 19, 2015 at 11:36:47AM +0900, Chanwoo Choi wrote:
>> >> Hi Charles,
>> >>
>> >> On Thu, Jun 18, 2015 at 11:43 PM, Charles Keepax
>> >> <ckeepax@opensource.wolfsonmicro.com> wrote:
>> >> > Convert to using the newer gpiod interface for the micd_pol_gpio.
>> >> > Although we still carry support for the old gpio interface from pdata.
>> >> >
>> >> > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
>> >> > ---
>> >> > +                       mode = GPIOD_OUT_HIGH;
>> >> > +               else
>> >> > +                       mode = GPIOD_OUT_LOW;
>> >> > +
>> >> > +               info->micd_pol_gpio = gpiod_get_optional(arizona->dev,
>> >> > +                                                        "wlf,micd-pol",
>> >> > +                                                        GPIOD_OUT_LOW);
>> >>
>> >> You can use the devm_gpiod_get_optional() to manage the system
>> >> resource automatically.
>> >>
>> >
>> > We can't actually use the devm call here, we need to pass
>> > arizona->dev as that is where the DT will reside, which is the
>> > device for the MFD. But if the devm is attached to the device for
>> > the MFD then it will not clear up when the extcon driver is
>> > unloaded. As such we have to do the put manually.
>> >
>> > I will look at respinning for the other comments.
>>
>> I don't understand. extcon-arizona.c used already following devm_* functions:
>> - devm_kzalloc()
>> - devm_regulator_get()
>> - devm_extcon_dev_*()
>> - devm_input_allocate_device()
>> - devm_gpio_request_one()
>
> Yes but if you look at those all of those are against &pdev->dev
> which is the extcon device.
>
> The gpiod interface expects the device passed to both contain
> the of_node and be used for the devm operations. But we need to
> use the extcon device for the devm operations, but the of_node is
> contained on the MFD device.
>
> So if I do:
>
> devm_gpiod_get_optional(arizona->dev, ....
>
> Then the gpiod won't be released when the extcon device is
> removed. But if I do:
>
> devm_gpiod_get_optional(&pdev->dev, ....
>
> Then it won't be able to find the DT entries.

I understand the difference between arizona->dev and &pdev->dev.

But, extcon-arizona.c already get the instance of regulator by using
devm_regulator_get() with &pdev->dev as following:
The devm_regulator_get() can find the DT entry in dts file.
                 info->micvdd = devm_regulator_get(&pdev-dev, "MICVDD");

How did extcon-arizona.c get the instance of regulator throught
devm_regulator_get() in dts file?
