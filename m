From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Update SERDES_MAX to be SERDES_MAX
 + 1
Date: Wed, 17 Oct 2018 17:45:13 +0200
Message-ID: <05c4811b-1d2b-c46f-bcde-2fbd650a301c@embeddedor.com>
References: <cover.1539036280.git.gustavo@embeddedor.com>
 <3a1a95a4832af33dcd1842b0298d257bbcf1f5ab.1539036280.git.gustavo@embeddedor.com>
 <20181009072723.mshyvplpo2xmkyfl@qschulz>
 <dab86dfb-d56b-b7c3-8e2a-6955803a2842@embeddedor.com>
 <20181017150931.GA385@bogus> <20181017152354.GA9268@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181017152354.GA9268@bogus>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Quentin Schulz <quentin.schulz@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 10/17/18 5:23 PM, Rob Herring wrote:

>>> Friendly ping. Who can you take this?
>>
>> Applied. No need (nor benefit) to ping me. You can check the status of 
>> DT patches on patchwork[1]. If it is there and in the "New" state, it is 
>> in my queue.
> 
> Actually, this doesn't apply to my tree as the file doesn't exist. It 
> needs to go thru the phy tree. You didn't Cc the maintainer nor list, so 
> resend.
> 

This is what I get when I run the get_maintainer script:

linux$ scripts/get_maintainer.pl --nokeywords --nogit --nogit-fallback include/dt-bindings/phy/phy-ocelot-serdes.h
Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Mark Rutland <mark.rutland@arm.com> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
linux-kernel@vger.kernel.org (open list)

But I'll send it to the phy guys as you suggest.

> Acked-by: Rob Herring <robh@kernel.org>
> 

Thanks
--
Gustavo
