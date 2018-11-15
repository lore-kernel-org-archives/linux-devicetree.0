From: Stefan Monnier <monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org>
Subject: Re: [PATCH 01/15] ARM: dts: sun8i-a33: Remove heading 0
 in video-codec unit address
Date: Thu, 15 Nov 2018 16:28:05 -0500
Message-ID: <jwv5zwy58wh.fsf-monnier+gmane.comp.hardware.netbook.arm.sunxi@gnu.org>
References: <20181115145013.3378-1-paul.kocialkowski@bootlin.com>
	<20181115145013.3378-2-paul.kocialkowski@bootlin.com>
Reply-To: monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDMKFH665MBBB4WJW7PQKGQEDJOFMOA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> This cosmetic change removes the heading 0 in the video-codec unit
                                   ^^^^^^^^^

I think you meant "leading 0" (this applies to the title as well, and
to the other patch for H3 as well).


        Stefan
