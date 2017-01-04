From: Lee Jones <lee.jones@linaro.org>
Subject: Re: mbox-name vs. mbox-names (was: Re: [PATCH v4 1/5] mailbox: dt:
 Supply bindings for ST's Mailbox IP)
Date: Wed, 4 Jan 2017 16:04:06 +0000
Message-ID: <20170104160406.GE24225@dell>
References: <CAMuHMdXqOZ=eKJ=SkY4TM=fu8qnZ2gLmh-2iH0jB2pAu_v2vNg@mail.gmail.com>
 <20161024084107.GD14477@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161024084107.GD14477@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel@stlinux.com, Maxime Coquelin <maxime.coquelin@st.com>, Jassi Brar <jassisinghbrar@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, 24 Oct 2016, Lee Jones wrote:

> On Fri, 21 Oct 2016, Geert Uytterhoeven wrote:
> 
> > On Fri, Oct 16, 2015 at 9:21 AM, Lee Jones <lee.jones@linaro.org> wrote:
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  .../devicetree/bindings/mailbox/sti-mailbox.txt    | 51 ++++++++++++++++++++++
> > >  1 file changed, 51 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mailbox/sti-mailbox.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt b/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt
> > > new file mode 100644
> > > index 0000000..b61eec9
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt
> > > @@ -0,0 +1,51 @@
> > > +ST Microelectronics Mailbox Driver
> > > +
> > > +Each ST Mailbox IP currently consists of 4 instances of 32 channels.  Messages
> > > +are passed between Application and Remote processors using shared memory.
> > > +
> > > +Controller
> > > +----------
> > > +
> > > +Required properties:
> > > +- compatible           : Should be "st,stih407-mailbox"
> > > +- reg                  : Offset and length of the device's register set
> > > +- mbox-name            : Name of the mailbox
> > 
> > All other mailbox drivers use "mbox-names". Oops, it's in v4.9-rc1...
> > 
> > Can we still fix that?
> 
> So long as all the fixes; changes to the driver and DT are merged in a
> single kernel release, we can change it.

Scrap that, change of plan. Actually current code is correct.

mbox-name does not have the same functionality as mbox-names.

mbox-names is a client-side property used to request channels, where
as mbox-name is used to provide a better user-readable name other than
mailbox{0..x}.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
