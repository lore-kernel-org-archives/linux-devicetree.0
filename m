From: Stefan Monnier <monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org>
Subject: Re: [PATCH 9/9] [DO NOT MERGE] drm/sun4i: rgb: Add 5%
 tolerance to dot clock frequency check
Date: Thu, 18 Oct 2018 08:25:18 -0400
Message-ID: <jwvtvljxx5k.fsf-monnier+gmane.comp.hardware.netbook.arm.sunxi@gnu.org>
References: <20181018073327.64942-1-icenowy@aosc.io>
	<20181018073327.64942-10-icenowy@aosc.io> <4168274.Gmp9JTCfJR@avalon>
	<CAKMK7uFp2c=wqzPi096MTRB6Cdfacerkp6dM=fEqCAr99PQG9w@mail.gmail.com>
	<20181018094258.oahlopafvm2udvoe@flea>
Reply-To: monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDMKFH665MBBBOPXUHPAKGQEIRAQAMQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> it might also break some panels that currently work and won't now,

Could you give a scenario where this happens?  My reading of the patch
says that it should only cause the display to be ON in more
circumstances (i.e. in cases where it previously would stay OFF because
of MODE_CLOCK_LOW or MODE_CLOCK_HIGH).


        Stefan
