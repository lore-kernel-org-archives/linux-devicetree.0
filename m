From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 1/3] firmware: xilinx: Add reset API's
Date: Thu, 24 Jan 2019 10:43:09 +0100
Message-ID: <1548322989.6014.4.camel@pengutronix.de>
References: <20190125074654.10950-1-nava.manne@xilinx.com>
 <20190125074654.10950-2-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190125074654.10950-2-nava.manne@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nava kishore Manne <nava.manne@xilinx.com>, robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, rajanv@xilinx.com, jollys@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, chinnikishore369@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri, 2019-01-25 at 13:16 +0530, Nava kishore Manne wrote:
> This Patch Adds reset API's to support release, assert
> and status functionalities by using firmware interface.
> 
> Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>

Michal, Should I merge this through the reset tree together with the
reset driver?

regards
Philipp
