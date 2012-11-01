From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 5/9] document: devicetree: bind pinconf with pin-single
Date: Wed, 31 Oct 2012 17:25:07 -0700
Message-ID: <20121101002506.GI15766@atomide.com>
References: <1350922139-3693-1-git-send-email-haojian.zhuang@gmail.com>
 <1350922139-3693-6-git-send-email-haojian.zhuang@gmail.com>
 <5085CC3F.30708@wwwdotorg.org>
 <CAN1soZy8xXGs8zEiZV0kV0dGVdXfZ9ogx83sFgPG76d0i8yH4A@mail.gmail.com>
 <5091A5AA.7000207@wwwdotorg.org>
 <CAN1soZyc8Kox__yOER82Oe5OtaLJWYAoMzgWGhEonTfdf11MqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAN1soZyc8Kox__yOER82Oe5OtaLJWYAoMzgWGhEonTfdf11MqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [121031 15:53]:
> On Wed, Oct 31, 2012 at 11:26 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> >
> > But that tends to imply that adding support for generic pinconf into the
> > pinctrl-simple driver isnt' actually going to be useful for anyone. If
> > pinctrl-single only supports some part of your HW, how can you use it?
> > Or, do you intend to somehow make pinctrl-single support both the common
> > generic pinconf stuff, and somehow be extensible to support any
> > SoC-specific pin config fields?
> 
> I'm intend to make pinctrl-single to support both the common generic pinconf
> stuff and any SoC-specific pinconf. I'll try to handle it. But they
> won't be included
> in V3.

The easiest way to support generic pinconf in pinctrl-single.c
is to set up a separate driver instance for the register ranges
that need it. Otherwise things can get messy.

Regards,

Tony
