From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] dt-bindings: net: dwmac: fix 'mac-mode' type
Date: Fri, 20 Sep 2019 20:02:58 -0700
Message-ID: <f189cdbc-b399-7700-a39a-ba185df4af49@gmail.com>
References: <20190917103052.13456-1-alexandru.ardelean@analog.com>
 <20190920181141.52cfee67@cakuba.netronome.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190920181141.52cfee67@cakuba.netronome.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Jakub Kicinski <jakub.kicinski@netronome.com>, Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, peppe.cavallaro@st.com, alexandre.torgue@st.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org



On 9/20/2019 6:11 PM, Jakub Kicinski wrote:
> On Tue, 17 Sep 2019 13:30:52 +0300, Alexandru Ardelean wrote:
>> The 'mac-mode' property is similar to 'phy-mode' and 'phy-connection-type',
>> which are enums of mode strings.
>>
>> The 'dwmac' driver supports almost all modes declared in the 'phy-mode'
>> enum (except for 1 or 2). But in general, there may be a case where
>> 'mac-mode' becomes more generic and is moved as part of phylib or netdev.
>>
>> In any case, the 'mac-mode' field should be made an enum, and it also makes
>> sense to just reference the 'phy-connection-type' from
>> 'ethernet-controller.yaml'. That will also make it more future-proof for new
>> modes.
>>
>> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> 
> Applied, thank you!
> 
> FWIW I had to add the Fixes tag by hand, either ozlabs patchwork or my
> git-pw doesn't have the automagic handling there, yet.

AFAICT the ozlabs patchwork instance does not do it, but if you have
patchwork administrative rights (the jango administration panel I mean)
then it is simple to add the regular expression to the list of tags that
patchwork already recognized. Had tried getting that included by
default, but it also counted all of those tags and therefore was not
particularly fine grained:

https://lists.ozlabs.org/pipermail/patchwork/2017-January/003910.html
-- 
Florian
