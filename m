From: Bill Pringlemeir <bpringle@sympatico.ca>
Subject: Re: [PATCH 4/4] ARM: dts: vf610-twr: relicense vf610-twr.dts under
 GPLv2/X11
Date: Tue, 24 Nov 2015 09:28:30 -0500
Message-ID: <87io4rv5dd.fsf@sympatico.ca>
References: <1448323302-23563-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1448323302-23563-1-git-send-email-stefan@agner.ch> (Stefan
 Agner's message of "Mon, 23 Nov 2015 16:01:42 -0800")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Agner <stefan@agner.ch>
Cc: devicetree@vger.kernel.org, Fugang Duan <B38611@freescale.com>, Cosmin Stoica <cosminstefan.stoica@freescale.com>, Chao Fu <B44548@freescale.com>, Xiubo Li <Li.Xiubo@freescale.com>, Jingchang Lu <b35083@freescale.com>, Cory Tusar <cory.tusar@pid1solutions.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 23 Nov 2015, stefan@agner.ch wrote:

> GPLv2-only devicetrees make reuse difficult for software components
> licensed under a different license.
>
> The consensus is that a GPL/X11 dual-license should allow all
> necessary uses, so relicense the vf610-twr.dts file to this
> combination.
>
> CCs were acquired using (updated some email addresses):
> git shortlog -sne --no-merges arch/arm/boot/dts/vf610-twr.dts
>
> CC: Bill Pringlemeir <bpringle@sympatico.ca>

Acked-by: Bill Pringlemeir <bpringle@sympatico.ca>

> CC: Chao Fu <B44548@freescale.com>
> CC: Cory Tusar <cory.tusar@pid1solutions.com>
> CC: Cosmin Stoica <cosminstefan.stoica@freescale.com>
> CC: Fugang Duan <B38611@freescale.com>
> CC: Jingchang Lu <b35083@freescale.com>
> CC: Shawn Guo <shawnguo@kernel.org>
> CC: Xiubo Li <Li.Xiubo@freescale.com>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> arch/arm/boot/dts/vf610-twr.dts | 40
> ++++++++++++++++++++++++++++++++++++---- 1 file changed, 36
> insertions(+), 4 deletions(-)
