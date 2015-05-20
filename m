From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v2 0/2] Implement SoC bus support for Vybrid
Date: Wed, 20 May 2015 08:08:09 +0200
Message-ID: <283beb50db48f2a7a43dcdd249e4d93e@agner.ch>
References: <cover.1432099651.git.maitysanchayan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1432099651.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015-05-20 07:36, Sanchayan Maity wrote:
> Sanchayan Maity (2):
>   ARM: dts: vfxxx: Add OCOTP and OCROM nodes
>   ARM: vf610: Add SoC bus support for Vybrid
> 
>  arch/arm/boot/dts/vfxxx.dtsi   | 10 +++++
>  arch/arm/mach-imx/mach-vf610.c | 85 +++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 93 insertions(+), 2 deletions(-)


This patchset
Acked-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

Shawn, speaking of Ack, the current plan is to merge the Vybrid
Cortex-M4 patches directly into the arm-soc tree. If you are ok with
them, could I have your Ack on them (sent out a split version of them
(v8) some hours ago).

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
