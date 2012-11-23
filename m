From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] of/address: sparc: Declare of_iomap as an extern function for sparc again
Date: Fri, 23 Nov 2012 23:34:20 +0000
Message-ID: <61dbc2ab-5fa4-4095-bbba-11f146ad89a5@email.android.com>
References: <1353669849-23697-1-git-send-email-andreas@gaisler.com> <20121123.142110.835354734152648777.davem@davemloft.net> <20121123215947.02DDC3E1EC4@localhost>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121123215947.02DDC3E1EC4@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, andreas@gaisler.com
Cc: sam@ravnborg.org, rob.herring@calxeda.com, sparclinux@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, software@gaisler.com, stable <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Cc'ing stable since this should go into previous kernels too.

g.


Grant Likely <grant.likely@secretlab.ca> wrote:

>On Fri, 23 Nov 2012 14:21:10 -0500 (EST), David Miller
><davem@davemloft.net> wrote:
>> From: Andreas Larsson <andreas@gaisler.com>
>> Date: Fri, 23 Nov 2012 12:24:09 +0100
>> 
>> > This bug-fix makes sure that of_iomap is defined extern for sparc
>so that the
>> > sparc-specific implementation of_iomap is once again used when
>including
>> > include/linux/of_address.h in a sparc context. OF_GPIO that is now
>available for
>> > sparc relies on this.
>> > 
>> > The bug was inadvertently introduced in a850a75, "of/address: add
>empty static
>> > inlines for !CONFIG_OF", that added a static dummy inline for
>of_iomap when
>> > !CONFIG_OF_ADDRESS. However, CONFIG_OF_ADDRESS is never defined for
>sparc, but
>> > there is a sparc-specific implementation
>/arch/sparc/kernel/of_device_common.c.
>> > 
>> > This fix takes the same approach as 0bce04b that solved the
>equivalent problem
>> > for of_address_to_resource.
>> > 
>> > Signed-off-by: Andreas Larsson <andreas@gaisler.com>
>> 
>> Grant, can you possibly merge this to Linus while I'm travelling?
>> That would help me a lot.
>
>Yup, I'm doing it right now.
>
>g.

-- 
Grant Likely, P.Eng.
Secret Lab Technologies Ltd.
