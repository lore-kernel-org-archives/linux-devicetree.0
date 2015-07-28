From: Stefan Monnier <monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org>
Subject: Re: [RFC] ARM: dts: sunxi: Add regulators and
 board-specific operating points for LeMaker BananaPi
Date: Tue, 28 Jul 2015 19:02:51 -0400
Message-ID: <jwv7fpjhoqp.fsf-monnier+gmane.comp.hardware.netbook.arm.sunxi@gnu.org>
References: <1437960486-2809-1-git-send-email-public_timo.s@silentcreek.de>
	<55B5E6DB.8020009@redhat.com>
	<20150727123653.36C046C8007E@dd34104.kasserver.com>
	<55B62A1B.6030601@redhat.com>
	<CAGb2v65ApKvrj6K+kw43u=0q6=auTsmQjCXhibgZkW+vd5nDqA@mail.gmail.com>
	<20150728090216.892076C80D94@dd34104.kasserver.com>
Reply-To: monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDMKFH665MBBBMMU4CWQKGQE4IW4XIQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> IMHO for a common maximum opp that's a good approach. But for the lowest
> frequency setting, it would seem more logical to me, to raise the voltage
> to a point where all boards will run fine with them, unless those boards
> cannot handle the frequency regardless of the higher voltage.

I generally agre, tho IIRC some measurements seem to indicate that the
lowest frequency settings did not bring much (if any) reduction in power
consumption, making them rather useless.


        Stefan
