From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 2/7] arm64: allwinner: h6: Add common
 orangepi nodes into dtsi
Date: Thu, 1 Nov 2018 15:20:32 +0800
Message-ID: <CAGb2v66v8akRfTHMCRYUZePwg9f9DdTVrX6G9-OOu1W_Sw6tOw@mail.gmail.com>
References: <20181031183634.29640-1-jagan@amarulasolutions.com>
 <20181031183634.29640-2-jagan@amarulasolutions.com> <CAGb2v66ALW1EL5+buporX8cPjkfpNdwGJEVUrC9Xpcmt3-NX7g@mail.gmail.com>
 <CAMty3ZCv9z=uALo-PShS-RegNt2cOwOHWE=6vsRVgPm9oOQ_Fw@mail.gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBUGS5LPAKGQEGOGG44Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAMty3ZCv9z=uALo-PShS-RegNt2cOwOHWE=6vsRVgPm9oOQ_Fw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: zhao_steven-Y9sIeH5OGRo@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 1, 2018 at 3:13 PM Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
>
> On Thu, Nov 1, 2018 at 8:23 AM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> >
> > On Thu, Nov 1, 2018 at 2:37 AM Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
> > >
> > > Orangepi H6 boards, One Plus and Lite2 shares common
> > > nodes like axp805, uart, mmc0 etc and the common differences
> > > between them is Ethernet is available in One Plus where
> > > as Wifi, USB3, CSI port is available in Lite2.
> >
> > You can claim this for pretty much all Allwinner boards, because they mostly
> > derive from the reference designs Allwinner's design houses put out. Yet we
> > don't do this for all of them. We do this for boards that are clearly derived
> > or extended from one another. One example would be the Orange Pi PC and PC Plus.
> >
> > Do you have any evidence to suggest so? This is not about common device nodes,
> > but a common hardware design.
>
> I got this information from hardware schematics and from Steven (added
> in to list), he too claimed the same.

Good. Please add that to the commit message. The vendor's intentions are as
important as the actual facts.

ChenYu
