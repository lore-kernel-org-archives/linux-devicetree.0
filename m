From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH 1/3] of: Add United Radiant Technology Corporation vendor
 prefix
Date: Tue, 19 Jan 2016 00:56:32 +0100
Message-ID: <569D7BB0.3070503@maciej.szmigiero.name>
References: <561587C9.2000207@maciej.szmigiero.name> <20151125150715.GA31460@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151125150715.GA31460@ulmo.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dri-devel@lists.freedesktop.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 25.11.2015 16:07, Thierry Reding wrote:
> On Wed, Oct 07, 2015 at 10:59:53PM +0200, Maciej S. Szmigiero wrote:
>> This adds vendor prefix for United Radiant Technology Corporation,
>> a provider of liquid crystal display technologies.
>>
>> Signed-off-by: Maciej Szmigiero <mail@maciej.szmigiero.name>
>> ---
>>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> index 82d2ac9..01e3cee 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> @@ -223,6 +223,7 @@ toshiba	Toshiba Corporation
>>  toumaz	Toumaz
>>  tplink	TP-LINK Technologies Co., Ltd.
>>  truly	Truly Semiconductors Limited
>> +urt	United Radiant Technology Corporation
>>  usi	Universal Scientific Industrial Co., Ltd.
>>  v3	V3 Semiconductor
>>  variscite	Variscite Ltd.
> 
> Hi Rob,
> 
> Acked-by on this?
> 
> Thierry

Is it possible to get ack/nak on this prefix?

This change has been pending since last October...

Best regards,
Maciej Szmigiero
