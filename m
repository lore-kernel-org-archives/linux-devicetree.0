From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH 5/5] ARM: dts: sun7i: Add dts file for
 Wits Pro A20 DKT
Date: Sat, 1 Aug 2015 01:28:01 +0800
Message-ID: <CAGb2v64_QzUwVcj4guDBuVTasW=sc3OnTkmArfTtog+=--omww@mail.gmail.com>
References: <1438333194-21181-1-git-send-email-hdegoede@redhat.com>
 <1438333194-21181-6-git-send-email-hdegoede@redhat.com> <20150731102028.GE2564@lukather>
 <CAGb2v65TEogqYFAfen1VnOaiepvez5t8Oh+Q=OYsRS_aZUMO3A@mail.gmail.com> <20150731165655.GG2564@lukather>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBN7A52WQKGQE3MW2SXA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150731165655.GG2564@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Jelle de Jong <jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 1, 2015 at 12:56 AM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Fri, Jul 31, 2015 at 06:25:29PM +0800, Chen-Yu Tsai wrote:
>> > Note that it's a bit of a pain for now to support such cases, as
>> > there's nothing to tie something from the DT to an SDIO device. I
>> > don't have a better solution than marking it always-on at the moment,
>> > with a big FIXME comment on top... :/
>>
>> One could use the mmc-pwr-seq stuff. I don't know if it has been
>> extended for multiple GPIOs, not that you would need it in this use
>> case.
>
> It doesn't really improve the situation. It doesn't handle the
> regulators, it doesn't allow the real driver to get its resources
> either, basically, it's just a hack.

Yeah, it's still lacking support for upstream regulators, like LDOs
from the PMICs.

>> Maybe we ought to fix up the other ones, like the CubieTruck and A31
>> Hummingbird?
>
> I'll do it.

Thanks


ChenYu
