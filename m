From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/4] dt-bindings: arm: Document Renesas V3MSK and Wheat
 board part numbers
Date: Wed, 28 Feb 2018 10:38:40 +0300
Message-ID: <4a2ae4c8-4a4b-1ea3-3416-2dfdffee6499@cogentembedded.com>
References: <20180228064911.vnax4vyqnq6lry52@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180228064911.vnax4vyqnq6lry52@verge.net.au>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2/28/2018 9:49 AM, Simon Horman wrote:

[...]

>> On Tue, Feb 27, 2018 at 9:17 AM, Simon Horman <horms@verge.net.au> wrote:
>>> On Mon, Feb 26, 2018 at 07:03:43PM +0100, Geert Uytterhoeven wrote:
> 
> ...
> 
>>>> -  - Wheat
>>>> +  - Wheat (RTP0RC7792ASKB0010JE)
>>>>       compatible = "renesas,wheat", "renesas,r8a7792"
>>>
>>> I'm unable to confirm the above. Can anyone help?
>>
>> https://elinux.org/R-Car/Boards/Wheat
>>
>> Looks like I misinterpreted the pictures, and
>> RTP0RC7792ASKB0000JE is the correct part number for Wheat.
> 
> Thanks. I've applied the following.
> 
> 
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Subject: [PATCH] dt-bindings: arm: Document Renesas V3MSK and Wheat board part
>   numbers
> 
> The DT binding documentation for the Renesas V3MSK and Wheat boards
> lacked board part numbers.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> [simon: corrected Wheat part number]
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>   Documentation/devicetree/bindings/arm/shmobile.txt | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
> index a99359e63b0a..66edc1406bb8 100644
> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -120,9 +120,9 @@ Boards:
>       compatible = "renesas,sk-rzg1m", "renesas,r8a7743"
>     - Stout (ADAS Starterkit, Y-R-CAR-ADAS-SKH2-BOARD)
>       compatible = "renesas,stout", "renesas,r8a7790"
> -  - V3MSK
> +  - V3MSK (Y-ASK-RCAR-V3M-WS10)

    https://elinux.org/R-Car/Boards/V3MSK (now that I'm reminded of this site) 
says the V3MSK's model # is RTP0RC77970SEB0010S.

>       compatible = "renesas,v3msk", "renesas,r8a77970"
> -  - Wheat
> +  - Wheat (RTP0RC7792ASKB0000JE)
>       compatible = "renesas,wheat", "renesas,r8a7792"

MBR, Sergei
