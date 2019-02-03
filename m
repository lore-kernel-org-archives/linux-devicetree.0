From: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 9/9] [DO NOT MERGE] drm/sun4i: rgb: Add 5%
 tolerance to dot clock frequency check
Date: Sat, 2 Feb 2019 17:32:42 -0800
Message-ID: <CA+E=qVew_TFXQzz+7V6njG4w-Ay4YZND0FZ+8F2TRnhhOBb2Mg@mail.gmail.com>
References: <20181018073327.64942-1-icenowy@aosc.io> <CAKMK7uFp2c=wqzPi096MTRB6Cdfacerkp6dM=fEqCAr99PQG9w@mail.gmail.com>
 <20181018094258.oahlopafvm2udvoe@flea> <1585874.9P5eR8PMbl@avalon>
Reply-To: anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDV3B667TUHBBVEJ3HRAKGQETMDTPAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1585874.9P5eR8PMbl@avalon>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 18, 2018 at 4:31 AM Laurent Pinchart
<laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:

> Given that the tolerance is a property of the panel or bridge, I agree with
> Daniel that it should be implemented there, or at least in cooperation with
> drm_panel and drm_bridge.

Clock tolerance is not specified in ANX6345 datasheet.

> Semi-related information, I think the CEA and VESA standards allow a 0.5%
> clock tolerance. What is the maximum clock frequency deviation required for
> this platform ?

This particular platform requires ~1% deviation.

E.g. on Pinebook with 768p panel: requested clock: 73.0 MHz, real
clock: 72.296296 MHz (0.96%)
on Pinebook with 1080p panel: requested clock: 138.5 MHz, real clock:
138.461538 MHz (0.03%)

So unfortunately 0.5% is not enough.

Regards,
Vasily
