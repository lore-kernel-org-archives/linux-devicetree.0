From: Sean Young <sean@mess.org>
Subject: Re: [PATCH 2/2] media: rc: add driver for IR remote receiver on
 MT7623 SoC
Date: Mon, 9 Jan 2017 12:39:42 +0000
Message-ID: <20170109123942.GA15215@gofer.mess.org>
References: <1483632384-8107-1-git-send-email-sean.wang@mediatek.com>
 <1483632384-8107-3-git-send-email-sean.wang@mediatek.com>
 <20170105171240.GA9136@gofer.mess.org>
 <1483687885.16976.19.camel@mtkswgap22>
 <20170108211624.GB7866@gofer.mess.org>
 <1483931601.16976.48.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1483931601.16976.48.camel@mtkswgap22>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ivo.g.dimitrov.75@gmail.com, keyhaede@gmail.com, mchehab@osg.samsung.com, linux-kernel@vger.kernel.org, andi.shyti@samsung.com, hverkuil@xs4all.nl, hdegoede@redhat.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Jan 09, 2017 at 11:13:21AM +0800, Sean Wang wrote:
> I had another question. I found multiple and same IR messages being
> received when using SONY remote controller. Should driver needs to
> report each message or only one of these to the upper layer ?

In general the driver shouldn't try to change any IR message, this should
be done in rc-core if necessary.

rc-core should handle this correctly. If the same key is received twice
within IR_KEYPRESS_TIMEOUT (250ms) then it not reported to the input
layer.

Thanks
Sean
