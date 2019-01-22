From: Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: gnss: add mediatek binding
Date: Tue, 22 Jan 2019 18:25:52 +0800
Message-ID: <1548152752.24552.17.camel@mtkswgap22>
References: <1547744074-28308-1-git-send-email-lollivier@baylibre.com>
 <1547744074-28308-3-git-send-email-lollivier@baylibre.com>
 <20190121171019.GA2903@bogus> <86imyhapl9.fsf@baylibre.com>
 <CAGp9LzpgZDEdKFH4ZLqxtO60unxXRJoXNsGugNT=oojHDMp+3g@mail.gmail.com>
 <86imyh13kb.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <86imyh13kb.fsf@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Loys Ollivier <lollivier@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Sean Wang <sean.wang@kernel.org>, Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 2019-01-22 at 09:47 +0100, Loys Ollivier wrote:
> On Mon 21 Jan 2019 at 18:44, Sean Wang wrote:
> 
> > On Mon, Jan 21, 2019 at 9:29 AM Loys Ollivier <lollivier@baylibre.com> 
> > wrote:
> >>
> >>
> >> On Mon 21 Jan 2019 at 17:10, Rob Herring wrote:
> >>
> >> > On Thu, 17 Jan 2019 17:54:32 +0100, Loys Ollivier wrote:
> >> >> Add binding for Mediatek-based GNSS receivers.
> >> >>
> >> >> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
> >> >> ---
> >> >>
> >> >> v2:
> >> >> Renamed bindings from Globaltop/gtop to Mediatek/mtk.
> >> >> Moved current-speed as an optional propertie.
> >> >> Removed the status line in the example.
> >> >> Added "mediatek,mt3339" compatible.
> >> >>
> >> >>  .../devicetree/bindings/gnss/mediatek.txt          | 39
> >> >>  ++++++++++++++++++++++
> >> >>  1 file changed, 39 insertions(+)
> >> >>  create mode 100644 Documentation/devicetree/bindings/gnss/mediatek.txt
> >> >>
> >> >
> >> > Reviewed-by: Rob Herring <robh@kernel.org>
> >>
> >> Thanks Rob,
> >> If there are no objections by others, I'll stop sending these two patch
> >> (1/4 and 2/4) and reference any new patch serie for 3 and 4 as depending
> >> on those two.
> >>
> >
> > Hi Loys,
> >
> > Thanks for adding the first GPS device driver. It's really nice to see
> > more device drivers added to upstream support.
> >
> Hi Sean,
> 
> Glad to know you're supporting this initiative.
> 
> > Do you mind send the series again with Cc linux-mediatek@lists.infradead.org 
> > ?
> >
> The series already has linux-mediatek@lists.infradead.org in Cc. Does it
> need a resend ?
> 

It doesn't need a resend, it's my mistake. thanks for clarifying soon.

> > Sean
> >
> >> --
> >> -L
> >>
> >> _______________________________________________
> >> Linux-mediatek mailing list
> >> Linux-mediatek@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 
> 
