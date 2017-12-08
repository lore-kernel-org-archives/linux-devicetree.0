From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] dt-bindings: at24/eeprom: add an undocumented compatible string
Date: Fri, 8 Dec 2017 01:03:56 +0100
Message-ID: <CABxcv=mRfYTs0YPvFg5_T+PVdjnK2BgXe-_b6MVQ=UkSWrV6xw@mail.gmail.com>
References: <20171206101219.14011-1-brgl@bgdev.pl> <20171207225045.tm3rnyjaylx46nxy@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171207225045.tm3rnyjaylx46nxy@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Mark Rutland <mark.rutland@arm.com>, Wolfram Sang <wsa@the-dreams.de>, Divagar Mohandass <divagar.mohandass@intel.com>, David Lechner <david@lechnology.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Rob and Bartosz,

On Thu, Dec 7, 2017 at 11:50 PM, Rob Herring <robh@kernel.org> wrote:
> On Wed, Dec 06, 2017 at 11:12:19AM +0100, Bartosz Golaszewski wrote:
>> The "atmel,sdp" compatible is reported by checkpatch as undocumented.
>>
>> Add it to the device tree bindings document for at24.
>>
>> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>> ---
>>  Documentation/devicetree/bindings/eeprom/eeprom.txt | 2 ++
>>  1 file changed, 2 insertions(+)
>
> Reviewed-by: Rob Herring <robh@kernel.org>

My understanding is that DT bindings not necessarily have to list all
the possible compatible strings but can also document a set
comprehension of the possible values. If that's the case, then I
disagree with this patch and I think that this is caused by a
checkpatch limitation.

In the case of the Atmel EEPROM DT binding, it was quite lax at
describing the possible compatible strings. It just used to say:

- compatible : should be "<manufacturer>,<type>", like these:

Followed by a list of _possible_ compatible strings. So these were
just examples, it was by no means a comprehensive list.

And then it used to say:

If there is no specific driver for <manufacturer>, a generic driver
based on <type> is selected. Possible types are:
"24c00", "24c01", "24c02", "24c04", "24c08", "24c16", "24c32",
"24c64", "24c128", "24c256", "24c512", "24c1024", "spd"

Which basically said that it was valid to only match using the device
model but not the vendor part of the compatible string. This is
obviously incorrect and only worked due a implementation detail in the
I2C core.

After some discussions, the DT binding was changed to say the following:

If there is no specific driver for <manufacturer>, a generic device
with <type> and manufacturer "atmel" should be used. Possible types
are:
"24c00", "24c01", "24c02", "24c04", "24c08", "24c16", "24c32",
"24c64", "24c128", "24c256", "24c512", "24c1024", "spd"

And the driver changed accordingly to honor these. Old DTBs just using
"24c08" or "microchip,24c08" should still work, but the correct thing
to do now is to use "atmel,24c08".

The "spd" <type> is in the list mentioned above, so the "atmel,spd"
isn't documented as the $SUBJECT commit message says. In any case,
what could be done is to instead reword the DT binding to list all the
valid "atmel,<type>" combinations.

I didn't do that in my patch since it originally said "Possibles types
are", not "all the possible types are" so it wasn't clear to me if
there were other undocumented <types> that were still valid.

Best regards,
Javier
