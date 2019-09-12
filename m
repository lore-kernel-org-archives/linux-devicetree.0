From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH] arm: dts: renesas: r8a77980: Remove r8a77970 DU
 compatible
Date: Thu, 12 Sep 2019 13:03:11 +0100
Message-ID: <4ecb7e77-45e7-cf91-c8e3-0670d7ae25a7@ideasonboard.com>
References: <20190912103734.1879-1-kieran.bingham+renesas@ideasonboard.com>
 <CAMuHMdWb9qBDZqOs072u_pCRTaGGArAdUBLWbA5kGoU=KM4Y3A@mail.gmail.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWb9qBDZqOs072u_pCRTaGGArAdUBLWbA5kGoU=KM4Y3A@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On 12/09/2019 12:56, Geert Uytterhoeven wrote:
> On Thu, Sep 12, 2019 at 12:38 PM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
>> The r8a77970 was added with an compatible string for a differnet device
> 
> different

Also s/an/a/ ... Perhaps I should just step away from the keyboard
today, I can't seem to type ! hehe


>> rather than adding the correct compatible to the driver.
>>
>> Remove the unnecessary compatible which is for a different platform.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
>> Please note, this patch should not be integrated until the renesas,du-r8a77980
>> compatible string makes it into the DU [0].
> 
> Hence postponed.


Thanks.
--
KB


> Gr{oetje,eeting}s,
> 
>                         Geert
> 
