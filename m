From: Hanjie Lin <hanjie.lin@amlogic.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: PCI: meson: add DT bindings for
 Amlogic Meson PCIe controller
Date: Wed, 19 Dec 2018 18:57:48 +0800
Message-ID: <e3cce5d7-354c-4042-bf76-c22f3893d72c@amlogic.com>
References: <1545120286-129258-1-git-send-email-hanjie.lin@amlogic.com>
 <1545120286-129258-2-git-send-email-hanjie.lin@amlogic.com>
 <CAFBinCD1x7jcJJx78yNx87MOmKQ2HuSBeRpDRQE0hyNCwm1JAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCD1x7jcJJx78yNx87MOmKQ2HuSBeRpDRQE0hyNCwm1JAg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Yixun Lan <yixun.lan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Shawn Lin <shawn.lin@rock-chips.com>, Philippe Ombredanne <pombredanne@nexb.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Yue Wang <yue.wang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, Liang Yang <liang.yang@amlogic.com>, Cyrille Pitchen <cyrille.pitchen@free-electrons.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org



On 2018/12/19 7:14, Martin Blumenstingl wrote:
> Hi Rob, Hi Hanjie,
> 
> (sorry for being late with my question)
> 
> On Tue, Dec 18, 2018 at 9:05 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
> [...]
>> +- reg-names: Must be
>> +       - "elbi"        External local bus interface registers
>> +       - "cfg"         Meson specific registers
>> +       - "phy"         Meson PCIE PHY registers
> I have learned that there are two PHY register designs:
> - AXG only has a PCIe PHY
> - G12A has a PHY which supports PCIe and USB 3.0. The PCIe part of
> this PHY design is compatible with AXG, but this design also supports
> a USB 3.0 port (it's an exclusive choice: either PCIe *or* USB 3.0)
> 
> The PCIe controller itself is identical on both, AXG and G12A.
> This patch adds support for the AXG PCIe controller and PHY within one
> device-tree node.
> 
> For G12A I propose to add a separate "phys" property with a phandle to
> the "combo" PCIe and USB3.0 PHY - this can be part of a separate patch
> though.
> I would like to know whether it's OK that for AXG the PCIe PHY is
> described in the same device-tree node as the PCIe controller (in
> other words: we're not using a "phys" property here)?
> 
> 
> Kind Regards
> Martin
> 
> .
> 

hi matrin,

We do had a dedicated PHY driver for a time at the begining
of this patch series, but we decided to remove it and integrate
into the controller driver after series reviews and disscussions,
and the main reason is it's too overkill to have a dedicated 
PHY driver which only do the RESET job.

Of course we can consider the dedicated PHY driver for G12A upstream
in future.

thanks
hanjie
