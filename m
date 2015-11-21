From: Stefan Monnier <monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add dts file for the
 lamobo-r1 board
Date: Sat, 21 Nov 2015 12:46:23 -0500
Message-ID: <jwvy4drz1qz.fsf-monnier+gmane.comp.hardware.netbook.arm.sunxi@gnu.org>
References: <1448046713-13579-1-git-send-email-hdegoede@redhat.com>
Reply-To: monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDMKFH665MBBBG64YKZAKGQEGI6XAQA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> The lamobo-r1 board, sometimes called the BPI-R1 but not labelled as such
> on the PCB, is meant as a A20 based router board. As such the board comes
> with a built-in switch chip giving it 5 gigabit ethernet boards, and it
> has a large empty area on the pcb with mounting holes which will fit a
> 2.5 inch harddisk. To complete its networking features it has a
> Realtek RTL8192CU for WiFi 802.11 b/g/n.

When I looked for a DTS file for this board, I was told that the
bananapi DTS works just fine, the only difference being the ethernet
switch chip, which is not supported by mainline anyway (because the
only driver for it is in OpenWRT, using a framework that was never
accepted into mainline).

So is there some way to share the bulk of this file with that of
the bananapi?


        Stefan
