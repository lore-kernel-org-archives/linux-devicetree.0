From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH RFC 1/8] ARM: shmobile: r8a7743: add clock index macros
Date: Sat, 17 Sep 2016 13:15:45 +0300
Message-ID: <a3658cea-b31e-0c29-4c4d-2b9cd4644f18@cogentembedded.com>
References: <3533019.Wim1Kuh1ic@wasted.cogentembedded.com>
 <17982632.cAVaBDUq2Q@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <17982632.cAVaBDUq2Q@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com
List-Id: devicetree@vger.kernel.org

On 9/16/2016 4:28 PM, Sergei Shtylyov wrote:

> Add macros usable by the device tree sources to reference the R8A7743
> clocks  by index.
>
> Based on the original (and large) patch by Dmitry Shifrin
> <dmitry.shifrin@cogentembedded.com>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
>  include/dt-bindings/clock/r8a7743-clock.h |  157 ++++++++++++++++++++++++++++++
>  1 file changed, 157 insertions(+)
>
> Index: renesas/include/dt-bindings/clock/r8a7743-clock.h
> ===================================================================
> --- /dev/null
> +++ renesas/include/dt-bindings/clock/r8a7743-clock.h
> @@ -0,0 +1,157 @@
> +/*
> + * Copyright 2013 Ideas On Board SPRL

    Sorry, stupid copy/paste mistake, should have Cogent's copyright. Will 
re-spin soon...

MBR, Sergei
