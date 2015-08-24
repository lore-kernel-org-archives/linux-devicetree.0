From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re-using sun5i-a13.dtsi for the r8 ?
Date: Mon, 24 Aug 2015 16:26:30 +0200
Message-ID: <20150824142630.GU2413@lukather>
References: <55D6D8E3.3020403@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fryGc0vzirnrYIcd"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBF6T5SXAKGQEGF3GHZA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55D6D8E3.3020403-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--fryGc0vzirnrYIcd
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Fri, Aug 21, 2015 at 09:53:07AM +0200, Hans de Goede wrote:
> I just realized that I never answered your question about the need
> for a tvencoder simplefb node in sun5i-a13.dtsi, like the one from
> the "ARM: dts: sun5i: Add simplefb node for tvencoder output"
> 
> I think the real question is do we want to use sun5i-a13.dtsi for
> the r8 ?

So far, the only information I got about the R8 was that it was
strictly identical to the A13, and it was making sense to re-use it
entirely.

> I would expect us to use a sun5i-r8.dtsi, this one could then
> include sun5i-a13.dtsi, and have the extra simplefb node for
> the tvencoder. Putting the simplefb node for the tvencoder
> in sun5i-a13.dtsi feels wrong because the A13 package does
> not have a tvout pin.

But if it turns out it's not, then yeah, we'll have to make another
DTSI.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--fryGc0vzirnrYIcd--
