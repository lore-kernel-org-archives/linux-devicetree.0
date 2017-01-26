From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2] ARM: dts: r8a7791: link DU to VSPDs
Date: Thu, 26 Jan 2017 21:42:25 +0300
Message-ID: <4ae454ad-296c-dec9-27e9-fd050333737f@cogentembedded.com>
References: <1529351.Fac5N2tKoF@wasted.cogentembedded.com>
 <2492577.tBEnW0tCHD@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <2492577.tBEnW0tCHD@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 01/26/2017 12:42 AM, Sergei Shtylyov wrote:

> Add the "vsps" property to the DU device node in order to link this node to
> the VSPD nodes.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
> Changes in version 2:
> - rebased the patch.
>
> This patch is against the 'renesas-devel-20170125-v4.10-rc5' of Simon Horman's
> 'renesas.git' repo.  It's  only meaningful if the DRM driver patches I've just
> posted are applied.

    Forgot to note that without this patch the DU driver fails to link to VSPD 
and probe correctly, so there's no video signal. So it makes sense to apply 
before the DU driver patch (once it's ACKed for merge)...

MBR, Sergei
