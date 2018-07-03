From: Luis Araneda <luaraneda@gmail.com>
Subject: Re: [RFC PATCH 1/5] arm: dts: zynq: Set correct manufacturer for
 ZedBoard and MicroZed boards
Date: Tue, 3 Jul 2018 02:51:08 -0400
Message-ID: <CAHbBuxqXwaPL-mznVSkQ_nLdetj+StgiP6LjS1Qhq65aG_92EA@mail.gmail.com>
References: <20180628054205.17737-1-luaraneda@gmail.com> <20180628054205.17737-2-luaraneda@gmail.com>
 <d43b1758-cc0c-3a19-0d7d-f4773fe5caac@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d43b1758-cc0c-3a19-0d7d-f4773fe5caac@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Michal,

On Thu, Jun 28, 2018 at 2:37 AM Michal Simek <michal.simek@xilinx.com> wrote:
>
> On 28.6.2018 07:42, Luis Araneda wrote:
> Unfortunately we don't know who is parsing this string. It means please
> keep that origin compatible string there.
>
> I have no problem with this.
> compatible = "avnet,zynq-zed", "xlnx,zynq-zed", "xlnx,zynq-7000";

Ok, I'll change that for V2, and I'll keep it in mind for the rest of
the series too.


Thanks for reviewing,

Luis Araneda.
