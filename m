From: Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v6 1/6] gpio: davinci: use readl/writel instead of __raw_*
Date: Tue, 26 Nov 2013 13:59:16 +0530
Message-ID: <CA+V-a8skgRAZFezzv3Tzi5Z1S4rMFt_sZ-RxH_UmpAQuTwifzA@mail.gmail.com>
References: <1385057731-4348-1-git-send-email-prabhakar.csengg@gmail.com>
 <1385057731-4348-2-git-send-email-prabhakar.csengg@gmail.com>
 <CAArO44vmfkroE9w4KviOhjkPvg9bTX9pAtr3oxYjD9u_wVZXeg@mail.gmail.com>
 <CA+V-a8sjmo2K16m9_6Zf1qwcez+qKm-9JW1Cb=Aj4prtXd=-fA@mail.gmail.com> <529327A8.8080909@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <529327A8.8080909@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: Taras Kondratiuk <taras.kondratiuk@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>, LKML <linux-kernel@vger.kernel.org>, DLOS <davinci-linux-open-source@linux.davincidsp.com>, LAK <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LDOC <linux-doc@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Sekhar,

On Mon, Nov 25, 2013 at 4:04 PM, Sekhar Nori <nsekhar@ti.com> wrote:
> Prabhakar,
>
> On Monday 25 November 2013 09:42 AM, Prabhakar Lad wrote:
>> Hi Taras,
>>
>> On Fri, Nov 22, 2013 at 3:38 PM, Taras Kondratiuk
>> <taras.kondratiuk@linaro.org> wrote:
>>> On 21 November 2013 20:15, Prabhakar Lad <prabhakar.csengg@gmail.com> wrote:
>>>> From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
>>>>
>>>> This patch replaces the __raw_readl/writel with
>>>> readl and writel, Altough the code runs on ARMv5
>>>> based SOCs, changing this will help copying the code
>>>> for other uses.
>>>
>>> This replacement has a functional impact: it adds memory barriers.
>>> Please note this in the description.
>>> Also please add a bit of explanation on why do you need to add barriers.
>>>
>> Agreed this adds memory barriers, I'll add a note about it.
>
> Well the barriers certainly make it easier to debug by having both
> device and memory accesses happen in program order. That said, if there
> is no pressing reason to add barriers, you can use
> {readl|writel}_relaxed() instead. That will make the code protable
> across endianess.
>
OK will use {readl|writel}_relaxed() instead.

Regards,
--Prabhakar Lad
