From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 0/2] Add R8A7792 DU support
Date: Thu, 18 Aug 2016 21:00:47 +0300
Message-ID: <31faa5c3-d65f-0c1f-b62d-7f1882d19728@cogentembedded.com>
References: <4031442.KeMCTMarLN@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4031442.KeMCTMarLN@wasted.cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: linux@arm.linux.org.uk, magnus.damm@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

On 08/05/2016 09:24 PM, Sergei Shtylyov wrote:

>    Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20160725-v4.7-rc7' tag. We're adding the R8A7792 DU clocks and
> device nodes. They have been tested on the Blanche board -- I'm not posting the
> Blanche patch only because it also has some strange interaction with the
> Ethernet chip, so that NFS root can't work anymore...

    Looks like this effect is confined to only one Blanche board, so I'm going 
to start posting the pending patches.

> [1/2] ARM: dts: r8a7792: add DU clocks
> [2/2] ARM: dts: r8a7792: add DU support

WBR, Sergei
