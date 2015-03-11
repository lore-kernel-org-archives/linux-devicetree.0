From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: sun6i: dt: Add new Mele I7 device
Date: Wed, 11 Mar 2015 14:41:58 +0100
Message-ID: <20150311134158.GM5085@lukather>
References: <1425131285-8640-1-git-send-email-codekipper@gmail.com>
 <20150303071635.GC4713@lukather>
 <54F568F8.1040104@redhat.com>
 <20150303082209.GE4713@lukather>
 <54F5B51F.6030609@redhat.com>
 <20150303135847.GH4911@lukather>
 <54FED277.4040000@redhat.com>
 <20150310184449.GZ5085@lukather>
 <54FF714F.4010303@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1f1tNaDgxoBnXskx"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBXUNQGUAKGQEBNZO3GI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54FF714F.4010303-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--1f1tNaDgxoBnXskx
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Tue, Mar 10, 2015 at 11:33:51PM +0100, Hans de Goede wrote:
> >>>and we have no way to replace U-Boot in NAND
> >>>so far (afaik). But replacing them by stdout-path is a very good
> >>>solution too.
> >>
> >>You mean putting stdout-path in the dts, I'm not sure if I like that,
> >>to me both bootargs and stdout-path are something which should be
> >>left to the bootloader to set. But I understand that when not
> >>using upstream u-boot that may be an issue.
> >
> >I know that some other platforms ask for stdout-path when they review
> >it, because iirc, barebox uses it to know on which console to output
> >its log and export its shell, which is also a valid interpretation of
> >that property, and, contrary to bootargs, doesn't really imply that
> >the bootloader should update it.
> 
> Hmm, that is interesting we should probably start doing the same in
> all the sunxi dts files, as eventually I would like to move all u-boot
> board config to devicetree, so that we only need to maintain dts files
> and not both dts files and u-boot board configs.

I had the plan to remove all earlyprintk in the bootargs of the DTS, I
can do it to convert all DTS to use stdout-path as well.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--1f1tNaDgxoBnXskx--
