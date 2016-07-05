From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 0/2] Add R8A7792 GPIO support
Date: Wed, 6 Jul 2016 00:10:04 +0300
Message-ID: <66e88d8f-9260-f159-3ea4-b03428675216@cogentembedded.com>
References: <2706182.6XMBucurvj@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2706182.6XMBucurvj@wasted.cogentembedded.com>
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

On 07/05/2016 12:10 AM, Sergei Shtylyov wrote:

>    Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20160704-v4.7-rc6' tag. We're adding the R8A7792 GPIO clocks and
> device nodes. These patches depend on the R8A7792/Blanche PFC patchset in order
> to compile and on the R8a7792 PFC driver patchset in order to work properly.

> [1/2] ARM: dts: r8a7792: add GPIO clocks
> [2/2] ARM: dts: r8a7792: add GPIO support

    Didn't run checkpatch.pl on this one. If I did, it would have found the 
stray spaces in the 1st patch, and undocumented binding in the 2nd...
    Will repost RSN!

WBR, Sergei
