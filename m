From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 2/2] ARM: Dove: Add the audio device to the Cubox DT
Date: Sun, 01 Sep 2013 11:26:54 +0200
Message-ID: <140d8d8a23f.2784.107cef0f820c2f5d7b7f41463071c310@gmail.com>
References: <20130828113521.35c53365@armhf>
 <521DCD80.9010105@gmail.com>
 <20130831125128.0e3a23c7@armhf>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130831125128.0e3a23c7@armhf>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Francois Moine <moinejf@free.fr>
Cc: linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jean-Francois,
Sorry for the messy reply, posting from mobile.

Can you please try <&si5351 1>, iirc audio ist connected to it. I will =
also=20
look it up later.

Sebastian



On August 31, 2013 12:51:28 PM Jean-Francois Moine <moinejf@free.fr> wr=
ote:
> On Wed, 28 Aug 2013 12:14:24 +0200
> Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com> wrote:
>
> > > +&i2s1 {
> > > +	status =3D "okay";
> > > +	pinctrl-0 =3D <&pmx_audio1_i2s1_spdifo>;
> > > +	pinctrl-names =3D "default";
> > > +};
> > Please also add the external clock connected from si5351.
>
> Hi Sebastian and Russell,
>
> I tried it on my Cubox (<&si5351 2>), and I have problems with HDMI
> output and some audio streams like webradios with sample rates 32 or
> 22.05 kHz.
>
> According to the Dove specification, the audio controller works with
> the samples rates 44.1, 48 and 96 kHz, so, I don't see the usage of t=
he
> external clock, except when using the two audio controllers with
> different sample rates.
>
> But, BTW, as the kirkwood-i2 driver is written, this last case does n=
ot
> work: for 44.1, 48 and 96 kHz, the external clock is never used and
> there is only one DCO.
>
> --
> Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
> Jef		|		http://moinejf.free.fr/
