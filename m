From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 07/11] ARM: dts: sunxi: Add dtsi file for
 AXP809 PMIC
Date: Tue, 9 Feb 2016 13:41:37 +0800
Message-ID: <CAGb2v66a=LLMBEbrR2qCzuYp+-fa96qLROFN10+aNvfGTtW-Zg@mail.gmail.com>
References: <1454408864-24112-1-git-send-email-wens@csie.org>
 <1454408864-24112-8-git-send-email-wens@csie.org> <20160202121733.GO4455@sirena.org.uk>
 <CAGb2v657zYT30KbuK0fyVOmhv0kzJjj9gTsTFRaS4i3d6YhiHQ@mail.gmail.com>
 <20160208145347.GD7265@sirena.org.uk> <CAGb2v64ySLAVbPf_XaZnzm5T=SmQLip4iO2p4cGXg=C0=51eqA@mail.gmail.com>
 <20160208162244.GG7265@sirena.org.uk>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBKHY4W2QKGQE3U6RA3A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20160208162244.GG7265-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 9, 2016 at 12:22 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Feb 08, 2016 at 10:56:05PM +0800, Chen-Yu Tsai wrote:
>> On Mon, Feb 8, 2016 at 10:53 PM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> > On Sat, Feb 06, 2016 at 08:42:24PM +0800, Chen-Yu Tsai wrote:
>
>> >> Mark, may I assume you are OK with this DTS include listing
>> >> the regulators, even if their sections are empty?
>
>> > If it has no content why have it?
>
>> I'd like the regulator core to disable any unused ones. The core
>> considers regulators that don't have nodes as not having constraints,
>> and won't touch them.
>
>> Any other ways to do this? Or am I going about this the wrong way?
>
> The whole point with constraints is that they describe what is safe on a
> given board.  This includes powering off unused regulators - it should
> be something that the system integrator configures, not something that
> they get as default.

OK. So how should one describe a regulator as unused? Just leave it out
since it's not wired to anything? Or have an empty node at the board
level? One of the regulators involved on my board is by (hardware)
default on.

Thanks
ChenYu
