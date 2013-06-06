From: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: pxa27x and pinctrl-single
Date: Fri, 7 Jun 2013 07:58:49 +0800
Message-ID: <CAD6h2NSRCti57NZtw0wzE8Th65_3Y8Dkz5zGsbnA2SUPYS263Q@mail.gmail.com>
References: <51AF7404.3090003@newsguy.com>
 <CAD6h2NTu9-E=Xy8zz5cgDdk5W4ShM9-B+p+gQtiA_HASQ7AEuQ@mail.gmail.com>
 <51B0C7E8.5090308@newsguy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51B0C7E8.5090308-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org>
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
To: Mike Dunn <mikedunn-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org>
Cc: "Manjunathappa, Prakash" <prakash.pm-l0cyMroinI0@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 7 June 2013 01:33, Mike Dunn <mikedunn-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org> wrote:
> Thanks for the reply Haojian.
>
> On 06/05/2013 05:43 PM, Haojian Zhuang wrote:
>> On 6 June 2013 01:23, Mike Dunn <mikedunn-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org> wrote:
>>> Hi,
>>>
>>> I'd like to start converting to device tree usage some of the old pxa27x
>>> platforms I'm fond of, starting with adding pinctrl support.  If I'm not
>>> mistaken, this will clear the way for some ongoing updates to the pinct=
rl/gpio
>>> code used by newer Marvell arches.
>>>
>>> I noticed that Haojian pulled the pinctrl-pxa driver from the kernel, i=
n favor
>>> of using pinctrl-single, so I turned my attention to that.  From what I=
 can
>>> tell, pinctrl-single is currently inadequate for pxa27x because:
>>>
>>> (1) On the pxa27x, setting the mux for a pin involves configuring both =
the alt
>>> function register *and* the direction register, requiring the ability t=
o specify
>>> in the device tree multiple reg/value pairs for each pin.
>> In PXA27x, GPIO controller control both GPIO & pin alternate function. T=
he
>> alternate function is covered by GAFRx registers.
>>
>> At first, we need to move GAFRx from gpio-pxa driver. Then we can support
>
>
> Thanks... I wondered about division of labor between pinctrl and gpio.  P=
inctrl
> did seem to be the appropriate place.
>
>
>> it by pinctrl-single driver since pinctrl-single driver could support mu=
litple
>> pins in one pin registers. There's "bits-per-mux" property in pinctrl-si=
ngle
>> driver.
>
>
> Yes, but currently pinctrl-single only supports writing one register for =
a given
> pin (with multiple pins sharing a register if bit-per-mux=3D=3Dtrue).  On=
 pxa27x, a
> pin's alt function is determined by the values written to both the GAFRx =
and the
> GPDRx registers, so I think that pinctrl-single may need to allow a devic=
e tree
> to specify multiple reg/value/mask sets for any one pin.  I don't have a
> pxa3xx/mmp developer's manual handy, but from the code it appears that on=
 these
> arches the direction register is irrelevant to the mux setting.
>

No, it's not need to access both GAFRx & GPDRx. Let's focus on PXA27x first.

GPIO =91x=92 Alternate Function Select Bits (where x =3D 112 through 120)
A bit-pair in this register determines the corresponding GPIO pin=92s
functionality as one of the alternate functions that is mapped to it or as a
generic GPIO pin.

0b00 =3D The corresponding GPIO pin (GPIO<x>) is used as a general-
purpose I/O.
0b01 =3D The corresponding GPIO pin (GPIO<x>) is used for its alternate
function 1.
0b10 =3D The corresponding GPIO pin (GPIO<x>) is used for its alternate
function 2.
0b11 =3D The corresponding GPIO pin (GPIO<x>) is used for its alternate
function 3.

We can see that GAFRx configures the pinmux. That's all. We can use
pinctrl-single
driver to cover this.

I know that you're also talking the implementation in gpio-pxa driver.
__gpio_is_occupied() checks both GAFRx & GPDRx. Because this GPIO
pin should be configured as GPIO input. Actually we could also discard the
checking.

So there's no relationship between GAFRx and GPDRx. And "inverted" GPIO
pins only exists in PXA26x. This "inverted" means that GPDR bits should
also be inverted.

Regards
Haojian
