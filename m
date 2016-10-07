From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 01/11] ARM: shmobile: r8a7743: add power domain index
 macros
Date: Fri, 7 Oct 2016 12:14:50 +0900
Message-ID: <20161007031450.GI13721@verge.net.au>
References: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com>
 <5183851.NpIWVzMZV9@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5183851.NpIWVzMZV9@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, magnus.damm@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Oct 06, 2016 at 12:31:30AM +0300, Sergei Shtylyov wrote:
> Add macros usable by the device tree sources to reference R8A7743 SYSC power
> domains by index.
> 
> Based on the original (and large) patch by Dmitry Shifrin
> <dmitry.shifrin@cogentembedded.com>.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> ---
> Changes in version 2:
> - added Geert's tag.
> 
>  include/dt-bindings/power/r8a7743-sysc.h |   25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)

Thanks, I have queued this up.
