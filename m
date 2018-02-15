From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH V2] ARM: dts: stout: Initial r8a7790 Stout board support
Date: Thu, 15 Feb 2018 20:48:21 +0100
Message-ID: <e09921e8-0809-6ad7-1f4c-b1aeccac95e3@gmail.com>
References: <20180215100301.24744-1-marek.vasut+renesas@gmail.com>
 <20180215100936.dz62mm3h2zbsuf2j@katana>
 <4dfaaccb-c384-c640-d801-116e01410c22@gmail.com>
 <20180215182514.jaixuo5wrmlylucj@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20180215182514.jaixuo5wrmlylucj@verge.net.au>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-Id: devicetree@vger.kernel.org

On 02/15/2018 07:25 PM, Simon Horman wrote:
> On Thu, Feb 15, 2018 at 11:11:51AM +0100, Marek Vasut wrote:
>> On 02/15/2018 11:09 AM, Wolfram Sang wrote:
>>>
>>>> +		stdout-path = "serial0:38400n8";
>>>
>>> Didn't you want to change U-Boot to 115200?
>>
>> I did, do we care about compatibility with whatever the board comes with
>> though or not ?
> 
> The practice adopted for upstream DTS for Reneas SoCs
> is to use 115200 if it can be used by the board,
> regardless of what the default setting of the board is
> out-of-the-box.
> 
> So please change this to 115200.
> 
V3 is out

-- 
Best regards,
Marek Vasut
