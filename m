From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC PATCH V3] ARM: dts: sun6i: Add dts file for
 MSI Primo81 tablet
Date: Thu, 18 Jun 2015 13:58:38 +0200
Message-ID: <20150618115838.GL11732@lukather>
References: <20150616094026.GG11732@lukather>
 <1434481869-9432-1-git-send-email-merker@debian.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yK/6QRnH3Zanb0EF"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBQXFRKWAKGQE6MF7ZVA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1434481869-9432-1-git-send-email-merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--yK/6QRnH3Zanb0EF
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Tue, Jun 16, 2015 at 09:11:08PM +0200, Karsten Merker wrote:
> On Tue, Jun 16, 2015 at 11:40:27AM +0200, Maxime Ripard wrote:
> 
> > What I meant in my previous review was to use the syntax
> > 
> > &uart0 {
> >        some-property;
> > };
> >   
> > Instead of duplicating the tree structure like you're doing
> > here. We've converted all the DT to that, so you can look around and
> > see how it's done in other boards (note that the nodes should be
> > sorted by alphabetical order).
> 
> Ah, sorry, I had misunderstood your original email in this regard.
> Following is a reworked version of the patch.
> 
> Changelog:
> 
> Version 1
> =========
> - Original patch by Siarhei Siamashka
> 
> Version 2
> =========
> - Use symbolic instead of numeric pinctrl values.
> 
> - Change the include syntax from /include/ to #include to make
>   the dts build with current kernels.
> 
> Version 3
> =========
> - Use labels for nodes with modifications in relation to the dtsi
>   instead of replicating the tree structure.
> 
> - Remove the FSF address from the license header as done in
>   http://lists.infradead.org/pipermail/linux-arm-kernel/2015-May/340437.html
>   for the other dts files to remove a checkpatch warning.
> 
> - Add msi to the vendor prefix list.
> 
> - Remove earlyprintk from the default kernel commandline.
> 
> - Replace the console kernel commandline parameter by a
>   /chosen/stdout-path node and add an alias serial0 -> uart0.

Next time, pleas try to keep the changelog with your patch, it's much
easier to read.

And please make the vendor prefix change a different patch.

> I have tagged this patch RFC as I am unsure what to do with the
> /chosen/stdout-path node. For now, I have set Siarhei's original
> choice (first serial port), but I am unsure whether this is the
> right thing to do as the Primo81 does by default not have a
> user-accessible serial port.  The only way to get a serial
> console is to either break the case open and find some test
> points that carry the RX/TX lines (which with the Primo81 case
> poses a high risk of breaking the display glass), or to use an SD
> card breakout board and change the pinmuxing for the SD card pins
> to the "serial" function.  The latter would not work without
> modifying the dts, so the SD-breakout case doesn't really count
> for setting the default stdout-path in the general use case.

Having that as a comment on top of whatever uart you've been using
would be great, so that people know where to look at on their device
to find it.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--yK/6QRnH3Zanb0EF--
