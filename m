From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH] dt-bindings: Add vendor prefix for Avnet, Inc.
Date: Tue, 8 May 2018 14:15:20 +0200
Message-ID: <933bb0a1-2ea2-3f23-492e-56805a804300@suse.de>
References: <d860eb7551e343fa59b77fd3e144a633186a8378.1525249073.git.michal.simek@xilinx.com>
 <20180507204937.GA21052@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180507204937.GA21052@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org, David Lechner <david@lechnology.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, SZ Lin <sz.lin@moxa.com>
List-Id: devicetree@vger.kernel.org

Hi Michal,

Am 07.05.2018 um 22:49 schrieb Rob Herring:
> On Wed, May 02, 2018 at 10:17:57AM +0200, Michal Simek wrote:
>> "Avnet, Inc. is one of the world's largest distributors of electronic
>> components and embedded solutions." - Wikipedia.org
>>
>> Website: www.avnet.com
>>
>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>> ---
>>
>>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>  1 file changed, 1 insertion(+)
> 
> Applied.

What is this standalone patch needed for? Looks fine, but it doesn't
appear to be part of a series using it - is it for board compatibles?

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
