From: Daniel Drake <dsd@laptop.org>
Subject: Re: [PATCH] of/pdt: allow DT device matching by fixing 'name' brokenness
Date: Wed, 23 Feb 2011 20:06:47 +0000
Message-ID: <AANLkTi=D1eWGsN4JVWEGeHp3AXfpbOOKr9Fq7juGAXtT@mail.gmail.com>
References: <20110216222820.487AE9D401C@zog.reactivated.net>
	<1297896277.3011.5.camel@macbook.infradead.org>
	<AANLkTikAF2X1A5jfoNfCPRhZkZ7qPdZ57c8B5b9z4+qr@mail.gmail.com>
	<20110218190659.7f955e4c@queued.net>
	<20110223194352.GR14597@angua.secretlab.ca>
	<20110223115414.547b8c17@queued.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20110223115414.547b8c17@queued.net>
Sender: sparclinux-owner@vger.kernel.org
To: Andres Salomon <dilinger@queued.net>
Cc: Grant Likely <grant.likely@secretlab.ca>, David Woodhouse <dwmw2@infradead.org>, cbou@mail.ru, linux-kernel@vger.kernel.org, x86@kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, dmitry.torokhov@gmail.com, devicetree-discuss@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 23 February 2011 19:54, Andres Salomon <dilinger@queued.net> wrote:
>> Wait; why are you binding to a device based on name? =A0Binding by n=
ame
>> and/or device_type is strongly discouraged for new code. =A0Use
>> compatible instead.
>>
>
> Daniel posted a separate patch showing his code, would you mind
> commenting on that? =A0I noticed he didn't cc you though, here's the
> patch:
>
> https://patchwork.kernel.org/patch/574901/

It does bind to the name.
We don't currently have a compatible property for the battery device.
We could fix that with a firmware upgrade, but it would break
compatibility with all existing installs. I guess this is still the
recommended approach...

Daniel
--
To unsubscribe from this list: send the line "unsubscribe sparclinux" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
