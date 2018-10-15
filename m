Return-Path: <SRS0=7icI=M3=verge.net.au=horms@kernel.org>
Date: Mon, 15 Oct 2018 17:43:39 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a77970: add thermal support
Message-ID: <20181015154339.alaeq7s2xguf7mjo@verge.net.au>
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <575ebd1f-165a-756f-f76a-14a11bba7f19@cogentembedded.com>
 <CAMuHMdW4JNYiDqwo9ZQbsrxCpXaoJzs8a1L3eNnfhVqgozRNaw@mail.gmail.com>
 <20181012112107.vtkjojhefzrkwovl@verge.net.au>
 <263dd8f7-8d7a-75e6-c1f3-43ddcdd98ead@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <263dd8f7-8d7a-75e6-c1f3-43ddcdd98ead@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Oct 12, 2018 at 05:36:55PM +0300, Sergei Shtylyov wrote:
> On 10/12/2018 02:21 PM, Simon Horman wrote:
> 
> >>> Describe THS/CIVM in the R8A77970 device tree.
> >>>
> >>> Based on the original (and large) patches by Vladimir Barinov.
> >>>
> >>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> >>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >>>
> >>> ---
> >>> This patch is against the 'renesas-devel-20181004-v4.19-rc6' tag of Simon
> >>> Horman's 'renesas.git' repo.
> >>>
> >>> Changed in version 2:
> >>> - fix the "reg" prop in the thermal device node;
> >>> - fixed wrong plural in the patch description.
> >>
> >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > Thanks, applied for v4.21.
> 
>    Not seeing any updates -- forgot to push?

Yes, sorry. I noticed that this morning and pushed
renesas-devel-20181012-v4.19-rc7.
