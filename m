From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [RFC,
 v3 9/9] media: platform: Add Mediatek ISP P1 shared memory device
Date: Fri, 26 Jul 2019 16:42:36 +0900
Message-ID: <CAAFQd5CXwRm-3jD+rfNNDNLH=gT_i0QYSAG3XBo3SJnPTY56_w@mail.gmail.com>
References: <jungo.lin@mediatek.com>
 <20190611035344.29814-1-jungo.lin@mediatek.com>
 <20190611035344.29814-10-jungo.lin@mediatek.com>
 <20190701072532.GB137710@chromium.org>
 <1562297618.1212.46.camel@mtksdccf07>
 <CAAFQd5BaTQ-Q7gsE0X+d4_81OZq9WHaCYkmALt7_4A1JFo=_8g@mail.gmail.com>
 <1562313579.1212.73.camel@mtksdccf07>
 <CAAFQd5AaNFpMGCVJREY85n8UetEwd99TOka8-ECoLzMbMkos_g@mail.gmail.com>
 <1563870117.1212.455.camel@mtksdccf07>
 <CAAFQd5Bh80N+cMhz=eyHUGJLaE5uuypOawQvHrTgGSMDvmcpLA@mail.gmail.com>
 <20190726074116.GA19745@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190726074116.GA19745@infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christoph Hellwig <hch@infradead.org>
Cc: devicetree@vger.kernel.org, =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <sean.cheng@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <rynn.wu@mediatek.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>, Rob Herring <robh@kernel.org>, =?UTF-8?B?UnlhbiBZdSAo5L2Z5a2f5L+uKQ==?= <ryan.yu@mediatek.com>, =?UTF-8?B?RnJhbmtpZSBDaGl1ICjpgrHmloflh7Ep?= <frankie.chiu@mediatek.com>, Hans Verkuil <hverkuil@xs4all.nl>, Jungo Lin <jungo.lin@mediatek.com>, Sj Huang <sj.huang@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, ddavenport@chromium.org, =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= <frederic.chen@mediatek.com>, list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.o
List-Id: devicetree@vger.kernel.org

On Fri, Jul 26, 2019 at 4:41 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Jul 26, 2019 at 02:15:14PM +0900, Tomasz Figa wrote:
> > Could you try dma_get_sgtable() with the SCP struct device and then
> > dma_map_sg() with the P1 struct device?
>
> Please don't do that.  dma_get_sgtable is a pretty broken API (see
> the common near the arm implementation) and we should not add more
> users of it.  If you want a piece of memory that can be mapped to
> multiple devices allocate it using alloc_pages and then just map
> it to each device.

Thanks for taking a look at this thread.

Unfortunately that wouldn't work. We have a specific reserved memory
pool that is the only memory area accessible to one of the devices.
Any idea how to handle this?

Best regards,
Tomasz
