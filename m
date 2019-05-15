From: Jungo Lin <jungo.lin@mediatek.com>
Subject: Re: [RFC,V2,01/11] dt-bindings: mt8183: Add binding for ISP Pass 1
 reserved memory
Date: Wed, 15 May 2019 21:02:55 +0800
Message-ID: <1557925375.5721.7.camel@mtksdccf07>
References: <jungo.lin@mediatek.com>
 <20190510015755.51495-2-jungo.lin@mediatek.com>
 <20190514195052.GA3314@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190514195052.GA3314@bogus>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: ryan.yu@mediatek.com, frankie.chiu@mediatek.com, laurent.pinchart+renesas@ideasonboard.com, Rynn.Wu@mediatek.com, suleiman@chromium.org, Jerry-ch.Chen@mediatek.com, hans.verkuil@cisco.com, frederic.chen@mediatek.com, seraph.huang@mediatek.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, shik@chromium.org, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com, srv_heupstream@mediatek.com, sj.huang@mediatek.com, tfiga@chromium.org, christie.yu@mediatek.com, zwisler@chromium.org
List-Id: devicetree@vger.kernel.org

Hi Rob:

Thanks for your comments.

On Tue, 2019-05-14 at 14:50 -0500, Rob Herring wrote:
> On Fri, May 10, 2019 at 09:57:47AM +0800, Jungo Lin wrote:
> > This patch adds the binding for describing the reserved
> > shared memory used to exchange ISP configuration and tuning
> > data between the co-processor and Pass 1 (P1) unit of the
> > camera ISP system on Mediatek SoCs.
> > 
> > Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> > ---
> >  .../mediatek,reserve-memory-cam-smem.txt      | 42 +++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-cam-smem.txt
> 
> See my comments on the other 2 camera related reserved-memory bindings.
> 

Ok, we will align DIP & FD drivers's implementation.

Best regards,

Jungo

> Rob
