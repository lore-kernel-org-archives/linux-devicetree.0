From: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [SPAM]Re: [PATCH v3 4/5] dt-bindings: clock: mediatek: update
 audsys documentation to adapt MFD device
Date: Wed, 21 Feb 2018 14:04:08 +0800
Message-ID: <1519193048.18794.42.camel@mtkswgap22>
References: <cover.1518424204.git.ryder.lee@mediatek.com>
 <61928ad523a7aeffb8f16d4caad56836b65ae407.1518424204.git.ryder.lee@mediatek.com>
 <CAL_JsqJgo0pKJjrs2fdw+q=DJYwht0X5L3Bomz8gf98mEN7hkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqJgo0pKJjrs2fdw+q=DJYwht0X5L3Bomz8gf98mEN7hkg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, Garlic Tseng <garlic.tseng@mediatek.com>, Stephen Boyd <sboyd@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, linux-clk <linux-clk@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2018-02-19 at 12:29 -0600, Rob Herring wrote:
> On Mon, Feb 12, 2018 at 5:28 AM, Ryder Lee <ryder.lee@mediatek.com> wrote:
> > The MediaTek audio hardware block that exposes functionalities that are
> > handled by separate subsystems in the kernel.  These functions are all
> > mapped somewhere at 0x112xxxxx, and there are some control bits are mixed
> > up with other functions within the same registers.
> 
> I still don't think this change is necessary.
> 
> Just because a hardware block in DT maps to different subsystems in a
> particular OS doesn't mean you need a DT node for each OS subsystem.
> What we have subsystems for changes over time and DT shouldn't really
> be changing based on that. And DT is not the only way to instantiate
> drivers.
> 

Apart right now we have the definition of both functions. The other
location is here:../sonud/mt2701-afe-pcm.txt. The ways I could come up
with are:

1. Add a dummy MFD driver (need to think a new compatible or just use
'*-audsys' which has already been picked by clock driver) to instantiate
two sub-devices through id_table and mfd_cell.

2. For the sake of simplification - add a new compatible "simple-mfd".

3. The last thing - keep two nodes separated/independent. (x)

I'm not sure which one is better.



@Lee @Matthias: What do you suggest?

Ryder.
