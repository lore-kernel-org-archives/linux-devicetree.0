From: Ivo Sieben <meltedpianoman@gmail.com>
Subject: Re: [PATCH v2] eeprom: at25: Add DT support for EEPROMs with odd
 address bits
Date: Wed, 13 Dec 2017 11:37:27 +0100
Message-ID: <CAMSQXEFD5B+J0=jLKss1Bq=PmyAv=ZJH50pg6DtBi4tTE53S_g@mail.gmail.com>
References: <1512740801-21142-1-git-send-email-geert+renesas@glider.be> <20171212205439.ijhvzmsumiu3l5pp@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171212205439.ijhvzmsumiu3l5pp@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

2017-12-12 21:54 GMT+01:00 Rob Herring <robh@kernel.org>:
> On Fri, Dec 08, 2017 at 02:46:41PM +0100, Geert Uytterhoeven wrote:
>> Certain EEPROMS have a size that is larger than the number of address
>> bytes would allow, and store the MSB of the address in bit 3 of the
>> instruction byte.
>>
>> This can be described in platform data using EE_INSTR_BIT3_IS_ADDR, or
>> in DT using the obsolete legacy "at25,addr-mode" property.
>> But currently there exists no non-deprecated way to describe this in DT.
>>
>> Hence extend the existing "address-width" DT property to allow
>> specifying 9 address bits, and enable support for that in the driver.
>>
>> This has been tested with a Microchip 25LC040A.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> v2:
>>   - Do not consider odd address widths of 17 or 25 bits,
>>   - Move handling inside the switch() statement.
>> ---
>>  Documentation/devicetree/bindings/eeprom/at25.txt | 4 +++-
>>  drivers/misc/eeprom/at25.c                        | 3 +++
>>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Ivo Sieben <meltedpianoman@gmail.com>
