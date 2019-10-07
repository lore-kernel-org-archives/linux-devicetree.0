From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH] media: dt-bindings: media: Fixup Allwinner A10 CSI binding
Date: Mon, 7 Oct 2019 15:45:29 +0530
Message-ID: <CAP245DXT=HL+m-LqoC25EBnOaPmF1pUW0fEZp6EZB-MdgOJoWw@mail.gmail.com>
References: <b47ec7088aa4b07458519ab151de92df552a9302.1570101510.git.amit.kucheria@linaro.org>
 <20191003115154.6f2jgj3dnqsved2y@gilmour> <CAHLCerNoLyQ-e70=1VMPO_J_amA+-2vtHwfoUabo4dhUWj-H0A@mail.gmail.com>
 <20191007100535.6gp6b3h6ueyeln3b@gilmour>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007100535.6gp6b3h6ueyeln3b@gilmour>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lakml <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 7, 2019 at 3:35 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> On Sat, Oct 05, 2019 at 04:15:57PM +0530, Amit Kucheria wrote:
> > On Thu, Oct 3, 2019 at 5:22 PM Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > Hi,
> > >
> > > On Thu, Oct 03, 2019 at 04:52:24PM +0530, Amit Kucheria wrote:
> > > > This new binding fails dt_binding_check due to a typo. Fix it up.
> > > >
> > > > linux.git/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml: $id: path/filename 'arm/allwinner,sun4i-a10-csi.yaml' doesn't match actual filename
> > > > linux.git/Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts' failed
> > > > make[2]: *** [Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts] Error 1
> > > > make[2]: *** Waiting for unfinished jobs....
> > > > linux.git/Makefile:1284: recipe for target 'dt_binding_check' failed
> > > > make[1]: *** [dt_binding_check] Error 2
> > > >
> > > > Fixes: c5e8f4ccd7750 ("media: dt-bindings: media: Add Allwinner A10 CSI binding")
> > > > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > >
> > > Thanks for your patch.
> > >
> > > It has already been submitted though:
> > > https://lore.kernel.org/linux-arm-kernel/1568808060-17516-1-git-send-email-pragnesh.patel@sifive.com/
> > >
> > > I'm not sure why it hasn't been applied yet though :/
> >
> > Perhaps a Fixes tag will allow more attention to it?
>
> I've added a fixes tag and merged it through the sunxi tree.
>
> Sorry for the time it took, and thanks for sending that fix!

Will it get merged for -rc2?
