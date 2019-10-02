From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [RFC,V2,07/11] media: platform: Add Mediatek ISP P1 private
 control
Date: Wed, 2 Oct 2019 14:02:08 +0300
Message-ID: <20191002110207.GD972@paasikivi.fi.intel.com>
References: <jungo.lin@mediatek.com>
 <20190510015755.51495-8-jungo.lin@mediatek.com>
 <49a8ba54-aba4-1915-6732-987a58e8bd3c@xs4all.nl>
 <20191002105559.GC972@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20191002105559.GC972@paasikivi.fi.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: ryan.yu@mediatek.com, frankie.chiu@mediatek.com, laurent.pinchart+renesas@ideasonboard.com, Rynn.Wu@mediatek.com, suleiman@chromium.org, Jerry-ch.Chen@mediatek.com, Jungo Lin <jungo.lin@mediatek.com>, frederic.chen@mediatek.com, seraph.huang@mediatek.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, shik@chromium.org, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com, srv_heupstream@mediatek.com, sj.huang@mediatek.com, tfiga@chromium.org, christie.yu@mediatek.com, zwisler@chromium.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 02, 2019 at 01:55:59PM +0300, Sakari Ailus wrote:
> Hi Jungo, Hans,
> 
> On Mon, May 13, 2019 at 10:46:46AM +0200, Hans Verkuil wrote:
> > On 5/10/19 3:58 AM, Jungo Lin wrote:
> ...
> > > +struct v4l2_ctrl_config mtk_cam_controls[] = {
> > > +	{
> > > +	.ops = &mtk_cam_dev_ctrl_ops,
> > > +	.id = V4L2_CID_PRIVATE_GET_BIN_INFO,
> > 
> > Don't use "PRIVATE" in the name. I'd replace that with MTK to indicate
> > that this is mediatek-specific. Same for the next control below.
> > 
> > > +	.name = "MTK CAM GET BIN INFO",
> > > +	.type = V4L2_CTRL_TYPE_INTEGER,
> > > +	.min = (IMG_MIN_WIDTH << 16) | IMG_MIN_HEIGHT,
> > > +	.max = (IMG_MAX_WIDTH << 16) | IMG_MAX_HEIGHT,
> > > +	.step = 1,
> > > +	.def = (IMG_MAX_WIDTH << 16) | IMG_MAX_HEIGHT,
> > > +	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_VOLATILE,
> > 
> > Don't mix width and height. I recommend splitting this into two controls.
> > 
> > Sakari might have an opinion on this as well.
> > 
> > > +	},
> > > +	{
> > > +	.ops = &mtk_cam_dev_ctrl_ops,
> > > +	.id = V4L2_CID_PRIVATE_RAW_PATH,
> > > +	.name = "MTK CAM RAW PATH",
> > > +	.type = V4L2_CTRL_TYPE_BOOLEAN,
> > > +	.min = 0,
> > > +	.max = 1,
> > > +	.step = 1,
> > > +	.def = 1,
> > > +	},
> > 
> > RAW_PATH is a very vague name. If it is 0, then it is pure raw, and if it
> > is 1, then it is 'processing raw'? If so, call it "Processing Raw".
> 
> Jungo: what's the purpose of 

Please ignore the comment. I'll review a later version separately.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
