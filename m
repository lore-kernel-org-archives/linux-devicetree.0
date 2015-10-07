From: Stefan Monnier <monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sunxi: Add regulators for
 LeMaker BananaPi
Date: Wed, 07 Oct 2015 12:01:21 -0400
Message-ID: <jwvegh6d60k.fsf-monnier+gmane.comp.hardware.netbook.arm.sunxi@gnu.org>
References: <1438532305-5884-1-git-send-email-public_timo.s@silentcreek.de>
	<20150818153631.GH2547@lukather>
	<CAMAWPa-Q7o+Ys2FjhLZt6Nwq=Ja6TTdWFDZFTCYLkoLGjpLpxw@mail.gmail.com>
	<20151005173957.B1BD16C8150E@dd34104.kasserver.com>
	<7hzizu924y.fsf@deeprootsystems.com>
	<20151007154918.D6F856C800D4@dd34104.kasserver.com>
Reply-To: monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDMKFH665MBBB2MD2WYAKGQEOGGUHOI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> @Maxime: How should we handle this? In its current form, the patch applies
> only to the BananaPi dts by overriding the inherited opp from the SoC dtsi.
> In an earlier discussion, it was said that this can be done, even though it
> might not be the most elegant approach. But then again, I think it
> shouldn't be necessary to change the opp in the sun7i-a20.dtsi for all A20
> boards since this is - to my knowledge - the first and only report that an
> A20 board has stability issues at the lower voltages (although not too many
> boards use voltage scaling yet).

IIUC this setting doesn't affect signals external to the A20, so it
seems like it should be board-agnostic.


        Stefan
