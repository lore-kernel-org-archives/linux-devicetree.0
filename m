From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: condor/v3hsk: add
 DU/LVDS/HDMI support
Date: Thu, 23 Aug 2018 19:10:18 +0300
Message-ID: <4ccb5cf2-b737-2f6a-e80c-1a8f15f20212@cogentembedded.com>
References: <95d0db34-713d-8206-00c2-ee9a42aab823@cogentembedded.com>
 <c78f1228-afb0-54cf-5d9e-5c812b678de3@cogentembedded.com>
 <2345061.kvOJ0NRlsT@avalon> <20180822095505.tobyblbwsg7rsvgo@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180822095505.tobyblbwsg7rsvgo@verge.net.au>
Content-Language: en-MW
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/22/2018 12:55 PM, Simon Horman wrote:

>>> Define the Condor/V3HSK board dependent parts of the DU and  LVDS device
>>> nodes. Also add the device nodes for Thine THC63LVD1024 LVDS decoder and
>>> Analog Devices ADV7511W HDMI transmitter...
>>>
>>> Based on the original (and large) patch by Vladimir Barinov.
>>>
>>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>
>>> ---
>>> Changes in version 2:
>>> - added the V3HSK DT update, reworded the description, renamed the patch;
>>> - added a space between the HDMI node name and a brace.
>>>
>>>  arch/arm64/boot/dts/renesas/r8a77980-condor.dts |  106 ++++++++++++++++++++
>>>  arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts  |  120 ++++++++++++++++++++
>>>  2 files changed, 226 insertions(+)
>>
>> I would have split that in two patchees.
> 
> I take your point but I think one is fine.

   Yeah, one patch here fits Arnd's criterion. :-)

> Sergei, will you address the other review items?

   Done, about to repost...

MBR, Sergei
