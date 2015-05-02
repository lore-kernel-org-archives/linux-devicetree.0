From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: ARM: sunxi: dts: split IR pins for A10 and A20
Date: Sat, 2 May 2015 13:52:04 +0200
Message-ID: <20150502115204.GN6062@lukather>
References: <1430566580-14295-1-git-send-email-codekipper@gmail.com>
 <CAEKpxBmp456qWrPRM7H-FVY5V3whZZLx1teNv7KLSbxsjhLVmQ@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v541l457l4DThMFo"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBF7WSKVAKGQELBZZYHA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAEKpxBmp456qWrPRM7H-FVY5V3whZZLx1teNv7KLSbxsjhLVmQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--v541l457l4DThMFo
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sat, May 02, 2015 at 01:42:20PM +0200, Code Kipper wrote:
> This is v2 of the patch after Maxime's comments. Was trying to add
> versioning comments to below the commit message but for some reason
> adding --subject to the send-email command seemed to cancel out the
> --dry-run. So it's out in the wild.

Usually, you want to use --annotate for this, and having PATCH vX in
the subject, which can easily be done using -vX.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--v541l457l4DThMFo--
