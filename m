From: srinivas kandagatla <srinivas.kandagatla@st.com>
Subject: Re: [PATCH 1/4] ARM: STi: add stid127 soc support
Date: Wed, 5 Feb 2014 11:48:24 +0000
Message-ID: <52F22508.7080706@st.com>
References: <1391093744-19905-1-git-send-email-patrice.chotard@st.com> <201401301939.08302.arnd@arndb.de> <52EB96BB.6070800@st.com> <201401312115.33731.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201401312115.33731.arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, kernel@stlinux.com, Linus Walleij <linus.walleij@linaro.org>, Patrice CHOTARD <patrice.chotard@st.com>, linux-kernel@vger.kernel.org, Stuart Menefy <stuart.menefy@st.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, maxime.coquelin@st.com, alexandre.torgue@st.com
List-Id: devicetree@vger.kernel.org

Hi Arnd,
On 31/01/14 20:15, Arnd Bergmann wrote:
> On Friday 31 January 2014, srinivas kandagatla wrote:
> 
>>> Sorry if I missed the initial review, but can you explain
>>> why this is needed to start with?
>>
>> On ST SoCs the default value for L2 AUX_CTRL register is 0x0, so we  set
>> the way-size explicit here.
> 
> Unfortunately, we keep going back and forth on the L2 cache controller
> setup between "it should work automatically" and "we don't want to
> have configuration data in DT", where my personal opinion is that
> the first one is more important here.
> 
> Now, there are a couple of properties that are defined in
> Documentation/devicetree/bindings/arm/l2cc.txt to let some of the
> things get set up automatically already. Can you check which bits
> are missing there, if any? Are they better described as "configuration"
> or "hardware" settings?

Currently l2cc bindings has few optional properties like.

- arm,data-latency
- arm,tag-latency
- arm,dirty-latency
- arm,filter-ranges
- interrupts :
- cache-id-part:
- wt-override:

These does not include properties to set "way-size", "associativity",
"enabling prefetching", "Prefetch drop enable", "prefetch offset",
"Double linefill" and few more in prefect control register and
aux-control register.

This is not just a issue with STi SOCs, having a quick look, I can see
that few more SOCs have similar requirements to set these properties.

We could do two things to get l2 setup automatically on STi SOCS.

1> Either define these properties case-by-case basic, which might be
useful for other SOCs too.

2> Or Add new compatible string for STi SoCs so that they can
automatically setup these values in cache-l2x0.c

Am Ok with either approaches.


Thanks,
srini


> 
> 	Arnd
> 
> 
