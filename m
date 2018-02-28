From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/4] dt-bindings: arm: Document Renesas V3MSK and Wheat
 board part numbers
Date: Wed, 28 Feb 2018 09:32:53 +0100
Message-ID: <CAMuHMdXisBvUDdsb=C7eoLQzpgC7cw5ncD4g2vJOjXM6YFecuw@mail.gmail.com>
References: <20180228064911.vnax4vyqnq6lry52@verge.net.au>
 <4a2ae4c8-4a4b-1ea3-3416-2dfdffee6499@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4a2ae4c8-4a4b-1ea3-3416-2dfdffee6499@cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Wed, Feb 28, 2018 at 8:38 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 2/28/2018 9:49 AM, Simon Horman wrote:
>> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
>> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
>> @@ -120,9 +120,9 @@ Boards:
>>       compatible = "renesas,sk-rzg1m", "renesas,r8a7743"
>>     - Stout (ADAS Starterkit, Y-R-CAR-ADAS-SKH2-BOARD)
>>       compatible = "renesas,stout", "renesas,r8a7790"
>> -  - V3MSK
>> +  - V3MSK (Y-ASK-RCAR-V3M-WS10)
>
>    https://elinux.org/R-Car/Boards/V3MSK (now that I'm reminded of this
> site) says the V3MSK's model # is RTP0RC77970SEB0010S.

Nope, that's Eagle :-(
Check the picture on https://elinux.org/R-Car/Boards/Eagle

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
