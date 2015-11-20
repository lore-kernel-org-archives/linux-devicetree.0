From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 0/2] Add I2C support for Marvell Berlin BG4CT
Date: Fri, 20 Nov 2015 17:51:22 +0800
Message-ID: <20151120175122.7b79e83c@xhacker>
References: <1448012821-7413-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448012821-7413-1-git-send-email-jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Fri, 20 Nov 2015 17:46:59 +0800
Jisheng Zhang wrote:

> The first patch adds i2c nodes in the soc's dtsi, the second patch
> enables all i2c nodes for BG4CT STB board.
> 
> NOTE: this series depends on the missed-in-v4.4rc1 patches:
> 
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-October/378634.html
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-October/378635.html
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-October/378638.html

also depends on BG4CT clk support:
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-November/386760.html

I just want to sent out for review early so that i2c support will get merged
once clk patches are accepted and merged.

Thanks,
Jisheng

> 
> Jisheng Zhang (2):
>   arm64: dts: berlin4ct: add I2C nodes for BG4CT
>   arm64: dts: berlin4ct: enable all i2c nodes for the STB board
> 
>  arch/arm64/boot/dts/marvell/berlin4ct-stb.dts | 50 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/marvell/berlin4ct.dtsi    | 52 +++++++++++++++++++++++++++
>  2 files changed, 102 insertions(+)
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
