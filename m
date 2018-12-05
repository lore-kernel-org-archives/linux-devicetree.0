From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: vf: Fix memory node duplication
Date: Wed, 5 Dec 2018 15:54:03 +0800
Message-ID: <20181205075401.GO3987@dragon>
References: <1543625092-24498-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1543625092-24498-1-git-send-email-festevam@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, stefan@agner.ch
List-Id: devicetree@vger.kernel.org

On Fri, Nov 30, 2018 at 10:44:52PM -0200, Fabio Estevam wrote:
> Boards based on vf500/vf600 have duplicate memory nodes:
> 
> - One coming from the board dts file: memory@
> 
> - One coming from the vf500.dtsi/vf610m4.dtsi files.
> 
> Fix the duplication by removing the memory node from the dtsi file
> and by adding 'device_type = "memory";' in the board dts.
> 
> Reported-by: Rob Herring <robh@kernel.org>

Applied, thanks.
