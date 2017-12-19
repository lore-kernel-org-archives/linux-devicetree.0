From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: mailbox: Introduce Hi3660 controller
 binding
Date: Tue, 19 Dec 2017 17:30:38 -0600
Message-ID: <20171219233038.mjkqakshn7ud7ise@rob-hp-laptop>
References: <1513682145-19892-1-git-send-email-zhongkaihua@huawei.com>
 <1513682145-19892-2-git-send-email-zhongkaihua@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1513682145-19892-2-git-send-email-zhongkaihua@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kaihua Zhong <zhongkaihua@huawei.com>
Cc: mark.rutland@arm.com, xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, jassisinghbrar@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, guodong.xu@linaro.org, haojian.zhuang@linaro.org, suzhuangluan@hisilicon.com, xuezhiliang@hisilicon.com, kevin.wangtao@hisilicon.com
List-Id: devicetree@vger.kernel.org

On Tue, Dec 19, 2017 at 07:15:43PM +0800, Kaihua Zhong wrote:
> From: Leo Yan <leo.yan@linaro.org>
> 
> Introduce a binding for the Hi3660 mailbox controller, the mailbox is
> used within application processor (AP), communication processor (CP),
> HIFI and MCU, etc.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  .../bindings/mailbox/hisilicon,hi3660-mailbox.txt  | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt

Please add acks when posting new versions.
