From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2][RESEND] ARM: dts: Add big-endian in nor node for
 ls1021a
Date: Mon, 3 Sep 2018 07:58:14 +0800
Message-ID: <20180902235812.GS3850@dragon>
References: <20180828065936.8040-1-prabhakar.kushwaha@nxp.com>
 <20180828065936.8040-2-prabhakar.kushwaha@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180828065936.8040-2-prabhakar.kushwaha@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, leoyang.li@nxp.com, linux-arm-kernel@lists.infradead.org, robh@kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 28, 2018 at 12:29:35PM +0530, Prabhakar Kushwaha wrote:
> NOR and IFC controller connectivity is big-endian.
> So add big-endian field in nor device tree node allowing
> IFC controller to read/write data from/to the flash correctly.
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>

Applied both, thanks.
