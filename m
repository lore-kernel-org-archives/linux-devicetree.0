From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH] arm64: dts: r8a7795: Add GIC-400 virtual interfaces
Date: Mon, 15 Feb 2016 13:40:18 +0100
Message-ID: <56C1C732.4050505@de.bosch.com>
References: <1455005692-9382-1-git-send-email-dirk.behme@de.bosch.com>
 <87povyh6lq.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <87povyh6lq.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon <horms@verge.net.au>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux-DT <devicetree@vger.kernel.org>, Linux-ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 15.02.2016 06:46, Kuninori Morimoto wrote:
>
> Hi Dirk
> Cc Geert
>
>> Besides the distributor and the CPU interface the GIC-400 additionally
>> supports the virtual interface control blocks and the virtual CPU interfaces.
>>
>> Add the physical base addresses and size for these.
>>
>> See
>>
>> http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0471b/index.html
>> -> 3.2. GIC-400 register map
>>
>> and Linux kernel's
>>
>> Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
>>
>> for more details.
>>
>> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
>> ---
>
> Our R-Car chip is out-of-mapping.
> Geert had indicated it in
> http://thread.gmane.org/gmane.linux.ports.sh.devel/49751/focus=51544
> And we have no answer about it I think


Could you point us to the code where you think our out-of-mapping 
doesn't work?

Best regards

Dirk
