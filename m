From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH] dt-bindings: Add vendor prefix for Avnet, Inc.
Date: Wed, 9 May 2018 08:22:34 +0200
Message-ID: <47d7a8d3-ea6e-200d-2426-d0fe3671196a@xilinx.com>
References: <d860eb7551e343fa59b77fd3e144a633186a8378.1525249073.git.michal.simek@xilinx.com>
 <20180507204937.GA21052@rob-hp-laptop>
 <933bb0a1-2ea2-3f23-492e-56805a804300@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <933bb0a1-2ea2-3f23-492e-56805a804300@suse.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, Rob Herring <robh@kernel.org>, Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org, David Lechner <david@lechnology.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, SZ Lin <sz.lin@moxa.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 8.5.2018 14:15, Andreas Färber wrote:
> Hi Michal,
> 
> Am 07.05.2018 um 22:49 schrieb Rob Herring:
>> On Wed, May 02, 2018 at 10:17:57AM +0200, Michal Simek wrote:
>>> "Avnet, Inc. is one of the world's largest distributors of electronic
>>> components and embedded solutions." - Wikipedia.org
>>>
>>> Website: www.avnet.com
>>>
>>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>>> ---
>>>
>>>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>>  1 file changed, 1 insertion(+)
>>
>> Applied.
> 
> What is this standalone patch needed for? Looks fine, but it doesn't
> appear to be part of a series using it - is it for board compatibles?

This file is used by other projects but that's just side note.

I have sent a patch which uses that separately because it will be
applied separately out of this patch.
https://patchwork.kernel.org/patch/10375553/

Thanks,
Michal
