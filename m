From: mtk12025 <xia.jiang@mediatek.com>
Subject: Re: [PATCH 0/5]Add support for mt2701 JPEG ENC support
Date: Thu, 18 Jul 2019 11:19:39 +0800
Message-ID: <1563419979.20220.12.camel@mhfsdcap03>
References: <20190709032103.10291-1-xia.jiang@mediatek.com>
         <79316488-30fd-7ff3-7598-d29f85f663ab@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <79316488-30fd-7ff3-7598-d29f85f663ab@xs4all.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

Dear Hans,
Thank you for your reply.

PATCH v2 has used the latest v4l2-compliance version for test.

PATCH v2 has fixed the compliance test fail, and the driver checked the
buffer size in queue_setup function.

I am sorry for existence of change-id caused by my mistake in the new
patch.

Best Regards,
Xia Jiang
