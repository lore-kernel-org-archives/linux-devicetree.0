From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: allwinner: a64: bananapi-m64:
 add usb otg
Date: Thu, 7 Dec 2017 14:26:43 +0800
Message-ID: <CAGb2v67dh=dfPKdDOwfj8m7qmUk-=s4kXS3FvZLczskrjbr7eQ@mail.gmail.com>
References: <1512582664-24936-1-git-send-email-jagan@amarulasolutions.com>
 <CAGb2v67uFnV+m1Ub7rFVGhkv0HKD4ukpQFtJ1pqRi2vf4F=tFA@mail.gmail.com> <CAD6G_RR-VccHjdrXs55=C50OvDEr96c7axtbR0eKp2THFNx6sg@mail.gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBPN6UPIQKGQEAHMU43A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAD6G_RR-VccHjdrXs55=C50OvDEr96c7axtbR0eKp2THFNx6sg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 7, 2017 at 2:18 PM, Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Dec 7, 2017 at 8:54 AM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>> On Thu, Dec 7, 2017 at 1:51 AM, Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> usb otg on bananapi-m64 has configured with USB-ID with PH9
>>> and USB-DRVVBUS attached with dcdc1 regulatort.
>>
>> That is not how you read the schematic...
>>
>> Intersecting lines that are tied together will have a dot representing
>> the connection. The DCDC1 line is a pull-up for the ID pin. This is very
>> clear because it has a resistor connected in series.
>>
>> VBUS for OTG is controlled by the IC displayed to the right in the
>> schematic, which is powered from 5V, and controlled by the DRVVBUS
>> pin from the PMIC. Please take a look at how the A31/A33/A83T board
>> dts files represent this.
>
> This is where I confused, USB-DRVVBUS is connected to pin 51 of PMIC
> if we add 5v regulator how can configure gpio number for this? I saw

>From the axp20x bindings:

- x-powers,drive-vbus-en: boolean, set this when the N_VBUSEN pin is
                          used as an output pin to control an external
                          regulator to drive the OTG VBus, rather then
                          as an input pin which signals whether the
                          board is driving OTG VBus or not.
                          (axp221 / axp223 / axp813 only)

Setting this allows you to use the "drivevbus" regulator under the PMIC.
As I said, look at how other boards are doing it.

> sun8i-a33-olinuxino.dts which is also similar but it has gpio = <&pio
> 1 9 GPIO_ACTIVE_HIGH>;

I have no idea where you saw this. It does not exist in my tree.

Why don't you just trace backwards from the usb0_vbus-supply property
under the usbphy node, and see where it all leads.

ChenYu
