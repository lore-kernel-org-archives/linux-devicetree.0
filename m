From: Vince Bridgers <vbridgers2013@gmail.com>
Subject: Re: [PATCH net v2 3/3] net: stmmac: Improve mcast/ucast filter for
 all Synopsys EMAC Configurations
Date: Mon, 30 Jun 2014 09:01:17 -0500
Message-ID: <CAOwfj2NGdVGd2iHfbF73U9Jc6VmFQSHfEm7Jevo5WyzYkrDX+A@mail.gmail.com>
References: <1404092110-18667-1-git-send-email-vbridgers2013@gmail.com>
	<1404092110-18667-4-git-send-email-vbridgers2013@gmail.com>
	<4380814.yCFVZiTZxJ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <4380814.yCFVZiTZxJ@wuerfel>
Sender: netdev-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Giuseppe CAVALLARO <peppe.cavallaro@st.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, "robh+dt@kernel.org" <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@altera.com>, David Miller <davem@davemloft.net>, Vince Bridgers <vbridger@altera.com>
List-Id: devicetree@vger.kernel.org

 Hi Arnd,

On Mon, Jun 30, 2014 at 1:46 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Sunday 29 June 2014 20:35:10 Vince Bridgers wrote:
>> The synopsys EMAC can be configured for different numbers of multicast hash
>> bins and perfect filter entries at device creation time and there's no way
>> to query this configuration information at runtime. As a result, a devicetree
>> parameter is required in order for the driver to program these filters
>> correctly for a particular device instance. This patch extends the current
>> driver by providing a different multicast filter programming function if
>> different than the currently supported 64 multicast hash bins and 32
>> perfect unicast addresses. This patch is required to correct multicast
>> filtering for the Altera Cyclone V SOC.
>>
>> Signed-off-by: Vince Bridgers <vbridgers2013@gmail.com>
>>
>
> No objections to the content of the patch, but it would be better to split
> it out into two separate patches: one that does the mechanical prototype
> and formatting changes, and a smaller one that actually introduces the
> functional change. That would make it much easier to review, and to bisect
> potential problems when something goes wrong.
>
>         Arnd

I'll make the suggested change and resubmit. Thank you for the suggestion.

All the best,

Vince
