From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the sound tree with the arm-soc tree
Date: Mon, 25 Feb 2019 14:38:50 +0100
Message-ID: <CAK8P3a2Q7OAAYCU01TNpHR2SM7N=YunyqZEihSESnQwxzL5=Vg@mail.gmail.com>
References: <20190225123615.49bce7cd@canb.auug.org.au> <CAK8P3a3moJ12SDM3Ow-Hw3qBeTv9siswK+9pPiEA4JJ+7k4xvg@mail.gmail.com>
 <s5hr2bw2k7m.wl-tiwai@suse.de> <e2aaed45-0fb1-c9c8-76d4-3b97b36cada6@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e2aaed45-0fb1-c9c8-76d4-3b97b36cada6@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>
Cc: Takashi Iwai <tiwai@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, ARM <linux-arm-kernel@lists.infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, DTML <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 25, 2019 at 12:24 PM Sameer Pujar <spujar@nvidia.com> wrote:
> On 2/25/2019 4:44 PM, Takashi Iwai wrote:
> > On Mon, 25 Feb 2019 10:19:15 +0100, Arnd Bergmann wrote:
> >> On Mon, Feb 25, 2019 at 2:36 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >> I see this property being used in commit c0bde003a013 ("ALSA:
> >> hda/tegra: sound card name from device tree"), which removes
> >> a questionable use of the root compatible property, replacing
> >> it with the new 'nvidia,model' property. We don't do this for any
> >> other subsystem, so why does the sound subsystem export
> >> information about the board as a string here?
> > The sound subsystem exports merely some understandable name string
> > for the given sound card object, and that was composed from the
> > compatible string in the past, which turned out to be useless on some
> > configs.
> >
> > But this kind of addition is an extremely bad manner, I'm fine to
> > revert these (at best with a better alternative).  This isn't about
> > any functionality but rather some readable information that isn't a
> > part of API.

It is not extremely bad, but it is at the minimum surprising.

> The motivation for adding custom sound card name is following,
> 1. When for boards, multiple HDMI/DP ports are exposed, it is sometimes
>     necessary to know the default port or any customization for that matter.
>     Audio userspace can distinguish based on the sound card names.
> 2. Multiple sound cards can coexist for a platform, the indication of
> particular
>     audio path is useful.
> 3. It can help to customize audio paths.
>     Generally people use "*,model" property in DT to name the sound complex.
>     Ex: "samsung,model" [sound/soc/samsung/snow.c]
>         "rockchip,model" [sound/soc/rockchip/rockchip_rt5645.c]

I see, I had not noticed those before. They do seem a little unusual,
and inconsistent, as the samsung sames are always names the board
there, but rockchip doesn't: one board names it just "I2C", the other
one uses "VEYRON-I2S", and the example in the documentation lists
"ROCKCHIP-I2S" and "Analog audio output", each of them following
different naming systems.

In Documentation/devicetree/bindings/sound/qcom,apq8096.txt, a
"qcom,model" property is listeds as "Obsolete", and replaced by
a "model" property. This is in turn also used on amlogic, freescale,
and some samsung platforms.

My impression here is that the idea of passing a model name
through DT is well established, but for new stuff, we probably
want to standardize on plain "model" rather than "$vendor,model".

       Arnd
