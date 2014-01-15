From: srinivas kandagatla <srinivas.kandagatla@st.com>
Subject: Re: [PATCH v1 3/5] pinctrl: st: Add software edge trigger interrupt
 support.
Date: Wed, 15 Jan 2014 14:44:22 +0000
Message-ID: <52D69EC6.8010705@st.com>
References: <1389711077-20949-1-git-send-email-srinivas.kandagatla@st.com> <1389711141-21090-1-git-send-email-srinivas.kandagatla@st.com> <CACRpkdbFGOm2xm5H+of_NuJ6DVmBDcEODZbDxVU8nGC-RU64Tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbFGOm2xm5H+of_NuJ6DVmBDcEODZbDxVU8nGC-RU64Tw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Thankyou for reviewing the patch.

On 15/01/14 14:27, Linus Walleij wrote:
> On Tue, Jan 14, 2014 at 3:52 PM,  <srinivas.kandagatla@st.com> wrote:
> 
>> From: Srinivas Kandagatla <srinivas.kandagatla@st.com>
>>
>> ST pin controller does not have hardware support for detecting edge
>> triggered interrupts, It only has level triggering support.
>> This patch attempts to fake up edge triggers from hw level trigger
>> support in software. With this facility now the gpios can be easily used
>> for keypads, otherwise it would be difficult for drivers like keypads to
>> work with level trigger interrupts.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@st.com>
> 
> Clever! Mostly I like the patch as it is but:
> 
>>         for_each_set_bit(n, &port_active, BITS_PER_LONG) {
>> +               /* check if we are detecting fake edges ... */
>> +               pin_edge_cfg = ST_IRQ_EDGE_CONF(bank_edge_mask, n);
>> +
>> +               if (pin_edge_cfg) {
>> +                       /* edge detection. */
>> +                       val = st_gpio_get(&bank->gpio_chip, n);
>> +                       if (val)
>> +                               writel(BIT(n), bank->base + REG_PIO_SET_PCOMP);
>> +                       else
>> +                               writel(BIT(n), bank->base + REG_PIO_CLR_PCOMP);
>> +
>> +                       if (pin_edge_cfg != ST_IRQ_EDGE_BOTH &&
>> +                               !((pin_edge_cfg & ST_IRQ_EDGE_FALLING) ^ val))
>> +                                       continue;
>> +               }
>> +
> 
> Please insert comments here to explain what you are actually doing
> because I sure as hell do not understand this code without comments
> describing the trick used.

I agree, I will document this logic in next version.

Thanks,
srini
> 
> Yours,
> Linus Walleij
> 
> 

