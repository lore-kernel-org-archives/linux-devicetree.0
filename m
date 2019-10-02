From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [RFC PATCH V3 5/5] media: platform: mtk-mdp3: Add struct
 tuning_addr and img_sw_buffer
Date: Wed, 2 Oct 2019 12:21:43 +0300
Message-ID: <20191002092143.GP896@valkosipuli.retiisi.org.uk>
References: <20190909192244.9367-1-frederic.chen@mediatek.com>
 <20190909192244.9367-6-frederic.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190909192244.9367-6-frederic.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: frederic.chen@mediatek.com
Cc: laurent.pinchart+renesas@ideasonboard.com, Rynn.Wu@mediatek.com, Allan.Yang@mediatek.com, suleiman@chromium.org, Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com, hans.verkuil@cisco.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, holmes.chiou@mediatek.com, shik@chromium.org, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com, srv_heupstream@mediatek.com, sj.huang@mediatek.com, tfiga@chromium.org, christie.yu@mediatek.com, zwisler@chromium.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 10, 2019 at 03:22:44AM +0800, frederic.chen@mediatek.com wrote:
> From: Frederic Chen <frederic.chen@mediatek.com>
> 
> We added a struct tuning_addr which contains a field "present"
> so that the driver can tell the firmware if we have user tuning
> dataor not.
> 
> The strcut img_sw_buffer is also added. This struct has no cpu address
> field and uses a handle instead so that we don't pass a cpu address
> to co-processor.
> 
> Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>

If the driver depends on this patch, it needs to come before the driver.

-- 
Sakari Ailus
