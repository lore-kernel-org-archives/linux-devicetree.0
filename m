From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 7/7] ARM: dts: sun7i: Enable cap-sdio-irq
 for bananapro sdio wifi
Date: Sun, 8 Mar 2015 18:26:38 +0100
Message-ID: <20150308172638.GH5085@lukather>
References: <1425754884-7875-1-git-send-email-hdegoede@redhat.com>
 <1425754884-7875-7-git-send-email-hdegoede@redhat.com>
 <CAGb2v65tcCrg3njNN0owLrM-MUepRBwjxpU46dpXkLhy9mceEA@mail.gmail.com>
 <54FC3239.5030200@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fmEUq8M7S0s+Fl0V"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB44R6KTQKGQEGOO4XRI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54FC3239.5030200-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--fmEUq8M7S0s+Fl0V
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sun, Mar 08, 2015 at 12:27:53PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 08-03-15 03:42, Chen-Yu Tsai wrote:
> >On Sun, Mar 8, 2015 at 3:01 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> >>The sdio wifi on the Banana Pro does not appear to have an oob irq hooked
> >>up, so enable sdio-irq support to avoid unnecessary polling.
> >
> >I wonder if this is stable enough to put back into the mmc driver, i.e.
> >declare the capability in the driver itself? IIRC at one point it did.
> 
> That is a good question, I believe strongly that the sdio wifi issues we've
> been seeing which were the reason to disable cap-sdio-irq in the driver are
> actually unrelated to the irq delivery mechanism. So IMHO yes we can just enable
> this for all devices in the driver, and yes that would be a better solution.
> 
> Maxime, if I send a patch to enable cal-sdio-irq at the driver level ( as it
> really is a hardware feature not a board feature), will you ack it ?

You know a lot more than I do on this, so I fully trust you. If you
feel like it's the best solution, go ahead.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--fmEUq8M7S0s+Fl0V--
