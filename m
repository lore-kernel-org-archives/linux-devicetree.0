From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 0/2] Remaining sunxi musb patches
Date: Tue, 2 Jun 2015 09:45:28 -0500
Message-ID: <20150602144528.GA9623@saruman.tx.rr.com>
References: <1433088626-8858-1-git-send-email-hdegoede@redhat.com>
 <79fc4306-a621-43b8-b347-e42a27beb134@googlegroups.com>
 <20150601183447.GF26081@saruman.tx.rr.com>
 <556D57BD.90502@redhat.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Return-path: <linux-sunxi+bncBC5M7T4HYEKRBFEEW6VQKGQETSKUV5I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <556D57BD.90502-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Hans de Goede <jwrdegoede-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
List-Id: devicetree@vger.kernel.org

--5vNYLRcllDrimb99
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Tue, Jun 02, 2015 at 09:14:05AM +0200, Hans de Goede wrote:
> >>>Here is an updated version of the remaining (not yet merged in Felipe's
> >>>tree)
> >>>sunxi musb patches.
> >>>
> >>>The "phy-sun4i-usb: Add full support for usb0 phy / OTG" patch has been
> >>>updated with a small bug-fix and is ready for merging.
> >>>
> >>>The "musb: Add support for the Allwinner sunxi musb" patch has been
> >>>updated
> >>>to use the latest version of Maxime's sunxi sram controller driver. This
> >>>one has a compile-time dependency on Maxime's sunxi sram controller
> >>>driver,
> >>>so it cannot be merged until that is merged.
> >>>
> >>
> >>
> >>Arnd has just merged the updated sram controller into the next branch
> >>of the soc-drivers repo, so both these patches are now ready to merge.
> >
> >all right, so for v4.3 merge window there will be no issues in queues
> >the two remaining patches. Thanks
> 
> So I take it that it is too late to get these 2 into 4.2 ? I've a bunch
> of (small) follow up patches coming up to enable support for the musb
> controller on new boards, merging those would be easier if these were
> already merged. And there also is a largish set of sunxi dts patches
> actually enabling the musb code which is sorta waiting for merging
> these 2 (waiting for the dt binding to be stable).

DTS should not have to wait. If we know what the compatible should look
like, you can send your DTS upstream no problem. There will just be a
few devices which will not trigger a driver probe, but that's just fine.

> If this is not going to make 4.2, can you and Kishon at least review
> them and let me know of they will get merged for 4.3 as is (baring
> any merge issues) ?

Sure, that I can do, no issues.

-- 
balbi
--5vNYLRcllDrimb99--
