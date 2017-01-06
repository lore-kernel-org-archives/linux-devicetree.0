From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH 2/2] media: rc: add driver for IR remote receiver on MT7623
 SoC
Date: Fri, 06 Jan 2017 12:43:46 +0900
Message-ID: <20170106034346.7njhyhtsc4yado5c@gangnam.samsung>
References: <1483632384-8107-1-git-send-email-sean.wang@mediatek.com>
 <CGME20170105160810epcas3p1b7a85197c15fbbe87e08c736259935d6@epcas3p1.samsung.com>
 <1483632384-8107-3-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-disposition: inline
In-reply-to: <1483632384-8107-3-git-send-email-sean.wang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sean.wang@mediatek.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ivo.g.dimitrov.75@gmail.com, keyhaede@gmail.com, sean@mess.org, mchehab@osg.samsung.com, linux-kernel@vger.kernel.org, hverkuil@xs4all.nl, hdegoede@redhat.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Sean,

> +	ir->rc = rc_allocate_device();

Yes, you should use devm_rc_allocate_device(...)

Besides, standing to this patch which is not in yet:

https://lkml.org/lkml/2016/12/18/39

rc_allocate_device should provide the driver type during
allocation, so it should be:

	ir->rc = rc_allocate_device(RC_DRIVER_IR_RAW);

and this line can be removed:

> +	ir->rc->driver_type = RC_DRIVER_IR_RAW;

I don't know when Mauro will take the patch above.

Andi
