From: Yixun Lan <yixun.lan@amlogic.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: reset: Add AXG AO Clock and Reset
 Bindings
Date: Fri, 23 Mar 2018 22:06:27 +0800
Message-ID: <dffeba58-1326-1dbd-38fc-c3b0f51d9c73@amlogic.com>
References: <20180209070026.193879-1-yixun.lan@amlogic.com>
 <20180209070026.193879-2-yixun.lan@amlogic.com>
 <CAOFm3uFj-7kZNp6b3SerOzQ8Amfa5Usod+MxwvZJ1E1Z_V9VJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOFm3uFj-7kZNp6b3SerOzQ8Amfa5Usod+MxwvZJ1E1Z_V9VJA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philippe Ombredanne <pombredanne@nexb.com>
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, yixun.lan@amlogic.com, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Hi Philippe

On 02/09/2018 07:07 PM, Philippe Ombredanne wrote:
> On Fri, Feb 9, 2018 at 8:00 AM, Yixun Lan <yixun.lan@amlogic.com> wrote:
>> Add dt-bindings headers for the Meson-AXG's AO clock and
>> reset controller.
>>
>> CC: <devicetree@vger.kernel.org>
>> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
>> ---
>>  include/dt-bindings/clock/axg-aoclkc.h | 26 ++++++++++++++++++++++++++
>>  include/dt-bindings/reset/axg-aoclkc.h | 20 ++++++++++++++++++++
>>  2 files changed, 46 insertions(+)
>>  create mode 100644 include/dt-bindings/clock/axg-aoclkc.h
>>  create mode 100644 include/dt-bindings/reset/axg-aoclkc.h
>>
>> diff --git a/include/dt-bindings/clock/axg-aoclkc.h b/include/dt-bindings/clock/axg-aoclkc.h
>> new file mode 100644
>> index 000000000000..78683abb4247
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/axg-aoclkc.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD) */
> 
> nit... BSD is not a valid license id as documented in LICENSES [1] :
> please use one of these:
> BSD-2-Clause or BSD-3-Clause
> 
> Thank you!
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/LICENSES/preferred
> 


  Thanks for the hint

  I'll update to BSD-3-Clause, since this license is just a copy from
previous gxbb-aoclkc.h file.

Yixun
