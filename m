From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] gpio: Add gpio driver support for ThunderX and OCTEON-TX
Date: Wed, 11 Jan 2017 16:07:24 +0100
Message-ID: <CACRpkdYDM4EnyumV0_Sq+_QWq=mBRMEFayb5E+ZycYnrfuxcKA@mail.gmail.com>
References: <1483744980-25898-1-git-send-email-ddaney.cavm@gmail.com>
 <1483744980-25898-3-git-send-email-ddaney.cavm@gmail.com> <CACRpkdaOQM7=mDTA1K92N5P=jjaCyhsSw5DGL+bnXE_GOYw82Q@mail.gmail.com>
 <245af7b3-cfb7-e606-f1b8-f68b2ec0b8d1@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <245af7b3-cfb7-e606-f1b8-f68b2ec0b8d1@caviumnetworks.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: David Daney <ddaney.cavm@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Daney <david.daney@cavium.com>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 9, 2017 at 9:02 PM, David Daney <ddaney@caviumnetworks.com> wrote:

>> if (test_bit(line, gpio->invert_mask))
>>    return !(read_bits & BIT(bank_bit));
>> else
>>    return !!(read_bits & BIT(bank_bit));
>>
>> OK maybe not much clearer but seems clearer to me.
>
> As I really dislike the "!!" idiom, would you settle for:
>
>  if (test_bit(line, gpio->invert_mask))
>     return (read_bits & BIT(bank_bit)) == 0;
>  else
>     return (read_bits & BIT(bank_bit)) != 0;

Not the biggest issue in the world. But I maintain a huge stack
of GPIO drivers and it drives me crazy that each one has to bear
the mark of the authors habits rather than mine.

>> I think this is overkill. Use hierarchical irqdomain.
>
> I will look into it.  I suspect it will require more lines of driver code to
> implement it than what I have here (that does actually work).

I understand. But at the same time, the kernel needs to have the
right idea of what it is dealing with here.

The generic IRQ handling code will take a shorter fastpath if
you are using hierarchical irqdomain (I think?) but I can't claim
to be an expert. When in doubt, consult Marc Z.

Yours,
Linus Walleij
