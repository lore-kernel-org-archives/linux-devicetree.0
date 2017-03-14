From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Subject: Re: [PATCH v2 4/6] bus: add driver for the Technologic Systems NBUS
Date: Tue, 14 Mar 2017 11:40:08 -0400
Message-ID: <07e0e4b2-36a5-a37e-ea04-d05158d11fba@savoirfairelinux.com>
References: <20170203194729.20995-1-sebastien.bourdelin@savoirfairelinux.com>
 <20170203194729.20995-5-sebastien.bourdelin@savoirfairelinux.com>
 <CACRpkdYfGmVBYgAc4KZGN6634WM_EyzNj_SBbALEs4WYipXRQA@mail.gmail.com>
 <82dfdbb8-58fc-45b4-685c-98be11341e45@savoirfairelinux.com>
 <CACRpkdbjANV+kiO_W9+=OL=fzPtTVwH2CpWDmNa50t3JaHTFkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdbjANV+kiO_W9+=OL=fzPtTVwH2CpWDmNa50t3JaHTFkQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will.deacon@arm.com>, kris@embeddedarm.com, Masahiro Yamada <yamada.masahiro@socionext.com>, Wim Van Sebroeck <wim@iguana.be>, Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, damien.riegel@savoirfairelinux.com, Russell King <linux@armlinux.org.uk>, Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>, Guenter Roeck <linux@roeck-us.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, "Suzuki K. Poulose" <suzuki.poulose@arm.com>, Lucile Quirion <lucile.quirion@savoirfairelinux.com>, Fabio Estevam <fabio.estevam@nxp.com>, kernel <kernel@savoirfairelinux.com>, Simon Horman <horms+renesas@verge.net.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mark Featherston <mark@embedded>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On 03/14/2017 09:23 AM, Linus Walleij wrote:
> On Wed, Feb 22, 2017 at 5:56 PM, Sebastien Bourdelin
> <sebastien.bourdelin@savoirfairelinux.com> wrote:
>> On 02/04/2017 05:14 AM, Linus Walleij wrote:
> 
>>>> +       gpiod_set_array_value_cansleep(gpios->ndescs, gpios->desc, values);
>>>
>>> This can also fail and you should check the return code and print an error
>>> message if it does.
>>>
>> As far as i understood, the "gpiod_set_array_value_cansleep(...)"
>> function doesn't return
>> anything, it will return immediately if gpios->desc is null but nothing
>> else.
>> Did i miss something?
> 
> No I did, sorry about that.
> 
> We *should* make these functions return errors but currently they do not.
> 
Ok got it.
Thanks!

>>> Error codes?
>>>
>> Same question here, these functions only make call to
>> "gpiod_set_value_cansleep(...)",
>> which as far as i understood doesn't return any error code.
> 
> Yeah, forget that.
> 
Ok.

>>>> +               gpiod_set_value_cansleep(ts_nbus->csn, 1);
>>>
>>> Here too.
>>>
>> Same question, doesn't seem to have an error code.
> 
> That too.
>
Ok.

> Yours,
> Linus Walleij
> 

Best regards,
Sebastien Bourdelin.
