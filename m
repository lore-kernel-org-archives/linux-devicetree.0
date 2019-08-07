Return-Path: <SRS0=MILw=WD=denx.de=marex@kernel.org>
Subject: Re: [PATCH 1/2] Input: ili210x - Add DT binding for the Ilitek
 ILI2117 touch controller
References: <20190302141704.32547-1-marex@denx.de>
 <20190327194425.GA641@bogus>
From: Marek Vasut <marex@denx.de>
Message-ID: <2b9ecd9d-c383-5686-c8f8-9ba88096fbf9@denx.de>
Date: Wed, 7 Aug 2019 13:27:52 +0200
MIME-Version: 1.0
In-Reply-To: <20190327194425.GA641@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Henrik Rydberg <rydberg@bitmath.org>, Olivier Sobrie <olivier@sobrie.be>, Philipp Puschmann <pp@emlix.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 3/27/19 8:44 PM, Rob Herring wrote:
> On Sat,  2 Mar 2019 15:17:03 +0100, Marek Vasut wrote:
>> Add DT binding for the Ilitek ILI2117 touch controller, which is yet
>> again a slightly different device in the ILI21xx family.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> Cc: Henrik Rydberg <rydberg@bitmath.org>
>> Cc: Olivier Sobrie <olivier@sobrie.be>
>> Cc: Philipp Puschmann <pp@emlix.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> To: linux-input@vger.kernel.org
>> ---
>>  Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Bump ? I noticed these patches were never applied.
