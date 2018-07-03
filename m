From: Luis Araneda <luaraneda@gmail.com>
Subject: Re: [RFC PATCH 5/5] arm: dts: zynq: remove "zynq" prefix from
 compatible property
Date: Tue, 3 Jul 2018 03:18:49 -0400
Message-ID: <CAHbBuxpuAC0PDfFBQ+D_zJu-AmWFNhEWCojr8LAWfO-ootLqEg@mail.gmail.com>
References: <20180628054205.17737-1-luaraneda@gmail.com> <20180628054205.17737-6-luaraneda@gmail.com>
 <042f6632-f4f6-d278-9859-b8998468c3bf@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <042f6632-f4f6-d278-9859-b8998468c3bf@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Michal,

On Thu, Jun 28, 2018 at 2:42 AM Michal Simek <michal.simek@xilinx.com> wrote:
> zynq name here is correct which is saying that hardblock is going to be
> described. Without it it is suggesting that hardblock is not used and it
> is for example on zybo with microblaze.

In my opinion, the zynq name is just adding redundant information to
the "xlnx,zynq-7000" value.
Taking the Zybo board, the current compatible property is:
> compatible = "digilent,zynq-zybo", "xlnx,zynq-7000";

I'm proposing to change it to:
> compatible = "digilent,zybo", "xlnx,zynq-7000";
(I know I must keep the old value too,  I'm simplifying)

In the case of a Zybo board with a microblaze, the property could be:
> compatible = "digilent,zybo", "xlnx,microblaze";

That would allow to differentiate between zynq and microblaze.

I have no problem on dropping the patch if you like. There might be
something that I'm not seeing or a use case that I'm missing.


Thanks,

Luis Araneda.
