From: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 12/12] arm64: dts: h3ulcb: Sound SSI support
Date: Fri, 2 Sep 2016 15:08:14 +0300
Message-ID: <813b2951-7270-b352-1d5e-b452cb502bbb@cogentembedded.com>
References: <1472817881-11860-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1472817933-12018-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472817933-12018-1-git-send-email-vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02.09.2016 15:05, Vladimir Barinov wrote:
> This supports SSI sound for H3ULCB board.
> SSI DMA mode used. CS2000 used as AUDIO_CLK_B.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> ---
> Changes in version 3:
> - initially added
> Changes in version 4:
> - added comment for audio_clkout
>
>   arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 115 +++++++++++++++++++++++++
>   1 file changed, 115 insertions(+)
>
Sorry for the subject typo. The proper one is v4:
[PATCH v4 4/4] arm64: dts: h3ulcb: Sound SSI support

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
