From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 2/4] drivers: soc: sunxi: fix error
 processing on base address when claiming
Date: Wed, 9 Aug 2017 17:16:29 +0800
Message-ID: <CAGb2v658CSUwSMdv5yCLtPSfDrsmMZDSBjZQsmi=2Y+EfJPmhg@mail.gmail.com>
References: <20170809085627.32687-1-icenowy@aosc.io> <20170809085627.32687-3-icenowy@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBBNGVPGAKGQEBIPQ5QQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170809085627.32687-3-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 9, 2017 at 4:56 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> When claiming SRAM, if the base is set to an error, it means that the
> SRAM controller has been probed, but failed to remap the controller
> memory zone. If the base is zero, thus the SRAM controller should be not
> probed at all, and it should return -EPROBE_DEFER. However, currently we
> returned -EPROBE_DEFER in the former situation, and ignored the latter
> situation (which will lead to the kernel to panic).
>
> Fix the behavior on abnormal base address processing when claiming.
>
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

Fixes: 4af34b572a85 ("drivers: soc: sunxi: Introduce SoC driver to map SRAMs") ?

I can add the tag when applying.

ChenYu
