Return-Path: <SRS0=qoK5=SH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:40388 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730470AbfDEJCl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 5 Apr 2019 05:02:41 -0400
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r8a7795: Add CMT device nodes
References: <1554443049-25127-1-git-send-email-cv-dong@jinso.co.jp>
 <1554443049-25127-2-git-send-email-cv-dong@jinso.co.jp>
 <20190405081716.s74zbrd47ychcevw@verge.net.au>
From: Cao Van Dong <cv-dong@jinso.co.jp>
Message-ID: <d666b4d4-4b78-201f-c7a1-f41bd5c1cf71@jinso.co.jp>
Date: Fri, 5 Apr 2019 18:02:30 +0900
MIME-Version: 1.0
In-Reply-To: <20190405081716.s74zbrd47ychcevw@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: broonie@kernel.org, geert+renesas@glider.be, devicetree@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, linux-renesas-soc@vger.kernel.org, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

Dear Simon-san,

On 2019/04/05 17:17, Simon Horman wrote:
> On Fri, Apr 05, 2019 at 02:44:06PM +0900, Cao Van Dong wrote:
>> This patch adds CMT{0|1|2|3} device nodes for r8a7795 SoC.
>>
>> Tested-by: Cao Van Dong <cv-dong@jinso.co.jp>
>> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> Thanks,
>
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Thanks you for review!
> I am, however, curious to know how you tested this.
>
> Likewise for patches 2/4 and 3/4.
Always thanks for your curious!
After booting, I checked the existence of the device and the device 
interrupt.

Thanks you,
Dong
