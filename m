From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: Re: [RFC PATCH] ARM: dts: sun8i: add simplefb node
 for H3
Date: Thu, 01 Dec 2016 03:03:14 +0800
Message-ID: <20161130220324.3Kg4VPEw@smtp1m.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/html; charset=UTF-8
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBAWF7TAQKGQETIF45EQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jernej.skrabec-gGgVlfcn5nU@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

<p dir="ltr"><br>
2016&#24180;12&#26376;1&#26085; 02:49&#20110; Jernej Skrabec &lt;jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org&gt;&#20889;&#36947;&#65306;<br>
&gt;<br>
&gt; Hi Jean-Fran&#231;ois,<br>
&gt;<br>
&gt; Dne sreda, 30. november 2016 10.35.08 UTC+1 je oseba Jean-Fran&#231;ois Moine napisala:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, 29 Nov 2016 22:59:32 +0100 <br>
&gt;&gt; Maxime Ripard &lt;maxime...-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org&gt; wrote: <br>
&gt;&gt;<br>
&gt;&gt; &gt; &gt; &gt; I'm still not sure which pipeline should I use. <br>
&gt;&gt; &gt; &gt; &gt; <br>
&gt;&gt; &gt; &gt; &gt; And, it seems that HDMI Slow Clock is not needed? <br>
&gt;&gt; &gt; &gt; &gt; <br>
&gt;&gt; &gt; &gt; &gt; (seems that it's only for EDID, but simplefb won't use EDID) <br>
&gt;&gt; &gt; &gt; <br>
&gt;&gt; &gt; &gt; So, I don't see how this may work. <br>
&gt;&gt; &gt; &gt; How can the u-boot know the resolutions of the HDMI display device? <br>
&gt;&gt; &gt; &gt; <br>
&gt;&gt; &gt; &gt; In other words: I have a new H3 board with the last u-boot and kernel. <br>
&gt;&gt; &gt; &gt; I plug my (rather old or brand new) HDMI display device. <br>
&gt;&gt; &gt; &gt; After powering on the system, I hope to get something on the screen. <br>
&gt;&gt; &gt; &gt; How? <br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt; If it works like the driver for the first display engine in U-Boot, it <br>
&gt;&gt; &gt; will use the preferred mode reported by the EDID, and will fallback to <br>
&gt;&gt; &gt; 1024x768 if it cannot access it. <br>
&gt;&gt;<br>
&gt;&gt; Icenowy wrote: "simplefb won't use EDID" <br>
&gt;&gt;<br>
&gt;&gt; Then, if it is like in the kernel, the 1024x768 mode is VGA. It does <br>
&gt;&gt; not work with HDMI (different timings). <br>
&gt;<br>
&gt;<br>
&gt; U-Boot driver now accept any timings recommended by EDID. So far it<br>
&gt; was tested with at least following resolutions:<br>
&gt; - 1920x1080 @ 60 Hz<br>
&gt; - 1280x1024 @ 60 Hz<br>
&gt; - 1280x800 @ 60 Hz (slight clock difference)<br>
&gt; - 800x480 (not sure about frame rate)<br>
&gt; - 3840x2160 @ 30 Hz (4K)</p>
<p dir="ltr">I tested on 1024x600 (If my memory is right, it's @ 60Hz)</p>
<p dir="ltr">&gt;<br>
&gt; and nobody complained so far. I'm pretty sure 1024x768 would work.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; Maybe it would be worth exchanging on the EDID code that has been done <br>
&gt;&gt; &gt; for the u-boot driver too, so that it can be fixed in your driver. <br>
&gt;&gt;<br>
&gt;&gt; The u-boot got my code, and, up to now, I could not fix the random or <br>
&gt;&gt; permanent failures of EDID reading in some boards. <br>
&gt;&gt;<br>
&gt;<br>
&gt; I only have one OPi2, but as I said, EDID always worked for me. The only<br>
&gt; code left from you is for DE2. HDMI stuff is basically copied from Rockhip<br>
&gt; driver (including EDID reading), TCON code is now reverted to the same as<br>
&gt; it is in sunxi_display.c. I think it is worth to take a look at EDID code and<br>
&gt; compare it.</p>
<p dir="ltr">So is the TCON of DE 2.0 identical to the original TCON?</p>
<p dir="ltr">If so, we should reuse sun4i-tcon ...</p>
<p dir="ltr">&gt; &#160;<br>
&gt;&gt;<br>
&gt;&gt; -- <br>
&gt;&gt; Ken ar c'henta&#241;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;|&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; &#160; &#160; &#160;** Breizh ha Linux atav! ** <br>
&gt;&gt; Jef&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;|&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;http://moinejf.free.fr/<br>
&gt;<br>
&gt;<br>
&gt; Best regards,<br>
&gt; Jernej &#352;krabec <br>
&gt;<br>
&gt; -- <br>
&gt; You received this message because you are subscribed to the Google Groups "linux-sunxi" group.<br>
&gt; To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org<br>
&gt; For more options, visit https://groups.google.com/d/optout.<br>
</p>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an email to <a href="mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href="https://groups.google.com/d/optout">https://groups.google.com/d/optout</a>.<br />
