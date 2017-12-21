From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH V2 9/9] ARM: dts: stm32: add initial support of
 stm32mp157c eval board
Date: Thu, 21 Dec 2017 11:44:55 +0100
Message-ID: <33a7afc4-9282-5359-1f80-ef9f3da93c38@st.com>
References: <1513610272-7824-1-git-send-email-ludovic.Barre@st.com>
 <1513610272-7824-10-git-send-email-ludovic.Barre@st.com>
 <CACRpkdZaEjdGB2k6HdPt1_E0jRXEimEUxT9NmMwMw7OiyeqGLA@mail.gmail.com>
 <27a339f7-33a7-eb73-27fe-9927838729d6@st.com>
 <CACRpkdYE+u1o_KDDihX7=7RLNDkkFDOCFsQtBKBZW0i6123ZoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdYE+u1o_KDDihX7=7RLNDkkFDOCFsQtBKBZW0i6123ZoQ@mail.gmail.com>
Content-Language: en-US
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Gerald Baeza <gerald.baeza@st.com>, Ludovic Barre <ludovic.Barre@st.com>
List-Id: devicetree@vger.kernel.org



On 12/21/2017 10:18 AM, Linus Walleij wrote:
> On Wed, Dec 20, 2017 at 10:19 AM, Alexandre Torgue
> <alexandre.torgue@st.com> wrote:
>> On 12/20/2017 08:44 AM, Linus Walleij wrote:
> 
>>> gpio-line-names = "foo", "bar" ...;
>>>
>>> See for example
>>> arch/arm/boot/dts/bcm2835-rpi-a.dts
>>> arch/arm/boot/dts/ste-snowball.dts
> (...)
>>
>> It looks like useful for pins used as gpio line. Are you saying that we also
>> have to describe pins used as Alternate Function ?
> 
> No. The use of the names is up to the platform maintainer (you),
> leaving a blank string for non-GPIO lines is just fine.
> 
> Some platforms add the name of the actual function used by the
> line on the design, if it is not GPIO, sometimes something in
> brachets like "[i2c0-SDA]" that says what it is used for and explains
> why you can't use it for GPIO on this setup.
> 
> But just leaving it blank is just as good.

Ok thanks Linus. I will take it into account. It could be useful to add 
it for MCU and future MPU boards.

Regards
Alex


> 
> Yours,
> Linus Walleij
> 
