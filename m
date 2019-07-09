From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 0/5]Add support for mt2701 JPEG ENC support
Date: Tue, 9 Jul 2019 15:46:07 +0200
Message-ID: <79316488-30fd-7ff3-7598-d29f85f663ab@xs4all.nl>
References: <20190709032103.10291-1-xia.jiang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190709032103.10291-1-xia.jiang@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Xia Jiang <xia.jiang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On 7/9/19 5:20 AM, Xia Jiang wrote:
> This patchset add support for mt2701 JPEG ENC support.
> 
> This is the compliance test result for jpeg dec and enc.
> 
> The JPEG dec log:
> ------------------------------------------------------------
> v4l2-compliance -d /dev/video0
> v4l2-compliance SHA: 08fed4d0edb1492b91d9d1054c36fed95c372eaa, 32 bits

Hmm, the SHA indicates that you are using an old v4l2-compliance version.
Please get the latest code from the v4l-utils git repo.

<snip>

> Buffer ioctls:
>                 fail: v4l2-test-buffers.cpp(713): q.create_bufs(node, 1, &fmt) != EINVAL

This should be fixed: this test tries to create a buffer of half the minimum
size, and the driver doesn't check that it is too small.

Ditto for the encoder.

Regards,

	Hans
