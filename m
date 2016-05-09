MIME-Version: 1.0
In-Reply-To: <CANEJEGu=QkYwrDeS08JdNaUis1aVpOs_xnZCdFmC4FHF8uSRHA@mail.gmail.com>
References: <1462295611-49684-1-git-send-email-grundler@chromium.org>
	<20160504135123.GA4567@rob-hp-laptop>
	<CANEJEGt1Ri7Q-g25U8_KTAb9Z8MfVWH0N5QLaLcdnDuF_wwrtw@mail.gmail.com>
	<572C61B1.2040508@atmel.com>
	<CAHHoo-j7145vPFNmJH=CvPu-BRCgRe0WNKH8QDkSc+c3koxHAQ@mail.gmail.com>
	<20160509162948.GA15535@dtor-ws>
	<CANEJEGu=QkYwrDeS08JdNaUis1aVpOs_xnZCdFmC4FHF8uSRHA@mail.gmail.com>
Date: Mon, 9 May 2016 11:51:25 -0500
Message-ID: <CAL_JsqJprQtjQOPZORS4ncqNgMYLHk36qZfcgNbeZ=qeunB_oQ@mail.gmail.com>
Subject: Re: Input: add Atmel Atmegaxx captouch driver
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Grant Grundler <grundler@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Daniel Hung-yu Wu <hywu@google.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-input <linux-input@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, LKML <linux-kernel@vger.kernel.org>, Linux DeviceTree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, May 9, 2016 at 11:44 AM, Grant Grundler <grundler@chromium.org> wrote:
> On Mon, May 9, 2016 at 9:29 AM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>> On Fri, May 06, 2016 at 11:14:12PM +0800, Daniel Hung-yu Wu wrote:
>>> The register set is different, and this chip does not support calibration.
>>> The I2C protocol is not the same as well; there is an additional byte
>>> indicating data length.
>>>
>>> Atmega88PA is a general-purpose MCU. In the future, we will add more
>>> functionalities, such as firmware upgrade through I2C.
>>
>> Is it Google who will be maintaining and extending the protocol or
>> Atmel? If it is Google then maybe we should switch compat string to
>> "google,captouch" or similar.
>
> My understanding was Atmel would extend the protocol to support FW update.
> No other extensions are planned.

Is the protocol version discoverable? If not then you have a more specific compatible string.

The compatible string here is really defining the function of the firmware. As long as the 
>
> cheers,
> grant
