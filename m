Return-Path: <SRS0=C7D/=QX=gmail.com=marek.vasut@kernel.org>
Subject: Re: [PATCH] dt-bindings: can: rcar_can: document r8a77990 support
References: <20181118173056.4591-1-marek.vasut+renesas@gmail.com>
 <20181119104243.csnkooxolkple2ln@verge.net.au>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <499ffcf5-0617-a142-914d-afee88c2127b@gmail.com>
Date: Sat, 16 Feb 2019 14:58:18 +0100
MIME-Version: 1.0
In-Reply-To: <20181119104243.csnkooxolkple2ln@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Simon Horman <horms@verge.net.au>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Eugeniu Rosca <erosca@de.adit-jv.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 11/19/18 11:42 AM, Simon Horman wrote:
> On Sun, Nov 18, 2018 at 06:30:56PM +0100, Marek Vasut wrote:
>> Document the support for rcar_can on R8A77990 SoC devices.
>> Add R8A77990 to the list of SoCs which require the "assigned-clocks"
>> and "assigned-clock-rates" properties.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Eugeniu Rosca <erosca@de.adit-jv.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Simon Horman <horms+renesas@verge.net.au>
>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>>  Documentation/devicetree/bindings/net/can/rcar_can.txt | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
This patch seems to be missing upstream ?

-- 
Best regards,
Marek Vasut
