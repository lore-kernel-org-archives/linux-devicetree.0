From: Peter Korsgaard <peter-+2lRwdCCLRT2eFz/2MeuCQ@public.gmane.org>
Subject: Re: Re: [PATCH 0/6] ARM: sunxi: Introduce Allwinner H3 support
Date: Tue, 27 Oct 2015 20:24:22 +0100
Message-ID: <87d1w09kt5.fsf@dell.be.48ers.dk>
References: <1445444007-4260-1-git-send-email-jenskuske@gmail.com>
	<5627E515.6050505@redhat.com> <562894FE.3040702@gmail.com>
	<5628A302.1080908@redhat.com>
Reply-To: jacmet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDKONJFYSUEBB2M6X6YQKGQETZOFFLY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <5628A302.1080908-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> (Hans de Goede's message of "Thu,
	22 Oct 2015 10:49:06 +0200")
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Emilio =?utf-8?Q?L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, "Reinder
 E.N. de Haan" <reinder-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, zhao_steven-Y9sIeH5OGRo@public.gmane.org
List-Id: devicetree@vger.kernel.org

>>>>> "Hans" == Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> writes:

Hi,

 > 2) I see no pmic code in there. I know these boards do not use an axp pmic,
 > but according to my info at least the Orange Pi 2 (which I have) uses a
 > sy8106a pmic, it is not entirely clear to me yet if this one needs any
 > init though, I've mailed the Orange Pi people about this.

Did you hear back from them? I haven't been able to find any datasheet
describing the i2c interface, but the orange pi pc schematics has a note
that Vout is defined by the Ru1 / Ru2 resistors, so it sounds like i2c
configuration isn't critical to get something running.

-- 
Bye, Peter Korsgaard
