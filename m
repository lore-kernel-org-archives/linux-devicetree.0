From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Subject: RE: [PATCH 0/2] Add R8A77970/Eagle CAN-FD support
Date: Fri, 27 Apr 2018 09:46:19 +0000
Message-ID: <TY2PR01MB19620E4689C0B881B540E4D4C38D0@TY2PR01MB1962.jpnprd01.prod.outlook.com>
References: <4e5216bc-5f1b-ace4-1aea-02269cd206ac@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4e5216bc-5f1b-ace4-1aea-02269cd206ac@cogentembedded.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

Thank you for your patch. 
Could you also update the dt bindings please? A separate patch or part of this series.

> Subject: [PATCH 0/2] Add R8A77970/Eagle CAN-FD support
> 
> Hello!
> 
> Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
> 'renesas-devel-20180426-v4.17-rc2' tag. We're adding the R8A77970 CAN-FD
> device node and then enable single chnanel CAN-FD support on the Eagle
> board.
> 
> [1/2] arm64: dts: renesas: r8a77970: add CAN-FD support
> [2/2] arm64: dts: renesas: eagle: add CAN-FD support
> 
> WBR, Sergei

Thanks,
Ramesh
