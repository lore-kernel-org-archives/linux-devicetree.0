From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Urgent PATCH] arm64: dts: uniphier: fix IRQ trigger type of
 ARMv8 timer
Date: Thu, 11 Aug 2016 08:44:48 +0200
Message-ID: <4943063.JrVaCOJD4r@wuerfel>
References: <1470039140-3801-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNAQo6Si9q0FQw=3i67yGO1JYuDxHBB=xsLZOj8S-TBG_Rg@mail.gmail.com>
 <CAK7LNAT5D0HmvpVPnX1oFw=KJSOavVjXT6ECHBuTOhNaKpdQLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK7LNAT5D0HmvpVPnX1oFw=KJSOavVjXT6ECHBuTOhNaKpdQLg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, arm@kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thursday, August 11, 2016 11:25:30 AM CEST Masahiro Yamada wrote:
> 2016-08-01 17:26 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:

> >>> I could do this after -rc1 is out because it is apparently a
> >>> bug fix, but in that case the for-next branch in ASOC will be
> >>> broken for me, which would make bisect-ability difficult for me.
> >>
> >> I have a patch that addresses all platforms in one go (there is really
> >> no point in fixing one at a time for a bug that is so widespread).
> >>
> >> I'll repost it later today.
> >>
> >
> > That'll be fine.
> > Thank you!
> >
> >
> > Arnd, Olof:
> > Please disregard this one.
> >
> 
> Oh Dear.
> Did you apply this one?
> 
> This was replaced with Marc'one:
> https://patchwork.kernel.org/patch/9254183/

Thanks for letting me know so quickly of my mistake, I was able
to back out the commit from the fixes branch as it was right at
the top.

	Arnd
