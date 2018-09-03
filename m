From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: h5: Add device
 tree for Bananapi M2 Plus H5
Date: Mon, 3 Sep 2018 11:08:50 +0800
Message-ID: <CAGb2v65s19NEc5QFdS6udAg7wm3sys3UcoCxFuyjVVzxyKF4_w@mail.gmail.com>
References: <20180830080926.15027-1-wens@csie.org> <20180831101742.3ybvf6d3refft454@flea>
 <CAGb2v65+p-m90wj9MP9SP7x8xGUT2YLwJ-aiDgo9CW85YFSySg@mail.gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBUWLWLOAKGQEVIIN7IQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v65+p-m90wj9MP9SP7x8xGUT2YLwJ-aiDgo9CW85YFSySg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 3, 2018 at 11:05 AM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>
> On Fri, Aug 31, 2018 at 6:17 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > On Thu, Aug 30, 2018 at 04:09:23PM +0800, Chen-Yu Tsai wrote:
> > > Hi,
> > >
> > > Allwinner's H5 SoC is pin compatible with the H3 SoC. As such, some
> > > vendors produce H3 and H5 variants for the same device. Such is the
> > > case with Libre Computer's ALL-H3-CC, and the Bananapi M2 Plus.
> > >
> > > This series follows that of the ALL-H3-CC, splitting out a common
> > > board dtsi, and then two SoC-specific dts files that include the
> > > SoC level and common board dtsi's, as well as putting in the board
> > > name. The first patch is a minor fix that I think should be done
> > > before the migration.
> > >
> > > Please have a look.
> >
> > Acked-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>

Applied.

> > > Also, on a related matter, Bananapi recently released revision v1.2
> > > of the M2 Plus. The original commercially available version was v1.1.
> > > v1.2 adds a GPIO control that can change the CPU cores' supply voltage
> > > between 1.1V and 1.3V. Do we want two extra dts files for this? Put
> > > them in the existing dts files regardless? Or let people handle this
> > > via overlays?
> >
> > If that the sole change, I'd be inclined to merge it as a separate DT
> > for that particular version. Is there any way to detect it at runtime?
>
> It seems there isn't. The pin in both new and old revisions have an
> external pull-up with the same value, so it isn't possible to detect
> whether the pin is used or not. And there are no other changes between
> the two.
>
> ChenYu
