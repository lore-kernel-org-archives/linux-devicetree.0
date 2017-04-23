From: Gilad Ben-Yossef <gilad@benyossef.com>
Subject: Re: [PATCH v2 1/9] staging: ccree: introduce CryptoCell HW driver
Date: Sun, 23 Apr 2017 12:38:05 +0300
Message-ID: <CAOtvUMebvRFwOFJh7CeesJOfjBuk8hKbEuZiRHaXNR-WtnrQzg@mail.gmail.com>
References: <1492693983-8175-1-git-send-email-gilad@benyossef.com>
 <1492693983-8175-2-git-send-email-gilad@benyossef.com> <20170420133308.GB8998@kroah.com>
 <CAOtvUMdH-=VrSS0wYUv99n=67WH53EyPfaby7kDhmgJk05C8gQ@mail.gmail.com> <20170420140103.GA20172@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <20170420140103.GA20172@kroah.com>
Sender: linux-crypto-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org, Herbert Xu <herbert@gondor.apana.org.au>, Binoy Jayan <binoy.jayan@linaro.org>, Gilad Ben-Yossef <gilad.benyossef@arm.com>, Linux kernel mailing list <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org, Ofir Drang <ofir.drang@arm.com>, "David S. Miller" <davem@davemloft.net>, Stuart Yoder <stuart.yoder@arm.com>
List-Id: devicetree@vger.kernel.org

Hi,

[ Re sending with all recipients this time ... ]

On Thu, Apr 20, 2017 at 5:01 PM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:

>> > Oh, I have to ask, do you really mean "any later version" here and
>> > elsewhere?
>> >
>> > If so, then your MODULE_LICENSE() marking is wrong, please fix that up,
>> > or fix up the license text, I can't take incompatible ones without
>> > getting angry emails from legal people sent to me...
>> >
>>
>> Thanks for noticing this.
>>
>> The copyright + license notice is a boilerplate I got from the powers
>> that be here.
>>
>> I'll consult internally what is the proper action. I don't want to
>> make legal mad either... :-)
>
> Ok, I'll drop this patch series then, and wait for an updated one with
> this fixed up.

This issue, along with some others pointed by reviewers, are fixed in
v3 of the patch set.

I will be happy if you choose to take it into the staging tree and
will continue to work to cut down the TODO list.

Thanks,
Gilad

-- 
Gilad Ben-Yossef
Chief Coffee Drinker

"If you take a class in large-scale robotics, can you end up in a
situation where the homework eats your dog?"
 -- Jean-Baptiste Queru
