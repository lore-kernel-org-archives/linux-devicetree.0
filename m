From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: sprd: fix typo in 'remote-endpoint'
Date: Wed, 23 May 2018 15:30:49 -0500
Message-ID: <CAL_JsqKrsTpgnLfxhcxeucpoh9NkyGwwZq82QUBgJZrdjGYQzg@mail.gmail.com>
References: <20180508150952.24562-1-robh@kernel.org>
 <20180508150952.24562-4-robh@kernel.org>
 <CAAfSe-tgKJvzCN6eHCuUR94ECSE8ypAR1eRjhV-VJNztebK9Xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAAfSe-tgKJvzCN6eHCuUR94ECSE8ypAR1eRjhV-VJNztebK9Xw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chunyan Zhang <zhang.lyra@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linaro.org>
Cc: DTML <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 8, 2018 at 8:58 PM, Chunyan Zhang <zhang.lyra@gmail.com> wrote:
> Hi Rob,
>
> On 8 May 2018 at 23:09, Rob Herring <robh@kernel.org> wrote:
>> dtc now warns on incomplete OF graph endpoint connections:
>>
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: Warning (graph_endpoint): /soc/stm@10006000/port/endpoint: graph connection to node '/soc/funnel@10001000/ports/port@2/endpoint' is not bidirectional
>>
>> The cause is a typo in 'remote-endpoint'.
>
> Thanks for fixing this and,
>
> Acked-by: Chunyan Zhang <zhang.lyra@gmail.com>

Is someone going to apply this? Still seeing warnings in linux-next.

Rob
