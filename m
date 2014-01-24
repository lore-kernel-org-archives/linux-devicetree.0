From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: moxart: move fixed rate clock child node to board
 level dts
Date: Thu, 23 Jan 2014 18:05:51 -0800
Message-ID: <20140124020551.GA17877@quad.lixom.net>
References: <1389886746-972-1-git-send-email-jonas.jensen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1389886746-972-1-git-send-email-jonas.jensen@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonas Jensen <jonas.jensen@gmail.com>
Cc: devicetree@vger.kernel.org, peter.crosthwaite@xilinx.com, linux@arm.linux.org.uk, arnd@arndb.de, linux-kernel@vger.kernel.org, arm@kernel.org, soren.brinkmann@xilinx.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 16, 2014 at 04:39:06PM +0100, Jonas Jensen wrote:
> When a skeleton "clocks { .. }" remain in .dtsi, the child node can
> be moved to .dts, "ref12" is then found by of_clk_get().
> 
> Signed-off-by: Jonas Jensen <jonas.jensen@gmail.com>

Applied to late/misc branch, will likely be included in 3.14-rc1


-Olof
