From: Dave Martin <dave.martin@linaro.org>
Subject: Re: [PATCH v2] pata-generic/of: Make probing via device tree non-powerpc-specific
Date: Mon, 19 Sep 2011 11:10:06 +0100
Message-ID: <CA+wbFdd6aVXkFokinxQ7KDUSDYo06K4mZq8gdZKUKj6gMXBn7A@mail.gmail.com>
References: <1316183890-13677-1-git-send-email-dave.martin@linaro.org>
	<1316190120-17010-1-git-send-email-dave.martin@linaro.org>
	<4E73C0FB.4030904@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-ide-owner@vger.kernel.org>
In-Reply-To: <4E73C0FB.4030904@gmail.com>
Sender: linux-ide-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, linux-ide@vger.kernel.org, Jeff Garzik <jgarzik@pobox.com>, linux-arm-kernel@lists.infradead.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 16, 2011 at 10:34 PM, Rob Herring <robherring2@gmail.com> w=
rote:
> Dave,
>
> On 09/16/2011 11:22 AM, Dave Martin wrote:
>> This patch enables device-tree-based probing of the pata-generic
>> platform driver across all architectures:
>>
>> =A0 * make the pata_of_generic module depend on OF instead of PPC_OF=
;
>> =A0 * supply some missing inclues;
>> =A0 * replace endianness-sensitive raw access to device tree data
>> =A0 =A0 with of_property_read_u32() calls.
>>
>> Signed-off-by: Dave Martin <dave.martin@linaro.org>
>> ---
>> v2: correct sense of the check of_property_read_u32(dn, "pio-mode",
>> &pio_mode). =A0Somehow I posted an old version of this patch, depite
>> having already fixed this...
>>
>> Tested on ARM Versatile Express, with my soon-to-be-posted device
>> tree support patches.
>>
>> I'm not in a position to build/test this for powerpc easily --
>> if anyone is able to do that, it would be appreciated.
>>
> Building just requires getting Codesourcery PPC toolchain...

True, but although I can try to build it, I don't have a PPC platform
to do the actual testing.

> You also have to be aware that you are enabling this for all OF-enabl=
ed
> arches which could break with an allyesconfig. So really you need spa=
rc,
> x86, mips, and microblaze, but a subset is probably sufficient.

=46air point.

Since this has now been superseded by Grant's patch anyway, I'll leave
it for others to judge.

Cheers
---Dave
