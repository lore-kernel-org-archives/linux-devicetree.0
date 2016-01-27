From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 0/3] ARM: dt: sunxi: Add Itead Ibox support
Date: Wed, 27 Jan 2016 16:46:49 +0100
Message-ID: <20160127154649.GE4317@lukather>
References: <1453562299-18495-1-git-send-email-codekipper@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="//IivP0gvsAy3Can"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB5GMUO2QKGQEXA2X6TI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453562299-18495-1-git-send-email-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--//IivP0gvsAy3Can
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sat, Jan 23, 2016 at 04:18:16PM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Hi All,
> 
> this patch series is an extension of the initial patch delivery for the
> Itead Ibox as found here
> https://groups.google.com/d/msg/linux-sunxi/GR_co3ObW8s/0BTPQljmAAAJ.
> 
> There seems to be a few Itead variants out there based on their A10/A20
> core module and this patch series attempts to organise the device tree
> files with some consideration that these variants may be added later.
> 
> I've also converted the A10 Itead Iteaduino dts to use this common file.
> As I don't have this board to verify the changes I simply compared the
> output of the fdtdump before and after applying these patches. The only
> difference was the reduction to the dcdc2 max voltage.
> 

Applied all three, thanks!

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--//IivP0gvsAy3Can--
